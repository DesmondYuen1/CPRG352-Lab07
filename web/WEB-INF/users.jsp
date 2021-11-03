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
                    <th>Delete</th>
                </tr>

                ${users}

            </table>
        </div>

        <div>
            <h1>Edit User</h1>
        </div>