<html>
<body>

<table border="0">
<thead>
<th>User Name</th>
<th>First Name</th>
<th>Last Name</th>
</thead>
 <g:each var="user" in="${users}">
        <tr>
            <td>
                ${user.username}
            </td>
            <td>
                ${user.infoUsers.firstname}
            </td>
            <td>
                ${user.infoUsers.lastname}
            </td>
        </tr>
    </g:each> 
</table>


</body>



</html>
