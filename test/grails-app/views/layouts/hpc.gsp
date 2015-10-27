<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'hpc.ico')}" type="image/x-icon">
		<asset:stylesheet src="pie.css"/>
		<asset:stylesheet src="head.css"/>
		<asset:stylesheet src="hpc.css"/>
		<asset:stylesheet src="hpc_new.css"/>

		<asset:javascript src="pieinfo.js"/>

		<asset:javascript src="head.js"/>
        <asset:javascript src="jquery-ui.js"/>
		<g:layoutHead/>
	
	</head>
	<body>
	  <div id="pageContainer">
		<div id="hpcLogo" role="banner"><a href="#"><asset:image src="HPCMP_smaller.png" alt="HPCMP"/></a></div>
		<g:layoutBody/>
	</div>	
		<div class="footer" role="contentinfo"></div>
		
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	  
	</body>
</html>
