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
			String CITY = request.getParameter("CITY");
			String TEAMNAME = request.getParameter("TEAMNAME");
			String INTRO = request.getParameter("INTRO");
			String LINK = request.getParameter("LINK");
			String CLOUD = request.getParameter("CLOUD");
			String MEMBERS = request.getParameter("MEMBERS");
			String RECORD0 = request.getParameter("RECORD0");
			String RECORD1 = request.getParameter("RECORD1");
			String RECORD2 = request.getParameter("RECORD2");
			String RECORD3 = request.getParameter("RECORD3");
			String RECORD4 = request.getParameter("RECORD4");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "busking";
		String passwd = "busking";
		String s = "insert into USER_INFO values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstat.setString(2,CITY);
			pstat.setString(3,TEAMNAME);
			pstat.setString(4,INTRO);
			pstat.setString(5,LINK);
			pstat.setString(6,CLOUD);
			pstat.setString(7,MEMBERS);
			pstat.setString(8,RECORD0);
			pstat.setString(9,RECORD1);
			pstat.setString(10,RECORD2);
			pstat.setString(11,RECORD3);
			pstat.setString(12,RECORD4);
			ResultSet rs = pstat.executeQuery();
			pstat.close();
			conn.close(); 
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
%>
</body>
</html>