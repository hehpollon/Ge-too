<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>info</title>
</head>
<body>
	<h2>${stock1}</h2>
	<h4>${stock1price}</h4>
	<h4>영업이익: ${stock1oprofit}</h4>
	<h4>순이익: ${stock1nprofit}</h4>
	<h4>부채: ${stock1liabilities}</h4>
	<h2>${stock2}</h2>
	<h4>${stock2price}</h4>
	<h4>영업이익: ${stock2oprofit}</h4>
	<h4>순이익: ${stock2nprofit}</h4>
	<h4>부채: ${stock2liabilities}</h4>
	<h2>${stock3}</h2>
	<h4>${stock3price}</h4>
	<h4>영업이익: ${stock3oprofit}</h4>
	<h4>순이익: ${stock3nprofit}</h4>
	<h4>부채: ${stock3liabilities}</h4>
</body>
</html>