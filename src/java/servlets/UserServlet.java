package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import services.UserService;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String users = "";

        try {
            UserService us = new UserService();
            List<User> usersList = us.getAll();
            for (int i = 0; i < usersList.size(); i++) {
                String email = usersList.get(i).getEmail();
                String active = "";
                if (usersList.get(i).isActive()) {
                    active = "active";
                } else {
                    active = "inactive";
                }
                String first_name = usersList.get(i).getFirst_name();
                String last_name = usersList.get(i).getLast_name();
                String role = "";
                switch (usersList.get(i).getRole()) {
                    case 1:
                        role = "system admin";
                        break;
                    case 2:
                        role = "regular user";
                        break;
                    default:
                        role = "company admin";
                        break;
                }

                users += "<tr><td>" + email + "</td>" + "<td>" + active + "</td>" + "<td>" + first_name + "</td>" + "<td>" + last_name + "</td>" + "<td>" + role + "</td></tr>";

                request.setAttribute("users", users);
            }

        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext()
                .getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);

        return;

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
