<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%
String type = request.getParameter("type");
if(type != null){
	if(type.equals("login")){
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		if(phone != null && password != null){
			UserDto dto = new UserDao().authenticate(phone, password);
			if(dto != null){
				session.setAttribute("name", dto.getName());
				session.setAttribute("email", dto.getEmail());
				session.setAttribute("phone", dto.getPhone());
				session.setAttribute("password", dto.getPassword());
				session.setAttribute("gender", dto.getGender());
				session.setAttribute("reqrat", dto.getReqRat());
				session.setAttribute("riderat", dto.getRideRat());
				response.sendRedirect("../home.jsp");
			} else {
				response.sendRedirect("../index.jsp?msg=loginerror");
			}
		}
	} else if(type.equals("signup")){
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		if(phone != null && password != null && name != null && email != null){
			UserDto dto = new UserDto();
			dto.setName(name);
			dto.setEmail(email);
			dto.setPassword(password);
			dto.setPhone(phone);
			dto.setGender(gender);
			if(new UserDao().addUser(dto)){
				response.sendRedirect("../index.jsp?msg=signupsuccess");
			} else {
				response.sendRedirect("../index.jsp?msg=signuperror");
			}
		}
	} else if(type.equals("logout")){
		session.invalidate();
		response.sendRedirect("../RideBuddiesIndex/index.html?msg=logout");
	}
}
%>