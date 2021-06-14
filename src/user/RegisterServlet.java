package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("start registerServlet");
		
		String user_name = req.getParameter("register_user_id");
		String user_email = req.getParameter("register_email");
		String user_pwd = req.getParameter("register_password");
		System.out.println("user_name="+user_name+",user_email="+user_email+",user_pwd="+user_pwd);
		String user_role = "normal";
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		String create_time = formatter.format(date).toString();
		
		String message="注册成功";
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException clssNotFoundException){
			clssNotFoundException.printStackTrace();
		}
		try{
			String url="jdbc:mysql://localhost:3306/xm09";
			Connection con=DriverManager.getConnection(url,"XM09","123456");
			
			String url2 = "jdbc:mysql://localhost:3366/xm09";
			if(con == null){
				con=DriverManager.getConnection(url2, "XM09","123456");
			}
			
			Statement stmt=con.createStatement();
			System.out.println("数据库连接成功!");
			String sql= "select * from users where user_email='"+user_email+"';";
			// 检查邮箱是否被注册过
			System.out.println("构造出来的sql语句是："+sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				message="邮箱已注册，注册失败";
			}else{ 
				sql= "insert into users(user_name,user_email,user_pwd,";
				sql = sql+"user_role,user_balance,user_margin,create_time) values('"+user_name;
				sql = sql+"','"+user_email+"','"+user_pwd+"','" + user_role;
				sql = sql+"',0,0,'"+create_time+"');";
				System.out.println("构造的sql语句是:"+sql);
				stmt.executeUpdate(sql);
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
				String sql= "select * from users where user_email='"+user_email+"';";
				// 检查邮箱是否被注册过
				System.out.println("构造出来的sql语句是："+sql);
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){
					message="邮箱已注册，注册失败";
				}else{ 
					sql= "insert into users(user_name,user_email,user_pwd,";
					sql = sql+"user_role,user_balance,user_margin,create_time) values('"+user_name;
					sql = sql+"','"+user_email+"','"+user_pwd+"','" + user_role;
					sql = sql+"',0,0,'"+create_time+"');";
					System.out.println("构造的sql语句是:"+sql);
					stmt.executeUpdate(sql);
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