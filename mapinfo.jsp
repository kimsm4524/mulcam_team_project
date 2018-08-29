<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
//jsp파일에서 java code 적는 곳

try {			
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "busking";
		String passwd = "busking";
		String s = "select * from teamdata";
		Connection conn;
		Statement stat;
		
			//1.jdbc driver 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.connection 객체 얻어내기(network 연결)
			conn = DriverManager.getConnection (url, user, passwd);
			stat = conn.createStatement();
			//3.Statement객체 얻어내기(query 하나를 담을수 있는 그릇)
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