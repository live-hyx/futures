package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class ForgetPwdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("start ForgetPwdServlet");

		String user_email = req.getParameter("forget_email");
		String user_pwd = req.getParameter("forget_password");
		System.out.println("forget_email="+user_email+",forget_pwd="+user_pwd);
		String message="修改密码成功";
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException clssNotFoundException){
			clssNotFoundException.printStackTrace();
		}
		try{
			String url1 = "jdbc:mysql://localhost:3306/xm09";
			Connection con=DriverManager.getConnection(url1,"XM09","123456");

			Statement stmt=con.createStatement();
			System.out.println("数据库连接成功!");
			String sql="select * from users where user_email='"+user_email+"';";
			System.out.println("构造出来的sql语句是："+sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){// 检查邮箱是否被注册过 
				sql= "update users set user_pwd='"+user_pwd+"' where user_email='"+user_email+"';";
				System.out.println("构造的sql语句是:"+sql);
				stmt.executeUpdate(sql);
			}else{ 
				message="邮箱未注册，请检查邮箱";
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
				System.out.println("构造出来的sql语句是："+sql);
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){// 检查邮箱是否被注册过 
					sql= "update users set user_pwd='"+user_pwd+"' where user_email='"+user_email+"';";
					System.out.println("构造的sql语句是:"+sql);
					stmt.executeUpdate(sql);
				}else{ 
					message="邮箱未注册，请检查邮箱";
				}
				stmt.close();
				con.close();
				System.out.println("数据库关闭!");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		JSONObject jsonObj=new JSONObject();
		try {
			jsonObj.put("message", message);
			jsonObj.put("result_msg","ok");	//如果发生错误就设置成"error"等
			jsonObj.put("result_code",0);	//返回0表示正常，不等于0就表示有错误产生，错误代码
			System.out.println("最后构造得到的json是："+jsonObj.toString());
			resp.setContentType("text/html; charset=UTF-8");
			try {
				resp.getWriter().print(jsonObj);
				resp.getWriter().flush();
				resp.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
	}
}
