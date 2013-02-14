<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><tiles:insertAttribute name="title"/></title>
		<tiles:insertAttribute name="head_content"/>
	</head>
	<body>
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
				
		<div id="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>		
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</body>
</html>