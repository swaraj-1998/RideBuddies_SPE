package riderequestor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbData;

public class RequestDao {

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	@SuppressWarnings("finally")
	public boolean addRequest(RequestDto dto) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into Request(creater,requester,status) values(?,?,?)";
			ps= con.prepareStatement(query);
			ps.setString(1, dto.getCreater());
			ps.setString(2, dto.getRequester());
			ps.setString(3, dto.getStatus());
			
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in add Request : "+e);
		} finally {
			ps = null;
			con =null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean delRequest(RequestDto dto) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from Request where creater = ? and requester = ? and status = ?";
			ps= con.prepareStatement(query);
			ps.setString(1, dto.getCreater());
			ps.setString(2, dto.getRequester());
			ps.setString(3, dto.getStatus());
			
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in del Request : "+e);
		} finally {
			ps = null;
			con =null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean delAllRequest(String creater) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from Request where creater = ?";
			ps= con.prepareStatement(query);
			ps.setString(1, creater);
			
			if(ps.executeUpdate()>0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in delAllRequest : "+e);
		} finally {
			ps = null;
			con =null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public String viewStatus(String creater,String requester) {
		String status = null;
		try {
			if(con == null) {
				con=DbData.getConnection();
			}
			String query = "Select status from Request where creater = ? and requester = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			ps.setString(2, requester);
			rs = ps.executeQuery();
			while(rs.next()) {
				status = rs.getString("status");
			}
		} catch (Exception e) {
			System.out.println("Exception in viewStatus : "+e);
		} finally {
			rs= null;
			ps = null;
			con = null;
			return status;
		}
	}
	
	@SuppressWarnings("finally")
	public RequestDto viewMyRequest(String requester){
		RequestDto dto = null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from Request where requester=?";
			ps= con.prepareStatement(query);
			ps.setString(1, requester);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto = new RequestDto();
				dto.setCreater(rs.getString("creater"));
				dto.setRequester(rs.getString("requester"));
				dto.setStatus(rs.getString("status"));
			}
		} catch(Exception e) {
			System.out.println("Exception in viewMyRequest : "+e);
		} finally {
			rs = null;
			ps = null;
			con = null;
			return dto;
		}
	}
	
	@SuppressWarnings("finally")
	public ArrayList<RequestDto> viewAllRequest(String creater){
		ArrayList<RequestDto> list = new ArrayList<>();
		RequestDto dto;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Select * from Request where creater=?";
			ps= con.prepareStatement(query);
			ps.setString(1, creater);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto = new RequestDto();
				dto.setCreater(rs.getString("creater"));
				dto.setRequester(rs.getString("requester"));
				dto.setStatus(rs.getString("status"));
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("Exception in viewAllRequest : "+e);
		} finally {
			rs = null;
			ps = null;
			con = null;
			return list;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean acceptRequest(String creater,String requester) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Update Request set status=? where creater=? and requester=?";
			ps = con.prepareStatement(query);
			ps.setString(1, "accept");
			ps.setString(2, creater);
			ps.setString(3, requester);
			if(ps.executeUpdate()>=0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in accept Request : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean declineRequest(String creater,String requester) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "update Request set status=? where creater=? and requester=?";
			ps = con.prepareStatement(query);
			ps.setString(1, "decline");
			ps.setString(2, creater);
			ps.setString(3, requester);
			if(ps.executeUpdate()>=0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in decline Request : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public boolean delOtherRequest(String creater,String requester) {
		boolean flag = false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "delete from Request where creater=? and requester!=? and status != ?";
			ps = con.prepareStatement(query);
			ps.setString(1, "accept");
			ps.setString(2, creater);
			ps.setString(3, requester);
			if(ps.executeUpdate()>=0) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("Exception in del Other Request : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}
	
	@SuppressWarnings("finally")
	public RequestDto findAccReq(String creater) {
		RequestDto dto=null;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query="Select * from Request where creater = ? and status = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			ps.setString(2, "accept");
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new RequestDto();
				dto.setCreater(rs.getString("creater"));
				dto.setRequester(rs.getString("requester"));
				dto.setStatus("status");
			}
		} catch (Exception e) {
			System.out.println("Exception in findAccReq : "+e);
		} finally {
			rs = null;
			ps = null;
			con = null;
			return dto;
		}
	}
	
}
