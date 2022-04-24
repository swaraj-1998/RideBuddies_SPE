package ridecreator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbData;
import riderequestor.RequestDto;

public class RideDao {

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;

	@SuppressWarnings("finally")
	public boolean createRide(RideDto dto) {
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into Ride(endLat,endLng,startLat,startLng,endLoc,mobile,phone,startLoc,vehType,endTime,startTime,people,price) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setDouble(1,dto.getEndLat());
			ps.setDouble(2,dto.getEndLng());
			ps.setDouble(3,dto.getStartLat());
			ps.setDouble(4,dto.getStartLng());
			ps.setString(5,dto.getEndLoc());
			ps.setString(6,dto.getMobile());
			ps.setString(7,dto.getPhone());
			ps.setString(8,dto.getStartLoc());
			ps.setString(9,dto.getVehType());
			ps.setInt(10,dto.getEndTime());
			ps.setInt(11,dto.getStartTime());
			ps.setInt(12,dto.getPeople());
			ps.setInt(13, dto.getPrice());
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in createRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}

	@SuppressWarnings("finally")
	public boolean deleteRide(String phone) {
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from Ride where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,phone);
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}

	@SuppressWarnings("finally")
	public ArrayList<RideDto> viewAllRide() {
		ArrayList<RideDto> list = new ArrayList<>();
		RideDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from Ride";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new RideDto();
				dto.setEndLoc(rs.getString("endLoc"));
				dto.setEndTime(rs.getInt("endTime"));
				dto.setMobile(rs.getString("mobile"));
				dto.setPeople(rs.getInt("people"));
				dto.setPhone(rs.getString("phone"));
				dto.setStartLoc(rs.getString("startLoc"));
				dto.setStartTime(rs.getInt("startTime"));
				dto.setVehType(rs.getString("vehType"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception in viewAllRide : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return list;
		}
	}

	@SuppressWarnings("finally")
	public RideDto viewRide(String phone) {
		RideDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from Ride where phone = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new RideDto();
				dto.setEndLoc(rs.getString("endLoc"));
				dto.setEndTime(rs.getInt("endTime"));
				dto.setMobile(rs.getString("mobile"));
				dto.setPeople(rs.getInt("people"));
				dto.setPhone(rs.getString("phone"));
				dto.setStartLoc(rs.getString("startLoc"));
				dto.setStartTime(rs.getInt("startTime"));
				dto.setVehType(rs.getString("vehType"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			System.out.println("Exception in deleteRide : "+e);
		} finally {
			rs=null;
			ps = null;
			con = null;
			return dto;
		}
	}

	@SuppressWarnings("finally")
	public ArrayList<RideDto> searchRide(String origin,String dest){
		ArrayList<RideDto> list = new ArrayList<>();
		RideDto dtoo = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from Ride where startLoc=? || endLoc=?";
			ps = con.prepareStatement(query);
			ps.setString(1, origin);
			ps.setString(2, dest);
			rs= ps.executeQuery();
			while(rs.next()) {
				dtoo = new RideDto();
				dtoo.setEndLoc(rs.getString("endLoc"));
				dtoo.setEndTime(rs.getInt("endTime"));
				dtoo.setMobile(rs.getString("mobile"));
				dtoo.setPeople(rs.getInt("people"));
				dtoo.setPhone(rs.getString("phone"));
				dtoo.setStartLoc(rs.getString("startLoc"));
				dtoo.setStartTime(rs.getInt("startTime"));
				dtoo.setVehType(rs.getString("vehType"));
				dtoo.setPrice(rs.getInt("price"));
				list.add(dtoo);
			}
		} catch (Exception e) {
			System.out.println("Exception in searchRide : "+e);
		} finally {
			rs= null;
			ps = null;
			con = null;
			return list;
		}
	}

	@SuppressWarnings("finally")
	public ArrayList<RideDto> searchRideLatLng(double startLat,double startLng,double endLat,double endLng){
		ArrayList<RideDto> list = new ArrayList<>();
		RideDto dtoo = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from Ride where "
					+ "((startLat between ? and ?) and (startLng between ? and ?))"
					+ " or "
					+ "((endLat between ? and ?) and (endLng between ? and ?))";
			ps = con.prepareStatement(query);
			ps.setDouble(1,startLat-10);
			ps.setDouble(2,startLat+10);
			ps.setDouble(3,startLng-10);
			ps.setDouble(4,startLng+10);
			ps.setDouble(5,endLat-10);
			ps.setDouble(6,endLat+10);
			ps.setDouble(7,endLng-10);
			ps.setDouble(8,endLng+10);
			rs= ps.executeQuery();
			while(rs.next()) {
				dtoo = new RideDto();
				dtoo.setEndLoc(rs.getString("endLoc"));
				dtoo.setEndTime(rs.getInt("endTime"));
				dtoo.setMobile(rs.getString("mobile"));
				dtoo.setPeople(rs.getInt("people"));
				dtoo.setPhone(rs.getString("phone"));
				dtoo.setStartLoc(rs.getString("startLoc"));
				dtoo.setStartTime(rs.getInt("startTime"));
				dtoo.setVehType(rs.getString("vehType"));
				dtoo.setPrice(rs.getInt("price"));
				list.add(dtoo);
			}
		} catch (Exception e) {
			System.out.println("Exception in searchRide : "+e);
		} finally {
			rs= null;
			ps = null;
			con = null;
			return list;
		}
	}

	public static void main(String[] args) {
		ArrayList<RideDto> list = new RideDao().searchRideLatLng(95, 95,0,0);
		for(RideDto dto : list) {
			System.out.println(dto.getPrice());
		}
		
	}
}
