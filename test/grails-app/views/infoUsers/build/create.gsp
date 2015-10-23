<html>
<head>
<script src='https://www.google.com/recaptcha/api.js'></script>
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
               
            </div>
     
                            <div class="g-recaptcha" data-sitekey="6Lev2A4TAAAAAF9It1rd7Rwv29EzlChthjPhGBh1"></div>
                
 <noscript>
<div style="width: 302px; height: 462px;">
<div style="width: 302px; height: 422px; position: relative;">
<div style="width: 302px; height: 422px; position: absolute;">
<iframe src="https://www.google.com/recaptcha/api/fallback?k=6Lev2A4TAAAAAF9It1rd7Rwv29EzlChthjPhGBh1" frameborder="0" scrolling="no" style="width: 302px; height:422px; border-style: none;">
</iframe>
</div>
</div>
<div style="border-style: none; bottom: 12px; left: 25px; margin: 0px; padding: 0px; right: 25px; background: #f9f9f9; border: 1px solid #c1c1c1; border-radius: 3px; height: 60px; width: 300px;">
<textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none; ">
</textarea>
</div>
</div>
<br>
</noscript>

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