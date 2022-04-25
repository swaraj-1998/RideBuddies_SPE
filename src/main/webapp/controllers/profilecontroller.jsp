<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%
	if (session.getAttribute("phone") == null) {
		response.sendRedirect("index.jsp?msg=loginfirst");
	} else {
		String type = request.getParameter("type");
		if (type != null) {
			String phone = (String) session.getAttribute("phone");
			if (type.equals("delete")) {
				if (new UserDao().deleteUser(phone)) {
					session.invalidate();
					response.sendRedirect("../RideBuddiesIndex/index.html?msg=profiledeleted");
				} else {
					response.sendRedirect("../profile.jsp?msg=cannotDelete");
				}
			} else if (type.equals("update")) {
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String email = request.getParameter("email");
				if (name != null && gender != null && email != null) {
					UserDto user = new UserDto();
					user.setEmail(email);
					user.setGender(gender);
					user.setName(name);
					user.setPhone(phone);
					if (new UserDao().updateUser(user)) {
						session.setAttribute("email", email);
						session.setAttribute("name", name);
						session.setAttribute("gender", gender);
						response.sendRedirect("../profile.jsp?msg=profileUpdated");
					} else {
						response.sendRedirect("../profile.jsp?msg=profileNotUpdated");
					}
				} else {
					response.sendRedirect("../profile.jsp?msg=blank");
				}
			}
		}
	}
%>