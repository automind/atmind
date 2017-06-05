<%@ page language ="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="include/header.jsp" %>

<script src="//d3js.org/d3.v4.min.js"></script>

<div class="firstTimeOperation" style="width:40; padding-left:10px; padding-right:10px;">
<span id="graph_pane"></span><BR>
</div>
<style>
.line{
  fill: none;
  stroke: #000;
}
</style>




<script>

$(document).ready(function(){
	graphStart();
	sytem_message('READY');
	g_reloadTimer = setInterval(reloadManager, 500);
});


var current_watt_for_graph = 0;

function graphStart(){

	    var n = 60,    // x 축 범위를 위한 변수 

	    random = d3.random.normal(0, 0), 

	    data = d3.range(n).map(random);   // 0~0 으로 x축(60) 범위를 초기화 한다. 

	var margin = {top: 20, right: 20, bottom: 20, left: 40},    // 그래프 상하좌우 공백

	    width = 500 - margin.left - margin.right,                      // 그래프 x 크기

	    height = 280 - margin.top - margin.bottom;                 // 그래프 y 크기 




	var x = d3.scale.linear()              // 그래프의 너비에 맞추어 x  축을 0~59로 나눈다.

	    .domain([0, n - 1])

	    .range([0, width]);




	var y = d3.scale.linear()             // 그래프의 높이에 맞추어 0~100으로 나눈다.

	    .domain([0, 100])

	    .range([height, 0]);




	var line = d3.svg.line()               // svg 라인이 설정되는(그려지는) 방법을 알려준다. 

	    .x(function(d, i) { return x(i); })

	    .y(function(d, i) { return y(d); });

 

   // div id 가 "graph_pane" 인것에 svg 형식의 그래프 그려준다.

	var svg = d3.select("#graph_pane").append("svg")    

	    .attr("width", width + margin.left + margin.right)       // 너비 설정

	    .attr("height", height + margin.top + margin.bottom) // 높이 설정

	  .append("g")                                                             //  그룹 "g"  속성  추가 

	    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");  // 변환(transform) 속성 설정 




	svg.style("fill", "#fff8ee")    // 그래프 색상 설정 




	svg.append("defs").append("clipPath")   // clipPath  설정 (보여지길 원하는 사이즈 설정, 이외는 버림) 

	    .attr("id", "clip")

	  .append("rect")  // rect 설정 

	    .attr("width", width)

	    .attr("height", height);




	svg.append("g")   // x 축에 대한 그룹 엘리먼트 설정 

	    .attr("class", "x axis")

	    .attr("transform", "translate(0," + y(0) + ")")

	    .call(d3.svg.axis().scale(x).orient("bottom"));




	svg.append("g")  // y 축에 대한 그룹 엘리먼트 설정 

	    .attr("class", "y axis")

	    .call(d3.svg.axis().scale(y).orient("left"));




	

	var path = svg.append("g") 

	    .attr("clip-path", "url(#clip)")

	  .append("path")    // 실제 데이터가 그려질 패스에 대한 설정 

	    .datum(data)

	    .attr("class", "line")

	    .attr("d", line);







 	path    // 실제 데이터가 그려질 패스에 대한 스타일 설정 

        .style('stroke-width', 1)

        .style('stroke', 'yellow');




	tick();  




	function tick() {




	  // 새로운 데이터를 뒤에 추가한다. (ajax 를 통해 1초에 한번씩 가장 최신 데이터를 가져온것을 넣어줌)

	  data.push(current_watt_for_graph);




	  // 라인을 PATH 방식으로 그리자!!!   

	  path

	      .attr("d", line)

	      .attr("transform", null)    // 기존 변환 행렬을 초기화하고  

	      .transition()                 // 변환 시작

	      .duration(1000)          // 1초동안 애니매이션하게 설정

	      .ease("linear")           // ease 보간을 리니어로 처리한다.(https://github.com/mbostock/d3/wiki/Transitions#d3_ease)

	      .attr("transform", "translate(" + x(-1) + ",0)")   //  변환행렬 설정   # 패스를 다시 그리는 방식이                                                                                     //  아니라 좌표를 변환함으로써 출렁거리는것을 막는다. 

	      .each("end", tick);    //tick 함수 계속 호출 

		 

	  //가장 오래된 데이터를 제거한다.

	  data.shift();




	}

}
/* 




var graph_timer = null;

var graph_time_interval = 1000;  // 1 초에 한번 꼴로 데이터 폴링 

function graph_loading()

{

	clearInterval(graph_timer);

	{

		// ajax 로  가장 최근 데이터 1개 가져와서

		$.get("cmp_test_watt.jsp", function(data, status){

			if (status == "success")

			{

				console.info(data);

				var jsonObj = $.parseJSON(data);

				console.info(jsonObj.watt);

				current_watt_for_graph = jsonObj.watt;  // 	최근 watt 정보 대입

			}

			else

			{

				console.info("error");

			}

		});

	}	

	graph_timer = setInterval(graph_loading, graph_time_interval);

}

 */



