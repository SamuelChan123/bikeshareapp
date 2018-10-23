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
			<b><u>Roughly <i>25</i> commuters use bike sharing as a regular part of their commute</u></b>
			<br>
			<br>
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
			<h2>SQL Query Used</h2>
		</header>


		SELECT SUM(NetGainofBikesPerDay) FROM (SELECT DISTINCT s.StationId, s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) AS NetGainofBikesPerDay FROM

		(SELECT A.StartingId AS StationId, (B.counts2 - A.counts1) AS AllRides

		FROM

		((SELECT StartingId, COUNT(*)
		AS counts1 FROM BikeShare GROUP BY StartingId) AS A

		INNER JOIN

		(SELECT EndingId, COUNT(*)
		AS counts2 FROM BikeShare GROUP BY EndingId) AS B

		ON A.StartingId = B.EndingId)

		ORDER BY AllRides DESC) AS s ORDER BY s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) DESC) AS sumofnet;

	</div>
</section>

</div>
