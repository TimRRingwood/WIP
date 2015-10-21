<html>
<head>
    <meta http-equiv="Content-Type"
    content="text/html; charset=UTF-8"/>
    <meta name="layout" content="hpc" />
    <title>Login</title>
</head>
<body>
    <div class="body">
        <h1>Create An Account</h1>
        <g:if test="${message}">
            <div class="message">${message}</div>
        </g:if>
        <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
        </g:hasErrors>
        <g:form action="build">
            <div class="dialog">
                <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="username">User Name:</label>
                        </td>
                        <td valign="top">
                            <input type="text" id="username" name="username" />
                        </td>
                    </tr>
      
                  
                </tbody>
                </table>
            </div>
            <div class="buttons">
                <span class="button">
                    <g:submitButton  role="button" class="ui-button ui-widget ui-state-default ui-corner-all" name="next" value="Next" />
                    <g:submitButton class="cancel" name="cancel" value="Cancel" />
                </span>
            </div>
        </g:form>
    </div>
</body>
</html>