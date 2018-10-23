---
title: Bike Share Commuters
layout: landing
description: 'How many riders include bike sharing as a regular part of their commute?'
image: assets/images/bike5.jpg
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
			<p>The number of rides originally is 132427 rides (same as the number of rows)
					<br>1. Trip Type must be one-way. Since commuters must park their bike, thus finishing the trip at a different station when coming into work and similarly when leaving): This cuts the number of trips down to 119642 rides.
					<br>2. Duration of the trip must be longer than 300 seconds, since normal commutes should take more than 5 minutes otherwise there is no point in spending money to bike to work. (96914 rides)
					<br>3. Passholders must not be walk-ups, because to qualify as regular part of their commute, they must not be walk ups (65474 rides)
					<br>4. Additionally, the start time should be between 6-9am in the morning or 5-7 at night, because those are normal arriving and leaving hours for (assuming) a 9-5 job (13129 rides)
					<br>5. Divide this by number of days (since with the above criteria, the total number of commuter trips is isolated) (~25 rides --> 25 is the number of commuters) </p>
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
<pre><code>
SELECT SUM(count) /

(SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))

* 0.5
FROM (SELECT StartingId, EndingId, Duration, StartTime, Endtime, COUNT(*) AS count
FROM BikeShare
WHERE (TripRouteCategory = 'One Way' AND Duration > 300 ) AND (PassHolderType = 'Flex Pass' OR PassHolderType = 'Monthly Pass' OR PassHolderType = 'Staff Annual')
GROUP BY StartingId, EndingId, Duration, StartTime, EndTime
HAVING ((EXTRACT(HOUR FROM StartTime) > 6 AND EXTRACT(HOUR FROM StartTime) < 9) OR (EXTRACT(HOUR FROM StartTime) > 17 AND EXTRACT(HOUR FROM StartTime) < 19))
ORDER BY COUNT(*) DESC)

AS countTable;
		</code></pre>


	</div>
</section>

</div>
