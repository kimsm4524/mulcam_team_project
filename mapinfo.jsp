<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
//jsp���Ͽ��� java code ���� ��

try {			
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "busking";
		String passwd = "busking";
		String s = "select * from teamdata";
		Connection conn;
		Statement stat;
		
			//1.jdbc driver ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.connection ��ü ����(network ����)
			conn = DriverManager.getConnection (url, user, passwd);
			stat = conn.createStatement();
			//3.Statement��ü ����(query �ϳ��� ������ �ִ� �׸�)
			ResultSet rs = stat.executeQuery(s);
			String msg = "<root>";
			while(rs.next())
			{
				msg+="<data><TEAMNAME>"+rs.getString(1)+"</TEAMNAME><GENRE>"+rs.getString(2)+"</GENRE><INTRO>"
						+rs.getString(3)+"</INTRO><STARTTIME>"+rs.getTime(4)+"</STARTTIME><LOCX>"+rs.getDouble(5)
						+"</LOCX><LOCY>"+rs.getDouble(6)+"</LOCY><ENDTIME>"+rs.getTime(7)+"</ENDTIME></data>";
			}
			msg+="</root>";
			out.println(msg);
			stat.close();
			conn.close(); 
			
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
%>