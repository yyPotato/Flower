<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	<%
		   request.setCharacterEncoding("GBK");
		   response.setCharacterEncoding("GBK");
		try {

			String id = request.getParameter("id");
			String referer = request.getHeader("referer");//��ȡ�ϸ�ҳ�����ַ
			String DBDRIVER = "org.gjt.mm.mysql.Driver";
			String url = "jdbc:mysql://localhost:3306/backadmin";
			String dbname = "root";
			String dbpass = "6482";
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conn = DriverManager.getConnection(url, dbname,dbpass);
				String sql = "UPDATE orders set status =1 where ordersId='" + id + "'";
				PreparedStatement pst1 = conn.prepareStatement(sql);

				try {
					boolean rs = pst1.execute();
					if (!rs) {

						out.print("<script>alert('�µ��ɹ�');</script>");
						out.print("<script>location='car.jsp';</script>");
					} else {
						out.print("<script>alert('�µ�ʧ��');</script>");
						out.print("<script>location = 'car.jsp';</script>");
					}
				} catch (Exception e) {

				}

				pst1.close();
				conn.close();
		} catch (Exception e) {

		}
	%>
</body>
</html>