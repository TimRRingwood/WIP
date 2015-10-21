
<!DOCTYPE HTML>
<html dir="ltr">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=yes">
<title>ReCAPTCHA demo
</title>
<link rel="stylesheet" href="https://www.gstatic.com/recaptcha/api2/r20151013164303/demo__ltr.css" type="text/css">
<script src='https://www.google.com/recaptcha/api.js' async defer>
</script>
</head>
<body>
<div class="sample-form">
<form method="POST">
<fieldset>
<legend>Sample Form with ReCAPTCHA
</legend>
<ul>
<li>
<label for="input1">First Name
</label>
<input class="jfk-textinput" id="input1" name="input1" type="text" value="Jane" disabled aria-disabled="true">
</li>
<li>
<label for="input2">Last Name
</label>
<input class="jfk-textinput" id="input2" name="input2" type="text" value="Smith" disabled aria-disabled="true">
</li>
<li>
<label for="input3">Email
</label>
<input class="jfk-textinput" id="input3" name="input3" type="text" value="stopallbots@gmail.com" disabled aria-disabled="true">
</li>
<li>
<p>Pick your favorite color:
</p>
<label class="jfk-radiobutton-label" for="option1">
<input class="jfk-radiobutton-checked" type="radio" id="option1" name="radios" value="option1" disabled aria-disabled="true" checked aria-checked="true">Red
</label>
<label class="jfk-radiobutton-label" for="option2">
<input class="jfk-radiobutton" type="radio" id="option2" name="radios" value="option2" disabled aria-disabled="true">Green
</label>
</li>
<li>
<div class="">
<!-- BEGIN: ReCAPTCHA implementation example. -->
<div class="g-recaptcha" data-sitekey="6Lev2A4TAAAAAF9It1rd7Rwv29EzlChthjPhGBh1">
</div>
<!-- Optional noscript fallback. -->
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
<!-- END: ReCAPTCHA implementation example. -->
</div>
</li>
<li>
<input type="submit" value="Submit" />
</li>
</ul>
</fieldset>
</form>
</div>
</body>
</html>:
