package complete;
//For Webhook Testing 1
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DbData;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import user.UserDao;

public class CompleteDao {
	private static final Logger logger = LogManager.getLogger(CompleteDao.class);
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;

	@SuppressWarnings("finally")
	public ArrayList<String> viewCompleted(String creater,String requester) {
		logger.info("[VIEW - COMPLETED] - " + creater + " " + requester);
		ArrayList<String> list = new ArrayList<>();
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select status from CompletedRide where creater = ? and requester=?";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			ps.setString(2, requester);

			rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.getString("status").equals("pending")) {
					list.add(rs.getString("status"));
				}
			}
		} catch (Exception e) {
			System.out.println("Exception in viewCompleted : "+e);
		} finally {
			ps = null;
			con = null;
			return list;
		}
	}
	@SuppressWarnings("finally")
	public boolean completeRide(String creater,String requester) {
		logger.info("[COMPLETE - RIDE] - " + creater + " " + requester);
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Insert into CompletedRide(creater,requester,status) values(?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			ps.setString(2, requester);
			ps.setString(3, "pending");
			if(ps.executeUpdate()>0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in completeRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}

	@SuppressWarnings("finally")
	public boolean completeRideUpdate(String creater,String requester) {
		logger.info("[COMPLETE - RIDE UPDATE] - " + creater + " " + requester);
		boolean flag=false;
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "Update CompletedRide set status=? where creater=? and requester=? and status=?";
			ps = con.prepareStatement(query);
			ps.setString(1, "completed");
			ps.setString(2, creater);
			ps.setString(3, requester);
			ps.setString(4, "pending");
			if(ps.executeUpdate()>0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in completeRide : "+e);
		} finally {
			ps = null;
			con = null;
			return flag;
		}
	}

	@SuppressWarnings("finally")
	public ArrayList<String> viewRideGiven(String creater) {
		logger.info("[VIEW - RIDE GIVEN] - " + creater);
		ArrayList<String> list = new ArrayList<>();
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from CompletedRide where creater = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, creater);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("requester"));
			}
		} catch (Exception e) {
			System.out.println("Exception in viewRideGiven : "+e);
		} finally {
			ps = null;
			con = null;
			return list;
		}
	}

	@SuppressWarnings("finally")
	public ArrayList<String> viewRideTaken(String requester) {
		logger.info("[VIEW - RIDE TAKEN] - " + requester);
		ArrayList<String> list = new ArrayList<>();
		try {
			if(con == null) {
				con = DbData.getConnection();
			}
			String query = "select * from CompletedRide where requester = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, requester);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("creater"));
			}
		} catch (Exception e) {
			System.out.println("Exception in viewRideTaken : "+e);
		} finally {
			ps = null;
			con = null;
			return list;
		}
	}

}
