<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Ge,Too</title>
<link rel="stylesheet" type="text/css" href="./main.css"/>


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
	document.getElementsByName("geeList")[0].addEventListener('click', function() { clickGee($("li").index(this));} );
	document.getElementsByName("geeList")[1].addEventListener('click', function() { clickGee($("li").index(this));} );
	document.getElementsByName("geeList")[2].addEventListener('click', function() { clickGee($("li").index(this));} );
};

function clickGee(geeSeq){
	var str,splitStr, price;

	str = document.getElementsByName("geeList")[geeSeq].innerHTML;	
	splitStr = str.split(',');	
	price = parseInt(splitStr[1]);

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
<div class="head">지투:지출을 투자하다</div>
<div class="banner-top">
	<ul>
	</ul>
</div>
</head>
<body>
    <div id="content" class="field">
	<h5 class="label"><img src="./icon/bar.png" />지출내역</h5>
    <ul>
        <a href = "/index?stockname=스타벅스코리아&iprice=100,000원"><li name="geeList" id='gee1'>스타벅스코리아, 100,000원</li></a>
        <a href = "/index?stockname=GS리테일&iprice=48,000원"><li name="geeList" id='gee2'>GS리테일, 48,000원</li></a>
        <a href = "/index?stockname=쿠팡&iprice=120,000원"><li name="geeList" id='gee3'>쿠팡, 120,000원</li></a>
        <a href = "/index?stockname=하나투어&iprice=1,000,000원"><li name="geeList" id='gee1'>하나투어, 1,000,000원</li></a>
        <a href = "/index?stockname=인터파크&iprice=48,000원"><li name="geeList" id='gee2'>인터파크, 48,000원</li></a>
        <a href = "/index?stockname=아리따움&iprice=120,000원"><li name="geeList" id='gee3'>아리따움, 120,000원</li></a>   
        <a href = "/index?stockname=SPC&iprice=60,000원"><li name="geeList" id='gee1'>SPC, 60,000원</li></a>
        <a href = "/index?stockname=이마트&iprice=300,000원"><li name="geeList" id='gee1'>이마트, 300,000원</li></a>
    </ul>
    </div>
    <div class="footer">
      	Copyright © 1조. All rights reserved.
    </div>
</body>
</html>