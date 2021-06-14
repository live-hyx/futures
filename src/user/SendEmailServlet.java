package user;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import user.JavaMailUtil;
import user.RandomUtil;
import user.htmlText;


public class SendEmailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("邮箱发送功能");
		try {
			String email = req.getParameter("email");
			System.out.println("后台收到的email="+email);
			JavaMailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件
			// 1、创建参数配置，用于连接邮箱服务器的参数配置
			Properties props = new Properties();
			// 开启debug调试
			props.setProperty("mail.debug", "true");
			// 发送服务器需要身份验证
			props.setProperty("mail.smtp.auth", "true");
			// 设置右键服务器的主机名
			props.setProperty("mail.host", JavaMailUtil.emailSMTPHost);
			props.setProperty("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.ssl.enable", true);
			props.put("mail.smtp.socketFactory.fallback", "false"); // 只处理SSL的连接,对于非SSL的连接不做处理
			props.put("mail.smtp.socketFactory.port", "465");

			// 发送邮件协议名称
			props.setProperty("mail.transport.protocol", "smtp");
			// 2、根据配置创建会话对象，用于和邮件服务器交互
			Session session = Session.getInstance(props);
			// 设置debug，可以查看详细的发送log
			session.setDebug(true);
			// 3、创建一封邮件
			String code = RandomUtil.getRandom();
			System.out.println("邮箱验证码：" + code);
			String html = htmlText.html(code);
			MimeMessage message = JavaMailUtil.creatMimeMessage(session, JavaMailUtil.emailAccount,
					JavaMailUtil.receiveMailAccount, html);
			// 4、根据session获取邮件传输对象
			Transport transport = session.getTransport();
			// 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
			transport.connect(JavaMailUtil.emailAccount, JavaMailUtil.emailPassword);
			// 6、发送邮件,发送所有收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			System.out.println("邮件已发送" );
			// 7、关闭连接
			transport.close();
			System.out.println("链接关闭" );
			//  写入session
			HttpSession hs = req.getSession(true);
			hs.setAttribute("code", code);
			
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("code", code);
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
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("error", "邮件发送失败");
		}
	}
}