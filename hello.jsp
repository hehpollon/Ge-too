<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
li {
    display: block;
    list-style-type: disc;
    margin-top: 1em;
    margin-bottom: 1 em;
    margin-left: 0;
    margin-right: 0;
    padding-left: 40px;
    border: 1px gray solid
    width: 100px;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
window.onload = function(){
	addClickEventAll();
	};
	
function addClickEventAll(){
	document.getElementsByName("geeList")[0].addEventListener('click', function() {alert("1-th clicked!" ); clickGee($("li").index(this));} );
	document.getElementsByName("geeList")[1].addEventListener('click', function() {alert("2-th clicked!" ); clickGee($("li").index(this));} );
	document.getElementsByName("geeList")[2].addEventListener('click', function() {alert("3-th clicked!" ); clickGee($("li").index(this));} );
};

function clickGee(geeSeq){
	var str,splitStr, price;

	str = document.getElementsByName("geeList")[geeSeq].innerHTML;

	splitStr = str.split(',');
	
	price = parseInt(splitStr[1]);
	alert(price);
	showGeToo(splitStr[0], price);
};

function showGeToo(bnName, price){
	var path = "" ; //URL 지정
	var method = "post";

	var bnName, price;
	
	var form = document.createElement("form");
    
	form.setAttribute("Action", path);
    form.setAttribute("Name", bnName);
    form.setAttribute("Price", price);
    form.appendChild(hiddenField);
	form.submit();	
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello getoo</title>
</head>
<body>
        <div id="header">
            <img alt="" src="https://www.koscom.co.kr/portal/images/main/logo.png" />
        </div>
        <div id="content">
            <ul>
                <li name="geeList" id='gee1'>스타벅스, 100000원</li>
                <li name="geeList" id='gee2'>빙그레, 50000원</li>
                <li name="geeList" id='gee3'>유한킴벌리, 50000원</li>
            </ul>
        </div>
        <div id="footer"> Copyright © KOSCOM Corp. All rights reserved.
        </div>
</body>
</html>