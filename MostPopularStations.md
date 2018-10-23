---
title: Most Popular Stations
layout: landing
description: 'Which start/stop stations are most popular?'
image: assets/images/bike2.jpg
nav-menu: true
---

<!-- Main -->
<div id="main">

<!-- One -->
<section id="one" class="spotlights">
	<section>
		<div class="content">
			<div class="inner">
				<header class="major">
					<h3>Graphs and Data Visualization</h3>
				</header>

					<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1498518844&amp;format=interactive"></iframe>

					<br>
						<p> Nullam et orci eu lorem consequat tincidunt vivamus et sagittis magna sed nunc rhoncus condimentum sem. In efficitur ligula tate urna. Maecenas massa sed magna lacinia magna pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis tempus. </p>

					<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1801250696&amp;format=interactive"></iframe>

					<br>
						<p> Nullam et orci eu lorem consequat tincidunt vivamus et sagittis magna sed nunc rhoncus condimentum sem. In efficitur ligula tate urna. Maecenas massa sed magna lacinia magna pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis tempus. </p>

					<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1975973841&amp;format=interactive"></iframe>

					<br>
						<p> Nullam et orci eu lorem consequat tincidunt vivamus et sagittis magna sed nunc rhoncus condimentum sem. In efficitur ligula tate urna. Maecenas massa sed magna lacinia magna pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis tempus. </p>

			</div>
		</div>
	</section>
	</section>



	<!-- One -->
	<section id="two" class="spotlights">
		<section>
				<div class="content">
				<div class="inner">
					<header class="major">
					<h3>Analysis</h3>
				</header>
				<br><br>
				<h4> Assumptions/Criteria </h4>
				<p> 1. Assume the average miles per second for each user is roughly the same (hence, find this by dividing sum of distances in One way trips by sum of duration)

				<br>2. Hence, since d = rt, multiply this miles per second average by the total time spent in all trips to get the total distance

				<br>3. Divide the total distance by the total number of trips to get the average distance travelled per trip.</p>
				</div>
			</div>
		</section>
	</section>


<!-- Two -->
<section id="three">
	<div class="inner">
		<header class="major">
			<h2>SQL Queries Used</h2>
		</header>
		Most Popular Starting Station IDs: <br><br>
		<pre><code>
SELECT StartingId, COUNT(*) AS counts FROM BikeShare GROUP BY StartingId ORDER BY COUNT(*) DESC;
		</code></pre>
		<br>
		Most Popular Ending Station IDs: <br><br>
		<pre><code>
SELECT EndingId, COUNT(*) AS counts FROM BikeShare GROUP BY EndingId ORDER BY COUNT(*) DESC;
		</code></pre>
		<br>
		Most Popular Overall Station IDs: <br><br>
		<pre><code>
SELECT A.StartingId AS StationId, (A.counts1 + B.counts2) AS AllRides
FROM
((SELECT StartingId, COUNT(*) AS counts1
FROM BikeShare
GROUP BY StartingId) AS A

INNER JOIN

(SELECT EndingId, COUNT(*) AS counts2
FROM BikeShare
GROUP BY EndingId) AS B

ON A.StartingId = B.EndingId)

ORDER BY AllRides DESC;
		</code></pre>

	</div>
</section>

</div>
