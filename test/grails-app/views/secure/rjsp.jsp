  <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

    <html>
      <body>
        <form action="" method="post">
        <%
          ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Lev2A4TAAAAAF9It1rd7Rwv29EzlChthjPhGBh1", "6Lev2A4TAAAAALYNxDorcbkXV7oOEtrlA21azdxy", false);
          out.print(c.createRecaptchaHtml(null, null));
        %>
        <input type="submit" value="submit" />
        </form>
      </body>
    </html>