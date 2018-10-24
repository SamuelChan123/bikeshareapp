---
title: Interesting Trends/Metrics
layout: landing
description: 'Display or graph 3 metrics or trends from the data set that are interesting'
image: assets/images/bike1.jpg
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
				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=277235923&amp;format=interactive"></iframe>
				<br>
					<p> Here, running the SQL query provided below, I graphed the Number of Passes for Each Pass Holder Type. As is evident from the graph, monthly passes are generally much more common than any other type of rider. In fact, monthly pass holders(81304) are nearly twice as common as walk-ups (41224) plus flex passes (9517) and staff annual (392) riders combined.</p>

				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=948254373&amp;format=interactive"></iframe>
				<br><br>
					<p> Here, running the SQL query provided below, I graphed the Average ride time for Each Pass Holder Type. Interestingly, walk-ups and staff annuals have an average ride time that is far higher than both flex and monthly pass holders (Walk-up ride durations are on average rouhgly 3.5x the length of monthly pass holders)</p>

				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=936850732&amp;format=interactive"></iframe>

				<br><br>
					<p> Running the SQL query provided below, I have graphed the Number of Rides for the Duration of Ride. The most number of rides last 360 seconds, or 6 minutes, with the number of rides tapering off on both sides of this unimodal distribution. The data is skewed right, with the mean (~1555 seconds) being significantly higher than the median (600 seconds). The SQL queries for calculating the mean/median of the data are provided below </p>
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
			<h2>SQL Queries Used</h2>
		</header>
		Number of Passes for Pass Holder Type <br><br>
		<pre><code>
SELECT PassholderType, COUNT(*) AS Count FROM BikeShare GROUP BY PassholderType ORDER BY COUNT(*) DESC;
</code></pre>
Average Ride Time for Pass Holder Type
<br><br>
<pre><code>
SELECT PassholderType, AVG(Duration) AS Average_Time FROM BikeShare GROUP BY PassholderType ORDER BY AVG(Duration) DESC;

</code></pre>
 Number of Rides for Duration of Ride <br><br>
<pre><code>
SELECT Duration, COUNT(*) AS Count FROM BikeShare GROUP BY Duration ORDER BY COUNT(*) DESC;
 	</code></pre>
	Calculating the Mean and Median Ride Duration <br><br>
 <pre><code>

SELECT AVG(Duration) FROM BikeShare;


 CREATE FUNCTION _final_median(anyarray) RETURNS float8 AS $$
  WITH q AS
  (
     SELECT val
     FROM unnest($1) val
     WHERE VAL IS NOT NULL
     ORDER BY 1
  ),
  cnt AS
  (
    SELECT COUNT(*) AS c FROM q
  )
  SELECT AVG(val)::float8
  FROM
  (
    SELECT val FROM q
    LIMIT  2 - MOD((SELECT c FROM cnt), 2)
    OFFSET GREATEST(CEIL((SELECT c FROM cnt) / 2.0) - 1,0)  
  ) q2;
$$ LANGUAGE SQL IMMUTABLE;

CREATE AGGREGATE median(anyelement) (
  SFUNC=array_append,
  STYPE=anyarray,
  FINALFUNC=_final_median,
  INITCOND='{}'
);


SELECT median(Duration) AS MedianDuration FROM BikeShare;

  	</code></pre>
	</div>
</section>

</div>
