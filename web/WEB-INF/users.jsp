<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>

        <div>
            <h1>Add User</h1>
            <form action="" method="POST">
                <input type="email" name="email" placeholder="Email" value=""><br>
                <input type="text" name="first_name" placeholder="First Name" value=""><br>
                <input type="text" name="last_name" placeholder="Last Name" value=""><br>
                <input type="password" name="password" placeholder="Password" value=""><br>

                <select name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                    <option value="3">company admin</option>
                </select><br>

                <input type="checkbox" name="active" id="active" value="active">
                <label for="active">Active</label><br>

                <input type="submit" value="Save">
                <input type="hidden" name="action" value="add">
            </form>
        </div>

        <div>
            <h1>Manage Users</h1>
            <table cellpadding="7" border="1">
                <tr>
                    <th>Email</th>
                    <th>Active</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.email}</td>
                        <td>
                            <c:if test="${user.active}">
                                active
                            </c:if>
                            <c:if test="${user.active == false}">
                                inactive
                            </c:if>
                        </td>
                        <td>${user.first_name}</td>
                        <td>${user.last_name}</td>
                        <td>
                            <c:if test="${user.role == 1}">
                                system admin
                            </c:if>
                            <c:if test="${user.role == 2}">
                                regular user
                            </c:if>
                            <c:if test="${user.role == 3}">
                                company admin
                            </c:if>
                        </td>
                        <td><a href="users?action=edit&selectedUser=${user.email}">Edit</a></td>
                        <td><a href="users?action=delete&deletedUser=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <div>
            <h1>Edit User</h1>

            <c:if test="${selectedUser eq null}">
                <form action="users" method="POST">
                    <input type="text" name="first_nameUp" placeholder="First Name" value="" disabled="true"><br>
                    <input type="text" name="last_nameUp" placeholder="Last Name" value="" disabled="true"><br>

                    <select name="roleUp" disabled="true">
                        <option value="1">system admin</option>
                        <option value="2">regular user</option>
                        <option value="3">company admin</option>
                    </select><br>

                    <input type="checkbox" name="activeUp" id="activeUp" value="activeUp" disabled="true">
                    <label for="activeUp">Active</label><br>

                    <input type="submit" value="Update" disabled="true">
                    <input type="hidden" name="action" value="update">
                </form>
            </c:if>
            <c:if test="${selectedUser ne null}">
                <form action="users" method="POST">
                    <input type="text" name="first_nameUp" placeholder="First Name" value="${selectedUser.first_name}"><br>
                    <input type="text" name="last_nameUp" placeholder="Last Name" value="${selectedUser.last_name}"><br>

                    <select name="roleUp">
                        <option value="1">system admin</option>
                        <option value="2">regular user</option>
                        <option value="3">company admin</option>
                    </select><br>

                    <input type="checkbox" name="activeUp" id="activeUp" value="activeUp">
                    <label for="activeUp">Active</label><br>

                    <input type="submit" value="Update">
                    <input type="hidden" name="action" value="update">
                </form>
            </c:if>


        </div>
    </body>
</html>