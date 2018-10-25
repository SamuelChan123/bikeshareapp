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

					<br><br>
						<p> Using the SQL query provided below, I computed the top 10 most popular <b>starting</b> station IDs and gave the number of rides in the interactive graphic above. </p>

					<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1801250696&amp;format=interactive"></iframe>

					<br><br>
						<p> Using the SQL query provided below, I computed the top 10 most popular <b>ending</b> station IDs and gave the number of rides in the interactive graphic above. </p>

					<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1975973841&amp;format=interactive"></iframe>

					<br><br>
						<p> Using the SQL query provided below, I computed the top 10 most popular <b>overall</b> station IDs (both starting and ending stations) and gave the number of rides in the interactive graphic above. This is probably the most complete graphic as we probably want stations that have the most overall traffic (both departing and re-entering the station), but I provided the other two graphs for context. </p>

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
				<h4> Assumptions/Criteria </h4>
				<p> 1. I included both round trips and one way trips, since even if people return to the same station, they still count as having frequented that station.</p>
				<p>2. The most popular overall stations (third graphic) were computed by grouping the stations together by ID and then adding the start and end counts. I thought it was important to keep these three metrics separate as it might be useful to see if some stations were more popular to dock at as opposed to start from (for example, touristy sites might be more prone to people arriving, whereas the opposite might be true at more random, roadside locations) </p>
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
		Most Popular Ending Station IDs: <br><br>
		<pre><code>
SELECT EndingId, COUNT(*) AS counts FROM BikeShare GROUP BY EndingId ORDER BY COUNT(*) DESC;
		</code></pre>
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
