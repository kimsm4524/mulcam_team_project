<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//jsp���Ͽ��� java code ���� ��

try {
			String id = request.getParameter("id");			
			String pw = request.getParameter("pass");
			
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "busking";
		String passwd = "busking";
		String s = "insert into USERS values(?,?)";
		Connection conn;
		PreparedStatement pstat;
		
			//1.jdbc driver ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.connection ��ü ����(network ����)
			conn = DriverManager.getConnection (url, user, passwd);
			
			//3.Statement��ü ����(query �ϳ��� ������ �ִ� �׸�)
	pstat = conn.prepareStatement(s);		
			pstat.setString(1,id);
			pstat.setString(2,pw);
			pstat.executeUpdate();
			out.println("<data><result>true</result></data>");
			
			pstat.close();
			conn.close(); 
			
			out.println("<data><result>true</result></data>");
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
%>
</body>
</html>