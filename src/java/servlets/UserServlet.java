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

        UserService us = new UserService();

        String action = request.getParameter("action");
        if (action != null) {

            if (action.equals("edit")) {
                String selectedUser = request.getParameter("selectedUser");
                try {
                    User user = us.get(selectedUser);
                    request.setAttribute("selectedUser", user);
                    try {
                        List<User> users = us.getAll();
                        request.setAttribute("users", users);
                    } catch (Exception ex) {
                        Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                    return;
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (action.equals("delete")) {
                String deletedUser = request.getParameter("deletedUser");
                try {
                    us.delete(deletedUser);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            try {
                List<User> users = us.getAll();
                request.setAttribute("users", users);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("users");
            return;
        }

        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        return;

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService us = new UserService();

        String action = request.getParameter("action");
        if (action != null) {

            if (action.equals("add")) {
                try {
                    String email = request.getParameter("email");
                    String first_name = request.getParameter("first_name");
                    String last_name = request.getParameter("last_name");
                    String password = request.getParameter("password");
                    int role = Integer.parseInt(request.getParameter("role"));
                    Boolean active = false;
                    if (request.getParameter("active") != null) {
                        active = true;
                    }

                    us.insert(email, active, first_name, last_name, password, role);

                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                try {
                    List<User> users = us.getAll();
                    request.setAttribute("users", users);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                return;
            }
            if (action.equals("edit")) {
                try {
                    String email = request.getParameter("selectedUser");
                    User user = us.get(email);
                    String first_name = request.getParameter("first_nameUp");
                    String last_name = request.getParameter("last_nameUp");
                    int role = Integer.parseInt(request.getParameter("roleUp"));
                    Boolean active = false;
                    if (request.getParameter("activeUp") != null) {
                        active = true;
                    }

                    us.update(email, active, first_name, last_name, user.getPassword(), role);
                    User updatedUser = us.get(email);
                    String message = "User updated: ";
                    message += updatedUser.getEmail() + ", ";
                    message += updatedUser.getFirst_name() + ", ";
                    message += updatedUser.getLast_name() + ", ";
                    message += updatedUser.isActive() + ", ";
                    message += updatedUser.getRole();
                    request.setAttribute("message", message);

                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                try {
                    List<User> users = us.getAll();
                    request.setAttribute("users", users);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("users");
                return;
            }
        }
        try {
            List<User> users = us.getAll();
            request.setAttribute("users", users);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        return;
    }
}
