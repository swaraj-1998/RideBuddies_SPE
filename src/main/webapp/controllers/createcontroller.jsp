
<%@page import="java.util.ArrayList"%>
<%@page import="riderequestor.RequestDto"%>
<%@page import="riderequestor.RequestDao"%>
<%@page import="ridecreator.RideDto"%>
<%@page import="ridecreator.RideDao"%>
<%
	if (session.getAttribute("phone") == null) {
		response.sendRedirect("index.jsp?msg=loginfirst");
	}
	String type = request.getParameter("type");
	if (type != null) {
		if (type.equals("create")) {
			String startLat = request.getParameter("startLat");
			String startLng = request.getParameter("startLng");
			String endLat = request.getParameter("endLat");
			String endLng = request.getParameter("endLng");
			String startLoc = request.getParameter("startLoc");
			String endLoc = request.getParameter("endLoc");
			String vehType = request.getParameter("vehType");
			String mobile = request.getParameter("mobile");
			int startTime = Integer.parseInt(request.getParameter("startTime"));
			int endTime = Integer.parseInt(request.getParameter("endTime"));
			int people = Integer.parseInt(request.getParameter("people"));
			int price = Integer.parseInt(request.getParameter("price"));
			String phone = (String) session.getAttribute("phone");
			if (/* startLat != null && startLng != null && endLng != null && endLat != null && */ startLoc != null
					&& endLoc != null && vehType != null && mobile != null && startTime > 00 && endTime > 00
					&& people > 0 && phone != null && price >= 0) {
				RideDto dto = new RideDao().viewRide(phone);
				RequestDto list = new RequestDao().viewMyRequest(phone);
				if (dto == null) {
					if (list == null) {
						dto = new RideDto();
						dto.setEndLoc(endLoc);
						dto.setEndTime(endTime);
						/* dto.setEndLat(Double.parseDouble(endLat));
						dto.setEndLng(Double.parseDouble(endLng));
						dto.setStartLat(Double.parseDouble(startLat));
						dto.setStartLng(Double.parseDouble(startLng)); */
						dto.setEndLat(0);
						dto.setEndLng(0);
						dto.setStartLat(0);
						dto.setStartLng(0);
						dto.setMobile(mobile);
						dto.setPeople(people);
						dto.setPhone(phone);
						dto.setStartLoc(startLoc);
						dto.setStartTime(startTime);
						dto.setVehType(vehType);
						dto.setPrice(price);
						if (new RideDao().createRide(dto)) {
							response.sendRedirect("../requesterlist.jsp");
						} else {
							response.sendRedirect("../createride.jsp?msg=createerror");
						}
					} else {
						response.sendRedirect("../ridedetails.jsp?msg=reqExist&&phone=" + list.getCreater());
					}
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=rideexist");
				}
			} else {
				response.sendRedirect("../createride.jsp?msg=null");
			}
		} else if (type.equals("delete")) {
			String phone = (String) session.getAttribute("phone");
			if (new RequestDao().findAccReq(phone) == null) {
				if (new RideDao().deleteRide(phone) && new RequestDao().delAllRequest(phone)) {
					response.sendRedirect("../home.jsp?msg=ridedelete");
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=delerror");
				}
			} else {
				response.sendRedirect("../requesterdetail.jsp?reqAlreadyAccepted");
			}
		}
	}
%>