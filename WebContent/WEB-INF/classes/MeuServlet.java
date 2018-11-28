package servlet;

import java.awt.Frame;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.json.JSONException;
import org.json.JSONObject;

import beans.User;
import db.DB;

/**
 * Servlet implementation class MeuServlet
 */
@WebServlet(name="MeuServlet", urlPatterns="/store")
public class MeuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String USER_AGENT = "Mozilla/5.0";

    /**
     * Default constructor. 
     */
    public MeuServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DB db = new DB();
		User[] allUsers = db.getAllUsers();
		for (int i = 0; i < allUsers.length; i++) {
			System.out.println(allUsers);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		System.out.println(name);
//		if(name != "" && last_name != "" && phone != "" && email != "") {
//
//			String url = "https://apicadastro.herokuapp.com/api/users";
//			URL obj = null;
//			try {
//				obj = new URL(url);
//			} catch (MalformedURLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			HttpsURLConnection con = null;
//			try {
//				con = (HttpsURLConnection) obj.openConnection();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//
//			//add reuqest header
//			try {
//				con.setRequestMethod("POST");
//			} catch (ProtocolException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			con.setRequestProperty("User-Agent", USER_AGENT);
//
//			String urlParameters = "first_name="+name+"&last_name="+last_name+"&email="+email+"&phone="+email+"";
//			
//			// Send post request
//			con.setDoOutput(true);
//			DataOutputStream wr = null;
//			try {
//				wr = new DataOutputStream(con.getOutputStream());
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			try {
//				wr.writeBytes(urlParameters);
//
//				wr.flush();
//				wr.close();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//
//			int responseCode = 0;
//			try {
//				responseCode = con.getResponseCode();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//
//			BufferedReader in = null;
//			try {
//				in = new BufferedReader(
//				        new InputStreamReader(con.getInputStream()));
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			String inputLine;
//			StringBuffer responsebuffer = new StringBuffer();
//
//			try {
//				while ((inputLine = in.readLine()) != null) {
//					responsebuffer.append(inputLine);
//				}
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			try {
//				in.close();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			
//			//print result
//			JSONObject resposta = null;
//			try {
//				resposta = new JSONObject(response.toString());
//			} catch (JSONException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			System.out.println(resposta);
			
//			try {
//				int resultado = (int) resposta.get("result");
//				if(resultado == 1) {
//				}else {
//				}
//			} catch (JSONException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//		}else {
//			request.setAttribute("errorMessage", "Fomulário incompleto!");
//		}
		request.getRequestDispatcher("/create_user.jsp").forward(request, response);
	}

}
