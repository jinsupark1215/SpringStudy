package edu.ssafy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.board.dto.Board;

@Repository("BoardRepositoryImpl")
public class BoardRepositoryImpl implements BoardRepository{
	
	@Autowired
	private DataSource ds;
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	@Override
	public void insert(Board b) {
		try {
			conn = ds.getConnection();
			String query = "insert into board (title, writer, content, regdate) values (?, ?, ?, curdate())";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, b.getTitle());
			stmt.setString(2, b.getWriter());
			stmt.setString(3, b.getContent());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(stmt, conn);
		}
	}

	@Override
	public void update(Board b) {
		try {
			conn = ds.getConnection();
			String query = "update board set title = ?, content = ?, regdate = curdate() where seq = ?";
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, b.getTitle());
			stmt.setString(2, b.getContent());
			stmt.setInt(3, b.getSeq());
			stmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(stmt, conn);
		}
	}

	@Override
	public void delete(int seq) {
		try {
			conn = ds.getConnection();
			String query = "delete from board where seq = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, seq);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(stmt, conn);
		}
	}

	@Override
	public List<Board> list() {
		ArrayList<Board> list = new ArrayList<Board>();
		Board b = null;
		try {
			conn = ds.getConnection();
			String sql = "select seq, title, writer, regdate, cnt from board order by cnt desc";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				b = new Board();
				b.setSeq(rs.getInt("seq"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setRegDate(rs.getString("regdate"));
				b.setCnt(rs.getInt("cnt"));
				list.add(b);
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
	public List<Board> getByKeyword(String keyword) {
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			conn = ds.getConnection();
			String query = "select seq, title, writer, regdate, cnt from board where title like ? order by cnt desc";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, "%"+keyword+"%");
			rs = stmt.executeQuery();

			Board b = null;
			while (rs.next()) {
				b = new Board();
				b.setSeq(rs.getInt("seq"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setRegDate(rs.getString("regdate"));
				b.setCnt(rs.getInt("cnt"));
				list.add(b);
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
	public List<Board> getById(String id) {
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			conn = ds.getConnection();
			String query = "select seq, title, writer, regdate, cnt from board where writer = ? order by cnt desc";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			Board b = null;
			while (rs.next()) {
				b = new Board();
				b.setSeq(rs.getInt("seq"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setRegDate(rs.getString("regdate"));
				b.setCnt(rs.getInt("cnt"));
				list.add(b);
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
	public Board get(int seq) {
		try {
			conn = ds.getConnection();
			String query = "update board set cnt = cnt + 1 where seq = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, seq);
			stmt.execute();
			stmt.close();
			
			query = "select seq, title, writer, content, regdate, cnt from board where seq = ?";
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();

			Board b = null;
			while (rs.next()) {
				b = new Board();
				b.setSeq(rs.getInt("seq"));
				b.setTitle(rs.getString("title"));
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setRegDate(rs.getString("regdate"));
				b.setCnt(rs.getInt("cnt"));
				return b;
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