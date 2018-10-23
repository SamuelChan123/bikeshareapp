---
title: Net Change in Bikes
layout: landing
description: 'Is there a net change of bikes over the course of a day? If so, when and
where should bikes be transported in order to make sure bikes match travel patterns?'
image: assets/images/bike3.jpg
nav-menu: true
---


<!-- Main -->
<div id="main">

<!-- One -->
<section id="two" class="spotlights">

	<section>
			<div class="content">
			<div class="inner">
				<header class="major">
				<h3>Analysis</h3>
			</header>
			<b>Roughly 0.288389513108582 bikes lost per day overall from all stations, or 0.00430432109 bikes lost per day per station.</b>
			<br>
			<br>

			<p>1. This translates to about a bike lost from a bike share station in LA about once every 4 days </p>
			<p>2. This does make sense, because an increasingly hard to solve issue for bike sharing worldwide is that many users do not remember to park bikes back at their stations. Or, bikes could be lost, broken, and otherwise misplaced. </p>
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

		<pre><code>

(SELECT A.StartingId AS StationId, (B.counts2 - A.counts1) AS AllRides
FROM

((SELECT StartingId, COUNT(*)
AS counts1 FROM BikeShare GROUP BY StartingId) AS A
INNER JOIN
(SELECT EndingId, COUNT(*)
AS counts2 FROM BikeShare GROUP BY EndingId) AS B

ON A.StartingId = B.EndingId)
ORDER BY AllRides DESC)
</code></pre>
<br>
<pre><code>

SELECT SUM(NetGainofBikesPerDay) FROM (SELECT DISTINCT s.StationId, s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) AS NetGainofBikesPerDay

FROM

(SELECT A.StartingId AS StationId, (B.counts2 - A.counts1) AS AllRides

FROM

((SELECT StartingId, COUNT(*)
AS counts1 FROM BikeShare GROUP BY StartingId) AS A
INNER JOIN
(SELECT EndingId, COUNT(*)
AS counts2 FROM BikeShare GROUP BY EndingId) AS B
ON A.StartingId = B.EndingId)

ORDER BY AllRides DESC) AS s ORDER BY s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) DESC) AS sumofnet

	</code></pre>

	</div>
</section>
</div>
