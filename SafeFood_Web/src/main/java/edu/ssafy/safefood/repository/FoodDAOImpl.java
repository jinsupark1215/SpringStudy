package edu.ssafy.safefood.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ssafy.safefood.dto.Food;

@Repository("FoodDAOImpl")
public class FoodDAOImpl implements FoodDAO {
	
	@Autowired
	private static FoodDAOImpl foodDAO;
	private ArrayList<Food> list = new ArrayList<Food>(); // 푸드 리스트
	private String[] searchType = {};

	private ArrayList<Food> getSearch(String query) {
		ArrayList<Food> list = new ArrayList<Food>();
		System.out.println("getList strt");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

//		try {
//			conn = DBCPUtil.getConnection();
//			stmt = conn.prepareStatement(query);
//			rs = stmt.executeQuery();
//
//			Food tmp = null;
//			while (rs.next()) {
//				tmp = new Food();
//				tmp.setCode(rs.getInt("code"));
//				tmp.setName(rs.getString("name"));
//				tmp.setSupportpereat(rs.getDouble("supportpereat"));
//				tmp.setCarbo(rs.getDouble("carbo"));
//				tmp.setProtein(rs.getDouble("protein"));
//				tmp.setFat(rs.getDouble("fat"));
//				tmp.setSugar(rs.getDouble("sugar"));
//				tmp.setNatrium(rs.getDouble("natrium"));
//				tmp.setChole(rs.getDouble("chole"));
//				tmp.setFattyacid(rs.getDouble("fattyacid"));
//				tmp.setTransfat(rs.getDouble("transfat"));
//				tmp.setMaker(rs.getString("maker"));
//				tmp.setMaterial(rs.getString("material"));
//				tmp.setImg(rs.getString("img"));
//				tmp.setCalory(rs.getDouble("calory"));
//				list.add(tmp);
//			}
//			return list;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBCPUtil.close(rs, stmt, conn);
//		}
		return null;
	}

	@Override
	public ArrayList<Food> getList() {
		String query = "select * from food";
		return getSearch(query);
	}

	@Override
	public ArrayList<Food> getSearchList(int type, String searchWord) {
		// TODO Auto-generated method stub
		ArrayList<Food> list = new ArrayList<Food>();
		System.out.println("getSearch strt");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

//		try {
//			conn = DBCPUtil.getConnection();
//			String query = "";
//			if (type == 1) {
//				query = "select * from food where name like '%" + searchWord + "%'";
//			} else if (type == 2) {
//				query = "select * from food where maker like '%" + searchWord + "%'";
//			} else if (type == 3) {
//				query = "select * from food where material like '%" + searchWord + "%'";
//			} else {
//				query = "select * from food";
//			}
//
//			stmt = conn.prepareStatement(query);
//			rs = stmt.executeQuery();
//
//			Food tmp = null;
//			while (rs.next()) {
//				tmp = new Food();
//				tmp.setCode(rs.getInt("code"));
//				tmp.setName(rs.getString("name"));
//				tmp.setSupportpereat(rs.getDouble("supportpereat"));
//				tmp.setCarbo(rs.getDouble("carbo"));
//				tmp.setProtein(rs.getDouble("protein"));
//				tmp.setFat(rs.getDouble("fat"));
//				tmp.setSugar(rs.getDouble("sugar"));
//				tmp.setNatrium(rs.getDouble("natrium"));
//				tmp.setChole(rs.getDouble("chole"));
//				tmp.setFattyacid(rs.getDouble("fattyacid"));
//				tmp.setTransfat(rs.getDouble("transfat"));
//				tmp.setMaker(rs.getString("maker"));
//				tmp.setMaterial(rs.getString("material"));
//				tmp.setImg(rs.getString("img"));
//				tmp.setCalory(rs.getDouble("calory"));
//				list.add(tmp);
//			}
//			return list;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBCPUtil.close(rs, stmt, conn);
//		}
		return null;
	}
}
