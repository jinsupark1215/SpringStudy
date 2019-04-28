package edu.ssafy.safefood.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Member;

@Repository("MemberDAOImpl")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public boolean add(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "insert into member (id, pw, name, addr, phone, allergy) values (?, ?, ?, ?, ?, ?)";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, m.getId());
//			pstmt.setString(2, m.getPw());
//			pstmt.setString(3, m.getName());
//			pstmt.setString(4, m.getAddr());
//			pstmt.setString(5, m.getPhone());
//
//			String[] allergy = m.getAllergy();
//			StringBuilder sb = new StringBuilder();
//			if (allergy.length != 0) {
//				for (int i = 0; i < allergy.length - 1; i++) {
//					sb.append(allergy[i]).append(", ");
//				}
//				sb.append(allergy[allergy.length - 1]);
//			}
//			pstmt.setString(6, sb.toString());
//
//			pstmt.execute();
//			return true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			DBCPUtil.close(pstmt, conn);
//		}
		return false;
	}

	@Override
	public String logIn(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "select id from member where id = ? and pw = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			pstmt.setString(2, pw);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				return rs.getString("id");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			DBCPUtil.close(rs, pstmt, conn);
//		}
		return null;
	}

	@Override
	public boolean update(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "update member set pw = ?, name = ?, addr = ?, phone = ?, allergy = ? where id = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, m.getPw());
//			pstmt.setString(2, m.getName());
//			pstmt.setString(3, m.getAddr());
//			pstmt.setString(4, m.getPhone());
//
//			String[] allergy = m.getAllergy();
//			StringBuilder sb = new StringBuilder();
//			if (allergy.length != 0) {
//				for (int i = 0; i < allergy.length - 1; i++) {
//					sb.append(allergy[i]).append(",");
//				}
//				sb.append(allergy[allergy.length - 1]);
//			}
//			pstmt.setString(5, sb.toString());
//
//			pstmt.setString(6, m.getId());
//			pstmt.execute();
//
//			System.out.println("id = " + m.getId());
//			System.out.println("pw = " + m.getPw());
//			System.out.println("name = " + m.getName());
//			System.out.println("addr = " + m.getAddr());
//			System.out.println("phone = " + m.getPhone());
//			System.out.println("allergy = " + sb.toString());
//			return true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			DBCPUtil.close(pstmt, conn);
//		}
		return false;
	}

	@Override
	public boolean delete(String id, String pw) {
		String checkId = logIn(id, pw);
		if (checkId == null) {
			return false;
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "delete from member where id = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, checkId);
//			pstmt.execute();
//			return true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			DBCPUtil.close(pstmt, conn);
//		}
		return false;
	}

	@Override
	public Member getInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "select id, pw, name, addr, phone, allergy from member where id = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//
//			Member find = null;
//			while (rs.next()) {
//				find = new Member();
//				find.setId(rs.getString("id"));
//				find.setPw(rs.getString("pw"));
//				find.setName(rs.getString("name"));
//				find.setAddr(rs.getString("addr"));
//				find.setPhone(rs.getString("phone"));
//				String[] allergy = rs.getString("allergy").split(",");
//				find.setAllergy(allergy);
//				return find;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			DBCPUtil.close(rs, pstmt, conn);
//		}
		return null;
	}

	@Override
	public Member findPw(String id, String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "select id, pw, name, addr, phone, allergy from member where id = ? and name = ? and phone = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			pstmt.setString(2, name);
//			pstmt.setString(3, phone);
//			rs = pstmt.executeQuery();
//
//			Member find = null;
//			while (rs.next()) {
//				find = new Member();
//				find.setId(rs.getString("id"));
//				find.setPw(rs.getString("pw"));
//				find.setName(rs.getString("name"));
//				find.setAddr(rs.getString("addr"));
//				find.setPhone(rs.getString("phone"));
//				String[] allergy = rs.getString("allergy").split(",");
//				find.setAllergy(allergy);
//				return find;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			DBCPUtil.close(rs, pstmt, conn);
//		}
		return null;
	}
}