</script>
	


































<body>

<!-- 
<h1>Path Transitions</h1>
<p>This is a working example from: <a href="https://bost.ocks.org/mike/path/">https://bost.ocks.org/mike/path/</a></p>
<p><b>Scroll down to see the graph</b></p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum massa in ornare auctor. Nunc tincidunt cursus ipsum ac egestas. Morbi quis mi id leo vulputate vestibulum et nec diam. Duis fringilla mauris in erat vehicula, sed euismod libero scelerisque. Sed eget justo vel lectus aliquet tempus. Integer ut placerat orci. Cras nunc felis, vulputate ac posuere vitae, vestibulum nec diam. Proin molestie, quam ut mattis vehicula, eros elit sodales felis, et viverra ligula massa a nisi. Curabitur condimentum vulputate convallis. Duis aliquam molestie venenatis. Ut feugiat eleifend rutrum. Fusce rutrum sapien at ligula pretium facilisis vel ut diam.</p>
<p>This chart, for example, shows your scrolling activity while reading this document over the last three minutes:</p>
<div class="graph"></div>




<script>
(function() {

	var n = 243,
	    duration = 750,
	    now = new Date(Date.now() - duration),
	    count = 0,
	    scrollData = d3.range(n).map(function() { return 0; });

	var margin = {top: 6, right: 0, bottom: 20, left: 40},
	    width = 960 - margin.right,
	    height = 120 - margin.top - margin.bottom;

	var x = d3.time.scale()
	    .domain([now - (n - 2) * duration, now - duration])
	    .range([0, width]);

	var y = d3.scale.linear()
	    .range([height, 0]);

	var line = d3.svg.line()
	    .interpolate("basis")
	    .x(function(d, i) { return x(now - (n - 1 - i) * duration); })
	    .y(function(d, i) { return y(d); });

	var svg = d3.select(".graph").append("p").append("svg")
	    .attr("width", width + margin.left + margin.right)
	    .attr("height", height + margin.top + margin.bottom)
	    .style("margin-left", -margin.left + "px")
	  .append("g")
	    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	svg.append("defs").append("clipPath")
	    .attr("id", "clip")
	  .append("rect")
	    .attr("width", width)
	    .attr("height", height);

	var axis = svg.append("g")
	    .attr("class", "x axis")
	    .attr("transform", "translate(0," + height + ")")
	    .call(x.axis = d3.svg.axis().scale(x).orient("bottom"));

	var path = svg.append("g")
	    .attr("clip-path", "url(#clip)")
	  .append("path")
	    .datum(scrollData)
	    .attr("class", "line");

	var transition = d3.select({}).transition()
	    .duration(750)
	    .ease("linear");

	d3.select(window)
	    .on("scroll", function() { ++count; });

	(function tick() {
	  transition = transition.each(function() {

	    // update the domains
	    now = new Date();
	    x.domain([now - (n - 2) * duration, now - duration]);
	    y.domain([0, d3.max(scrollData)]);

	    // push the accumulated count onto the back, and reset the count
	    scrollData.push(Math.min(30, count));
	    count = 0;

	    // redraw the line
	    svg.select(".line")
	        .attr("d", line)
	        .attr("transform", null);

	    // slide the x-axis left
	    axis.call(x.axis);

	    // slide the line left
	    path.transition()
	        .attr("transform", "translate(" + x(now - (n - 1) * duration) + ")");

	    // pop the old data point off the front
	    scrollData.shift();

	  }).transition().each("start", tick);
	})();
	})();

</script> -->




</body>














	
<%@include file="include/footer.jsp" %>
