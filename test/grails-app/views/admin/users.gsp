<html>
<head>
<script src='https://www.google.com/recaptcha/api.js'></script>
    <meta http-equiv="Content-Type"
    content="text/html; charset=UTF-8"/>
    <meta name="layout" content="hpc" />
    <title>Users</title>
</head>
<body>

<table border="0">
<thead>
<th>User Name</th>
<th>First Name</th>
<th>Last Name</th>
<th>Failed Attempts</th>
</thead>
 <g:each var="user" in="${users}">
        <tr>
            <td>
                ${user.username}
            </td>
            <td>
                ${user.infoUsers?.firstname}
            </td>
            <td>
                ${user.infoUsers?.lastname}
            </td>
            <td>
                ${user.failedAttempts}
            </td>
            <td>
              <a href="resetLogin?username=${user.username}">Reset</a>
            </td>
        </tr>
    </g:each> 
</table>


</body>



</html>
