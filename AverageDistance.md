---
title: Average Distance
layout: landing
description: 'What is the average distance travelled per trip?'
image: assets/images/bike4.jpg
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
			<b><u>The average distance travelled is estimated to be <i>3.6923</i> miles</u></b>
			<br>
			<br>
			<h4> Assumptions/Criteria </h4>
			<p> 1. Assume the average miles per second for each user is roughly the same. We use one-way trips to calculate miles per second because we assume that riders in one-way trips will take roughly a straight line between the start and end stations, so for a trip, finding the distance between the two stations and dividing by the duration of the trip will give the average miles per second for that trip. We sum all of these up by taking the average distance between stations (for one-way trips) and dividing by the total duration.

			<br><br>2. Hence, since d = rt, multiply this miles per second average by the total time spent in all trips to get the total distance. This includes both one-way trips and round-trips. We assume people in round-trips bike at roughly the same speed as one-way trip riders.

			<br><br>3. Divide the total distance by the total number of trips (number of rows in the data set) to get the average distance travelled per trip.

			<br><br>


			</p>
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
Function to Calculate Distance between Two Geographical Points:<br><br>
<pre><code>
CREATE OR REPLACE FUNCTION distanceInMiles(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT) RETURNS FLOAT AS $$
DECLARE
	 x float = 69.1 * (lat2 - lat1);
	 y float = 69.1 * (lon2 - lon1) * cos(lat1 / 57.3);
BEGIN
	 RETURN sqrt(x * x + y * y);
END
$$ LANGUAGE plpgsql;
</code></pre>
Calculating Average Distance Based on Criteria Above:<br><br>
<pre><code>
SELECT SUM(Duration) *

(SELECT SUM(dist)/SUM(Duration) AS MilesperSecond
FROM
(SELECT distanceInMiles(CAST(StartingLatitude AS FLOAT), CAST(StartingLongitude AS FLOAT),
CAST(EndingLatitude AS FLOAT), CAST(EndingLongitude AS FLOAT)) AS dist, Duration
FROM BikeShare WHERE TripRouteCategory != 'Round Trip') AS allDistances1)

/ COUNT(*) FROM
(SELECT distanceInMiles(CAST(StartingLatitude AS FLOAT), CAST(StartingLongitude AS FLOAT),
CAST(EndingLatitude AS FLOAT), CAST(EndingLongitude AS FLOAT)) AS dist2, Duration FROM BikeShare)
AS sumAll;
</code></pre>

	</div>
</section>
</div>
