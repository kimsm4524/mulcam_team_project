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
		String s = "select user_pass from users where user_id=?";
		String s2 = "select nickname from user_info where user_id=?";
		String nickname="";
		Connection conn;
		PreparedStatement pstat;
		boolean logincheck=false;
		
			//1.jdbc driver ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.connection ��ü ����(network ����)
			conn = DriverManager.getConnection (url, user, passwd);
		
			//3.Statement��ü ����(query �ϳ��� ������ �ִ� �׸�)
			pstat = conn.prepareStatement(s);		
			pstat.setString(1,id);
			ResultSet rs = pstat.executeQuery();
			while(rs.next())
			{
				if(rs.getString(1).equals(pw))
					logincheck=true;
			}
			pstat = conn.prepareStatement(s2);
			pstat.setString(1,id);
			ResultSet rs1 = pstat.executeQuery();
			while(rs1.next())
			{
				nickname = rs1.getString(1);
			}
			if(logincheck){
				out.println("<data><result>true</result>");
				out.println("<nickname>"+nickname+"</nickname></data>");
			}
			else
				out.println("<data><result>false</result></data>");
			
			pstat.close();
			conn.close(); 
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
%>
</body>
</html>