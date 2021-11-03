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

                ${users}

            </table>
        </div>

        <div>
            <h1>Edit User</h1>

            <c:if test="${editUser ne null}">
                <form action="users" method="POST">
                    <input type="text" name="first_nameUp" placeholder="First Name" value="${selectedUser.first_name}"><br>
                    <input type="text" name="last_nameUp" placeholder="Last Name" value="${selectedUser.last_name}"><br>

                    <select name="roleUp">
                        <option value="1">system admin</option>
                        <option value="2">regular user</option>
                        <option value="3">company admin</option>
                    </select><br>

                    <input type="checkbox" name="active" id="active" value="active">
                    <label for="active">Active</label><br>

                    <input type="submit" value="Update">
                    <input type="hidden" name="action" value="update">
                </form>
            </c:if>
            <c:if test="${editUser eq null}">
                <form action="users" method="POST">
                    <input type="text" name="first_nameUp" placeholder="First Name" value="" disabled="true"><br>
                    <input type="text" name="last_nameUp" placeholder="Last Name" value=""  disabled="true"><br>

                    <select name="roleUp" disabled="true">
                        <option value="1">system admin</option>
                        <option value="2">regular user</option>
                        <option value="3">company admin</option>
                    </select><br>

                    <input type="checkbox" name="active" id="active" value="active"  disabled="true">
                    <label for="active">Active</label><br>

                    <input type="submit" value="Update"  disabled="true">
                    <input type="hidden" name="action" value="update">
                </form>
            </c:if>

        </div>
    </body>
</html>