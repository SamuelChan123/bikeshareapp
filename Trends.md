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
			<br>
			<h4> Criteria/Explanation </h4>
			<p> 1. Monthly pass holders are much more common than walk-ups, flex passes, or staff annuals for several reasons. Firstly, it is probably much more economically viable for commuters to buy a long-term pass than to bike share as a walk-up (there is usually plans that allow a monthly pass holder to ride an unlimited number of bikes during the month, or a small charge, whereas walk-ups are charged per ride). However, the reason why monthly passes are much more common than flex passes (yearly) is probably because ridership tends to decline during winter months, making the annual plan less appealing as there is less value added during the winter season. Since ridership tends to increase during warmer/temperate seasons, it makes more sense for commuters and casual bike riders to buy a monthly pass as opposed to a year long pass, and to buy a monthly pass compared to walk-up passes. Staff passes are of course limited, so they do not account for a significant proportion of the ridership overall. <br>

			<br>2. Walk-ups and staff annuals have a far higher ride duration than the flex/monthly passes. On average, walk-ups tend to be more for casual bikers, whereas those who buy passes tend to do so for commuting, who generally follow the same path route and ride as efficiently as possible. Staff annuals probably are much longer due to the smaller data set (thus higher probability for variance) as well as their intended responsibilities, which necessarily entail spending time on the bikes.<br>

			<br>3. It makes sense that most of the ride duration is concentrated between 5 and 10 minutes, as biking commuters usually will not spend too long on their bikes-–the same goes for those who only ride the bike to expedite their transportation from one point to another (as opposed to walking). As shown in the second graph, most walk-ups (who tend to be more casual) spend longer on their bikes, but they similarly make up a smaller proportion of the overall pool of riders.

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
		Number of Passes for Pass Holder Type: <br><br>
		<pre><code>
SELECT PassholderType, COUNT(*) AS Count FROM BikeShare GROUP BY PassholderType ORDER BY COUNT(*) DESC;

</code></pre>
Average Ride Time for Pass Holder Type:
<br><br>
<pre><code>
SELECT PassholderType, AVG(Duration) AS Average_Time FROM BikeShare GROUP BY PassholderType ORDER BY AVG(Duration) DESC;

</code></pre>
Number of Rides for Duration of Ride: <br><br>
<pre><code>
SELECT Duration, COUNT(*) AS Count FROM BikeShare GROUP BY Duration ORDER BY COUNT(*) DESC;
 	</code></pre>
Calculating the Mean and Median Ride Duration: <br><br>
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
