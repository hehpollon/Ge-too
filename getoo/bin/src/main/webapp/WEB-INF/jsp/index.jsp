<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!Doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Ge,Too</title>
<link rel="stylesheet" type="text/css" href="./main.css"/>
<script src="./js/Chart.js"></script>
</head>
<body>
<div class="head">지투:지출에 투자하다</div>
<div class = "banner-top">
	<img class="icon" src="./icon/icon-back.png" onclick="history.back()"/>
	<ul>
		<li><img class="icon" src="./icon/icon-recommendation.png" onclick="/setting.jsp"/></li>
		<li><img class="icon"  src="./icon/icon-setting.png" onclick="/recommendation.jsp"/></li>	
	</ul>
</div>

<div class="contents">
	<div class="field">
		<h5 class="label"><img src="./icon/bar.png" />  거래처</h5>
		<p id="vendor">${stockname}</p> 
	</div>

	<div class="field">
		<h5 class="label"><img src="./icon/bar.png" />  금액</h5>
		<p id="expense">${iprice}</p>
	</div>
	<div class="field">
		<h5 class="label"><img src="./icon/bar.png" />  투자 추천</h5>
		<div class="investment">
			<div class="right">
				<div class="price">		
				<!--		
					<div class="buttons">
						<button class="term" onclick=setTerm(3)>3개월</button>
						<button class="term" onclick=setTerm(12)>1년</button>
						<button class="term" onclick=setTerm(36)>3년</button>
					</div>
					 -->
					 
					<iframe width=800 name="prce" width="0" height="0" frameborder="0" scrolling="no"></iframe>
					<form name="frm2" method="post" action=""></form>

					
					<!-- Graph! -->
					<canvas id="price-graph">
					<script>
					function setTerm(month){
						frm2.target = "prce";
						frm2.action=location.href+"?term="+month;
						frm2.submit();
					}
					
					
					var data = {labels:[${stock1date}],
							datasets:[{
								label:"${stock1}",
								backgroundColor: "#3a85ff",
			                    borderColor: "#3a85ff",fill:false,
								data:[${stock1price}]
							},{label:"${stock2}",backgroundColor: "#fc496d",
			                    borderColor:"#fc496d",fill:false,data:[${stock2price}]},{label:"${stock3}",backgroundColor: "#a1ff89",
			                        borderColor: "#a1ff89",fill:false,data:[${stock3price}]}]
					
					}
					new Chart(document.getElementById("price-graph"),{"type":"line","data":data,
						options: {
			                responsive: true,
			                tooltips: {
			                    mode: 'index',
			                    intersect: false,
			                },
			                hover: {
			                    mode: 'nearest',
			                    intersect: true
			                },
			                scales: {
			                    xAxes: [{
			                        display: true,
			                        scaleLabel: {
			                            display: true,
			                            labelString: 'Month'
			                        }
			                    }],
			                    yAxes: [{
			                        display: true,
			                        scaleLabel: {
			                            display: true,
			                            labelString: 'Price'
			                        }
			                    }]
			                }
			            }
					
					
					
					
					});
					
										
					
					
					
					
					</script>
					</canvas>
					
					
					
				</div>
				<!-- Company! -->
				<div id="companies">
					<table>
						<tbody id="companies_table">
						</tbody>
					</table>
				</div>
				<div class="finance">
					<table><!-- PUT FINANCE DATA HERE -->
						<tr><th>종목명</th><th>영업이익</th><th>순이익</th><th>부채</th></tr>
			
						<tr><td>${stock1}</td><td>${stock1oprofit}</td><td>${stock1nprofit}</td><td>${stock1liabilities}</td></tr>
						<tr><td>${stock2}</td><td>${stock2oprofit}</td><td>${stock2nprofit}</td><td>${stock2liabilities}</td></tr>
						<tr><td>${stock3}</td><td>${stock3oprofit}</td><td>${stock3nprofit}</td><td>${stock3liabilities}</td></tr>
					</table>
					<a id="dart" href="https://dart.fss.or.kr/">DART 바로가기</a>
					
				</div>
			<select id="move_page">
				<option>투자시작</option>
				<option value="삼성증권">삼성증권</option>
				<option value="키움증권">키움증권</option>
				<option value="KB증권">KB증권</option>
			</select>
			</div>
		
		
		</div>

	</div>



</div>


				<script>
				//수익률 계산
				function pround(number, precision) {
			  var factor = Math.pow(10, precision);
			  return Math.round(number * factor) / factor;
			}
				
				var pricelst=[];
				var earninglst = [];
				var earningRate = [];
				var lst = "${stock1price}".split(",");
				pricelst.push(lst[lst.length-2]);
				earninglst.push(lst[lst.length-2]-lst[0]);
				earningRate.push(pround((lst[lst.length-2]-lst[0])/lst[0]*100,2));
				var lst = "${stock2price}".split(",");
				pricelst.push(lst[lst.length-2]);
				earninglst.push(lst[lst.length-2]-lst[0]);
				earningRate.push(pround((lst[lst.length-2]-lst[0])/lst[0]*100,2));
				var lst = "${stock3price}".split(",");
				pricelst.push(lst[lst.length-2]);
				earninglst.push(lst[lst.length-2]-lst[0]);
				earningRate.push(pround((lst[lst.length-2]-lst[0])/lst[0]*100,2));
			
				
				var cmpnylst = "${cmpnylstSTR}".split(",");
				document.getElementById("companies_table").innerHTML = document.getElementById("companies_table").innerHTML +"<tr><th>종목명</th><th>현재가</th><th>주당 수익</th><th>수익률</th></tr>";					
				if (cmpnylst.length != 0){
					for (var i=0;i<cmpnylst.length-1;i++){
						//var btn = document.getElementById("companies").innerHTML+="<button class='item' onclick=setCompany('"+cmpnylst[i]+"')>"+cmpnylst[i]+"</button>";
				//		document.getElementById("companies").innerHTML=document.getElementById("companies").innerHTML
				//			+"<button class='item' onclick=setCompany('"+cmpnylst[i]+"')>"+cmpnylst[i]+"</button>";
						document.getElementById("companies_table").innerHTML=document.getElementById("companies_table").innerHTML+"<tr><td>"+cmpnylst[i]+"</td><td>"+pricelst[i]+"</td><td>"+earninglst[i]+"</td><td>"+ earningRate[i]+"%"+"</td></tr>";
						
					}
				}else{
					var btn= document.getElementById("companies").innerHTML="X";
				}
		
				function setCompany(company_name){
					frm.target="cmpny";
					frm.action = location.herf+"?stockname="+company_name;
					frm.submit();
				}
				</script>
</body>

</html>