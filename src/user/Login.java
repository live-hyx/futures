package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Login  extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("start LoginServlet");
		
		String user_email = req.getParameter("user_id");
		String user_pwd = req.getParameter("user_password");
		System.out.println("user_email="+user_email+",user_pwd="+user_pwd);
		HttpSession hs = req.getSession(true);
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException clssNotFoundException){
			clssNotFoundException.printStackTrace();
		}
		try{
			String url="jdbc:mysql://localhost:3306/xm09";
			Connection con=DriverManager.getConnection(url,"XM09","123456");
			Statement stmt=con.createStatement();
			System.out.println("数据库连接成功!");
			String sql="select * from users where user_email='"+user_email+"';";
			// 检查邮箱是否被注册过
			System.out.println("构造出来的sql语句是："+sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				sql= "select * from users where user_email='"+user_email+"' and user_pwd='"+user_pwd+"';";
				System.out.println("构造的sql语句是:"+sql);
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					String user_role = rs.getString("user_role");
					String user_margin = rs.getString("user_margin");
					String user_balance = rs.getString("user_balance");
					String user_city = rs.getString("user_city");
					String user_name = rs.getString("user_name");

					hs.setAttribute("user_email", user_email);
					hs.setAttribute("user_name", user_name);
					hs.setAttribute("user_role", user_role);
					hs.setAttribute("user_margin", user_margin);
					hs.setAttribute("user_balance", user_balance);
					hs.setAttribute("user_city", user_city);
					System.out.println("Login.java 里的session="+hs);
					req.getRequestDispatcher("home/main/index.html").forward(req, resp);
				}else{
					out.print("<script>alert(\"密码错误\");window.location=\"home/main/login.jsp\";</script>");
				}
			}else{ 
				out.print("<script>alert(\"邮箱输入错误\");window.location=\"home/main/login.jsp\";</script>");
			}
			stmt.close();
			con.close();
			System.out.println("数据库关闭!");
		}catch (SQLException sqlexception){
			sqlexception.printStackTrace();
			try{
				String url2 = "jdbc:mysql://localhost:3366/xm09";
				Connection con=DriverManager.getConnection(url2, "XM09","123456");
				Statement stmt=con.createStatement();
				System.out.println("数据库连接成功!");
				String sql="select * from users where user_email='"+user_email+"';";
				// 检查邮箱是否被注册过
				System.out.println("构造出来的sql语句是："+sql);
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){
					sql= "select * from users where user_email='"+user_email+"' and user_pwd='"+user_pwd+"';";
					System.out.println("构造的sql语句是:"+sql);
					rs=stmt.executeQuery(sql);
					if(rs.next()){
						String user_role = rs.getString("user_role");
						String user_margin = rs.getString("user_margin");
						String user_balance = rs.getString("user_margin");
						String user_city = rs.getString("user_city");
						String user_name = rs.getString("user_name");
						
						hs.setAttribute("user_email", user_email);
						hs.setAttribute("user_name", user_name);
						hs.setAttribute("user_role", user_role);
						hs.setAttribute("user_margin", user_margin);
						hs.setAttribute("user_balance", user_balance);
						hs.setAttribute("user_city", user_city);
						req.getRequestDispatcher("home/main/index.html").forward(req, resp);
					}else{
						out.print("<script>alert(\"密码错误\");window.location=\"home/main/login.jsp\";</script>");
					}
				}else{ 
					out.print("<script>alert(\"邮箱输入错误\");window.location=\"home/main/login.jsp\";</script>");
				}
				stmt.close();
				con.close();
				System.out.println("数据库关闭!");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}