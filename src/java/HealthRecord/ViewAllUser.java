/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jagankaartik58
 */


/*

    View All Users Servlet

*/


public class ViewAllUser extends HttpServlet 
{
    String id;
    String name;
    String role;

    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
        try {
            //JDBC Steps
            
            PrintWriter out = rep.getWriter();
            
            try {
                Class.forName("org.postgresql.Driver");
            }
            catch(ClassNotFoundException ex) {
                System.out.println(ex);
            }
            
            String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
            String db_username = "postgres";
            String sql = "select * from public.\"User\"";
            
            Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
            
            Statement st = conn.createStatement();
            
            ResultSet rs = st.executeQuery(sql);

            List<UserModel> usr = new ArrayList<UserModel>();

            out.println(sql);

            int i = 0;
            
            while(rs.next())
            {
                
                UserModel u = new UserModel();

                id = rs.getString("id");
                u.setId(id);
                
                name = rs.getString("name");
                u.setName(name);

                role = rs.getString("role");
                u.setRole(role);

                usr.add(u);

                i = i + 1;
            }

            req.setAttribute("usrs",usr);
            req.getRequestDispatcher("Admin.jsp").forward(req,rep);

            if (rs.next() == false) 
            {
                  
                  rep.sendRedirect("error_page.jsp");
             
            }


            /* Close Statement and Connection in JDBC */
                
            st.close();
            conn.close();
            
        }
        catch(SQLException ex) {
            System.out.println(ex);
        }

    }   
}
