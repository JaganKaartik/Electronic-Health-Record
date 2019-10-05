/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;

/**
 *
 * @author jagankaartik58
 */

/*
**
** 		SERVLET COLLABORATION IS IMPLEMENTED HERE
**
*/


/*

	Controller: To View Patient Information

	View Patient.JSP --> Calls PatientInfoController.java

*/

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.ServletException;

public class PatientInfoController extends HttpServlet
{
    
    /* Post Method */

    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
        // Accept Search Query for Patient ID or name

        String search_query = req.getParameter("ser");

        // Setting the attribute of request object so that it can be accessed in the forwarded servlet

       	req.setAttribute("id",search_query);

        // Redirecting client request to another Servlet

        RequestDispatcher rd = req.getRequestDispatcher("patientDAO"); 
        rd.forward(req,rep);

    }
}
