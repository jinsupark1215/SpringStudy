package edu.ssafy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.ssafy.board.dto.Member;

@Repository("MemberRepositoryImplDataSource")
public class MemberRepositoryImplDataSource implements MemberRepository {
	private static final Logger logger = LoggerFactory.getLogger(MemberRepositoryImplDataSource.class);

	@Autowired
	private DataSource ds;
	
	@Autowired
	private JdbcTemplate dbtem;
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	@Override
	public void insert(Member m) {
		dbtem.update("insert into member (id, pw, name, addr) values (?, ?, ?, ?)", new Object[]{m.getId(), m.getPw(), m.getName(), m.getAddr()});
//		try {
//			conn = ds.getConnection();
//			String query = "insert into member (id, pw, name, addr) values (?, ?, ?, ?)";
//			stmt = conn.prepareStatement(query);
//			stmt.setString(1, m.getId());
//			stmt.setString(2, m.getPw());
//			stmt.setString(3, m.getName());
//			stmt.setString(4, m.getAddr());
//			stmt.execute();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.closeConnection(stmt, conn);
//		}
	}

	@Override
	public void update(Member m) {
		try {
			conn = ds.getConnection();
			String query = "update member set pw = ?, name = ?, addr = ? where id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, m.getPw());
			stmt.setString(2, m.getName());
			stmt.setString(3, m.getAddr());
			stmt.setString(4, m.getId());
			stmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(stmt, conn);
		}
	}

	@Override
	public void delete(String id) {
		try {
			conn = ds.getConnection();
			String query = "delete from member where id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(stmt, conn);
		}
	}

	@Override
	public List<Member> list() {
		ArrayList<Member> list = new ArrayList<Member>();
		Member m = null;
		try {
			conn = ds.getConnection();
			String sql = "select id, name, addr from member";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				m = new Member();
				m.setId(rs.getString("id"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				list.add(m);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public Member get(String id) {
		try {
			conn = ds.getConnection();
			String query = "select id, pw, name, addr from member where id = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			Member find = null;
			while (rs.next()) {
				find = new Member();
				find.setId(id);
				find.setPw(rs.getString("pw"));
				find.setName(rs.getString("name"));
				find.setAddr(rs.getString("addr"));
				return find;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public Member logIn(String id, String pw) {
		try {
			conn = ds.getConnection();
			String query = "select id, name, addr from member where id = ? and pw = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			rs = stmt.executeQuery();

			Member find = null;
			while (rs.next()) {
				find = new Member();
				find.setId(id);
				find.setName(rs.getString("name"));
				find.setAddr(rs.getString("addr"));
				return find;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.closeConnection(rs, stmt, conn);
		}
		return null;
	}

}
