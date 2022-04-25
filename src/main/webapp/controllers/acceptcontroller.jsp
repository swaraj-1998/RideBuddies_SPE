<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDao"%>
<%@page import="complete.CompleteDao"%>
<%@page import="ridecreator.RideDao"%>
<%@page import="riderequestor.RequestDto"%>
<%@page import="riderequestor.RequestDao"%>
<%
	if (session.getAttribute("phone") == null) {
		response.sendRedirect("index.jsp?msg=loginfirst");
	}
	String type = request.getParameter("type");
	if (type != null) {
		String creater = (String) session.getAttribute("phone");
		String requester = request.getParameter("requester");
		if (type.equals("accept")) {
			if (new RequestDao().findAccReq(creater) == null) {
				if (new RequestDao().acceptRequest(creater, requester)) {
					new RequestDao().delOtherRequest(creater, requester);
					response.sendRedirect("../requesterdetail.jsp?msg=rideaccepted");
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=cannotaccept");
				}
			} else {
				response.sendRedirect("../requesterdetail.jsp?msg=ridealreadyaccepted");
			}
		} else if (type.equals("decline")) {
			if (new RequestDao().viewStatus(creater, requester).equals("accept")) {
				response.sendRedirect("../requesterdetail.jsp?msg=acceptedridecannotbedel");
			} else {
				RequestDto dto = new RequestDto();
				dto.setCreater(creater);
				dto.setRequester(requester);
				dto.setStatus("pending");
				if (new RequestDao().delRequest(dto)) {
					response.sendRedirect("../requesterlist.jsp?msg=reqDeclined");
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=reqNotDeclined");
				}
			}
		} else if (type.equals("complete")) {
			int rat = Integer.parseInt(request.getParameter("rat"));
			ArrayList<String> list = new CompleteDao().viewCompleted(creater, requester);
			if(list.isEmpty()){
				if(new CompleteDao().completeRide(creater, requester)){
					response.sendRedirect("../home.jsp?msg=rideCompleted");
				}
			} else {
				if(new CompleteDao().completeRideUpdate(creater, requester)){
					if (new RideDao().deleteRide(creater)) {
						if (rat >= 0 && rat <= 5) {
							new UserDao().reqRat(requester, rat);
						}
						response.sendRedirect("../home.jsp?msg=rideCompleted");
					} else {
						response.sendRedirect("../home.jsp?msg=rideCompletedWithoutReq");
					}
				}
			}		
		}
	}
%>