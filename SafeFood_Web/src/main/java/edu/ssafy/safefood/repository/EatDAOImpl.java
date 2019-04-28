package edu.ssafy.safefood.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Eat;

@Repository("EatDAOImpl")
public class EatDAOImpl implements EatDAO {

	@Override
	public ArrayList<Eat> getEat(String id) {
		ArrayList<Eat> eat = new ArrayList<Eat>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "select code, count, date from eat where id = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				eat.add(new Eat(rs.getInt("code"), rs.getInt("count"), rs.getString("date")));
//			}
//			if(eat.isEmpty()) {
//				System.out.println("섭취 정보 비어있음");
//				return null;
//			} else {
//				System.out.println("섭취 정보 있음");
//				return eat;
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
	public boolean add(String id, Eat eat) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "insert into eat (id, code, count, date) values (?, ?, ?, ?)";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			pstmt.setInt(2, eat.getCode());
//			pstmt.setInt(3, eat.getCount());
//			pstmt.setString(4, eat.getDate());
//			pstmt.execute();
//			System.out.println("섭취정보 추가 성공");
//			return true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			System.out.println("섭취정보 추가 실패");
//			return false;
//		} finally {
//			DBCPUtil.close(pstmt, conn);
//		}
		return false;
	}

	@Override
	public boolean delete(String id, Eat eat) {
		
		return false;
	}

	@Override
	public boolean update(String id, Eat eat) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "update eat set count = ? where id = ? and code = ? and date = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, eat.getCount());
//			pstmt.setString(2, id);
//			pstmt.setInt(3, eat.getCode());
//			pstmt.setString(4, eat.getDate());
//			pstmt.execute();
//			System.out.println("섭취정보 수정 성공");
//			return true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			System.out.println("섭취정보 수정 실패");
//			return false;
//		} finally {
//			DBCPUtil.close(pstmt, conn);
//		}
		return false;
	}

}