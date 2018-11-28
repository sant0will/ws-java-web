package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.User;

public class DB {
	private Connection con = null;
	
	private Connection getConnection(){
		if(con == null){
			try{
				DriverManager.registerDriver( new org.hsqldb.jdbc.JDBCDriver());
				con = DriverManager.getConnection("jdbc:hsqldb:file:"+
				"C:/Users/Willian/eclipse-workspace/ProjetoWeb/dados/projeto_db", "sa", "");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			try{
				if(con.isClosed()){
					con = null;
					getConnection();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return con;
	}
	
	private void closeConnection(){
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public User[] getAllUsers(){
		Connection con = this.getConnection();
		java.sql.Statement stm = null;
		List<User> allUsers = new ArrayList<User>();
 		try {
			stm = con.createStatement();
			String SQL = "SELECT * FROM usuarios ORDER BY id";
			ResultSet rs = ((java.sql.Statement) stm).executeQuery(SQL);
			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String last_name = rs.getString("last_name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				
				User usuario = new User(id, name, last_name, email, phone);
				allUsers.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeConnection();
		}
		return allUsers.toArray(new User[allUsers.size()]);
	}
//	
	@SuppressWarnings("finally")
	public boolean saveUser(User userToSave){
		Connection con = this.getConnection();
		java.sql.Statement stm = null;
		System.out.println(userToSave.getName().toString());
		try {
			stm = con.createStatement();
		
			String SQL = "INSERT INTO usuarios(name, last_name, email, phone) VALUES ('"+
				userToSave.getName()+"','"+
				userToSave.getLast_name()+"','"+
				userToSave.getEmail()+"','"+
				userToSave.getPhone()+"');";
			
			((java.sql.Statement) stm).executeUpdate(SQL);
						
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			this.closeConnection();
			return true;
		}		
		
	}

}