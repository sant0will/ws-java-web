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
@WebServlet("/store")
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
		if(name != "" && last_name != "" && phone != "" && email != "") {

			String url = "https://apicadastro.herokuapp.com/api/users";
			URL obj = null;
			try {
				obj = new URL(url);
				HttpsURLConnection con = null;
				con = (HttpsURLConnection) obj.openConnection();
				con.setRequestMethod("POST");
				con.setRequestProperty("User-Agent", USER_AGENT);

				String urlParameters = "first_name="+name+"&last_name="+last_name+"&email="+email+"&phone="+email+"";
			
				// Send post request
				con.setDoOutput(true);
				DataOutputStream wr = null;			
				wr = new DataOutputStream(con.getOutputStream());
				wr.writeBytes(urlParameters);
				wr.flush();
				wr.close();
				
				int responseCode = con.getResponseCode();
				BufferedReader in = new BufferedReader(
				new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer responsebuffer = new StringBuffer();
				
				while ((inputLine = in.readLine()) != null) {
					responsebuffer.append(inputLine);
				}
				
				in.close();
				
				JSONObject resposta = new JSONObject(responsebuffer.toString());
			
				int resultado = (Integer) resposta.get("result");
				System.out.println("result: "+resultado);
				if(resultado == 1) {
					request.setAttribute("successMessage", "Usuário cadastrado com sucesso!");
				}else {
					request.setAttribute("errorMessage", "Erro ao cadastrar!");
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			request.setAttribute("errorMessage", "Fomulário incompleto!");
		}
		
		request.getRequestDispatcher("/create_user.jsp").forward(request, response);
	}	

}
