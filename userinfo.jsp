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
			String USER_ID = request.getParameter("USER_ID");			
			String NAME = request.getParameter("NAME");
			String NICKNAME = request.getParameter("NICKNAME");
			String EMAIL = request.getParameter("EMAIL");
			String PHONE = request.getParameter("PHONE");
			String GENRE0 = request.getParameter("GENRE0");
			String GENRE1 = request.getParameter("GENRE1");
			String GENRE2 = request.getParameter("GENRE2");
			String SPOT0 = request.getParameter("SPOT0");
			String SPOT1 = request.getParameter("SPOT1");
			String SPOT2 = request.getParameter("SPOT2");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "busking";
		String passwd = "busking";
		String s = "insert into USER_INFO values(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn;
		PreparedStatement pstat;
		boolean logincheck=false;
		
			//1.jdbc driver ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.connection ��ü ����(network ����)
			conn = DriverManager.getConnection (url, user, passwd);
			
			//3.Statement��ü ����(query �ϳ��� ������ �ִ� �׸�)
			pstat = conn.prepareStatement(s);		
			pstat.setString(1,USER_ID);
			pstat.setString(2,NAME);
			pstat.setString(3,NICKNAME);
			pstat.setString(4,EMAIL);
			pstat.setString(5,PHONE);
			pstat.setString(6,GENRE0);
			pstat.setString(7,GENRE1);
			pstat.setString(8,GENRE2);
			pstat.setString(9,SPOT0);
			pstat.setString(10,SPOT1);
			pstat.setString(11,SPOT2);
			ResultSet rs = pstat.executeQuery();
			pstat.close();
			conn.close(); 
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
%>
</body>
</html>