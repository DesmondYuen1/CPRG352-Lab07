<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>

        <div>
            <h2>Add User</h2>
            <form action="" method="POST">
                <input type="email" name="email" placeholder="Email"><br>
                <input type="text" name="first_name" placeholder="First Name"><br>
                <input type="text" name="last_name" placeholder="Last Name"><br>
                <input type="password" name="password" placeholder="Password"><br>
                <select name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                    <option value="3">company admin</option>
                </select><br>
                <input type="checkbox" name="active" id="active" value="active">
                <label for="active">Active</label>
            </form>
        </div>

        <div>
            <h2>Manage Users</h2>
            <table cellpadding="7" border="1">
                <tr>
                    <th>Email</th>
                    <th>Active</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                </tr>

                ${users}

            </table>
        </div>

        <div>
            <h2>Edit User</h2>
        </div>