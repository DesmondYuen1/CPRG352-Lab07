<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <title>Users</title>
    </head>
    <body>
        <h2>Add User</h2>
        <div>
            <%
                String id = request.getParameter("userId");
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "userdb";
                String userId = "root";
                String password = "password";

                try {
                    Class.forName(driverName);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
            %>
            <h2>Manage Users</h2>
            <table cellpadding="7" border="1">
                <tr>
                    <th>Email</th>
                    <th>Active</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                </tr>

                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM user";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <tr>

                    <td><%=resultSet.getString("email")%></td>
                    <td><%=resultSet.getString("active")%></td>
                    <td><%=resultSet.getString("first_name")%></td>
                    <td><%=resultSet.getString("last_name")%></td>
                    <td><%=resultSet.getString("role")%></td>

                </tr>
                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>


            </table>
        </div>
        <h2>Edit User</h2>
    </body>
</html>
