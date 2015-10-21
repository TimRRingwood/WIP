<html>
<head>

    <meta http-equiv="Content-Type"
    content="text/html; charset=UTF-8"/>
    <meta name="layout" content="hpc" />
    <title>HPC Demo</title>
</head>
<body>
    <div class="body">
        <h1>HPC Demo</h1>
        <g:if test="${message}">
            <div class="message">${message}</div>
        </g:if>
        <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
        </g:hasErrors>
        <g:form action="build">
    
    <br/>

  <input type="hidden" id="secretx" name="secretx" value="6Lev2A4TAAAAALYNxDorcbkXV7oOEtrlA21azdxy"/>
    <input type="hidden" id="responsex" name="responsex" value="6Lev2A4TAAAAALYNxDorcbkXV7oOEtrlA21azdxy"/> 
  
             <div class="buttons">
                <span class="button">
                    <g:submitButton  role="button" class="ui-button ui-widget ui-state-default ui-corner-all" name="login" value="Sign In" />
                    <g:submitButton class="cancel" name="create" value="Create Account" />
                </span>
            </div>
        
           
        </g:form>
    </div>
      <recaptcha:script/>
</body>
</html>
