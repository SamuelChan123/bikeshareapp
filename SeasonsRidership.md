---
title: Seasons and Ridership
layout: landing
description: 'How does ridership change with seasons? Types of passes used, trip duration, etc'
image: assets/images/bike6.jpg
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
				<h3>Graphs and Data Visualization</h3>
			</header>

			<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=271665241&amp;format=interactive"></iframe>				
			<br>
			<p> Nullam et orci eu lorem consequat tincidunt vivamus et sagittis magna sed nunc rhoncus condimentum sem. In efficitur ligula tate urna. Maecenas massa sed magna lacinia magna pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis tempus. </p>

			<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=29820259&amp;format=interactive"></iframe>
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
			<b><u>The average distance travelled is estimated to be <i>3.6923</i> miles</u></b>
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

<pre><code>
SELECT
	CASE
		WHEN EXTRACT(MONTH FROM StartTime) >= 12 OR EXTRACT(MONTH FROM StartTime) <= 2
			THEN 'Winter'
		WHEN EXTRACT(MONTH FROM StartTime) >= 3 AND EXTRACT(MONTH FROM StartTime) <= 5
			THEN 'Spring'
		WHEN EXTRACT(MONTH FROM StartTime) >= 6 AND EXTRACT(MONTH FROM StartTime) <= 8
			THEN 'Summer'
		ELSE 'Autumn'
	END Season,
	PassholderType, COUNT(*) AS NumberOfRides
FROM BikeShare
GROUP BY Season, PassholderType
ORDER BY COUNT(*)  DESC, Season DESC;

</code></pre>
<br>
<pre><code>
SELECT
	CASE
		WHEN EXTRACT(MONTH FROM StartTime) >= 12 OR EXTRACT(MONTH FROM StartTime) <= 2
			THEN 'Winter'
		WHEN EXTRACT(MONTH FROM StartTime) >= 3 AND EXTRACT(MONTH FROM StartTime) <= 5
			THEN 'Spring'
		WHEN EXTRACT(MONTH FROM StartTime) >= 6 AND EXTRACT(MONTH FROM StartTime) <= 8
			THEN 'Summer'
		ELSE 'Autumn'
	END Season,
	CASE
		WHEN Duration >= 0 AND Duration < 120
			THEN 'Between 0 and 120 seconds'
		WHEN Duration >= 120 AND Duration < 300
			THEN 'Between 120 and 300 seconds'
		WHEN Duration >= 300 AND Duration < 900
			THEN 'Between 300 and 900 seconds'
		ELSE 'Over 900 seconds' END DurationBucket, COUNT(*) AS NumberOfRides
FROM BikeShare
GROUP BY Season, DurationBucket
ORDER BY COUNT(*) DESC, Season DESC;

 </code></pre>

	</div>
</section>

</div>
