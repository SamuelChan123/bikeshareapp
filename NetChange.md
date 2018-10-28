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
			<b>Roughly a net of 0.288389513108582 bikes lost per day overall from all stations combined, or 0.00430432109 bikes lost per day per station.</b>
			<br>
			<br>

			<p>1. This translates to about a bike lost from a bike share station in LA about once every 4 days </p>
			<p>2. This does make sense, because an increasingly hard to solve issue for bike sharing worldwide is that many users do not remember to park bikes back at their stations. Or, bikes could be lost, broken, and otherwise misplaced. </p>
<p>
			3. The following are two tables and two graphs corresponding to those tables, the first table/graph with the top 10 stations with net inflow of bikes per day, and the second table/graph with the net outflow of bikes per day

</p>
			<p>4. On average, then, transporting bikes from the station with the greatest net inflow of bikes daily to the station with the greatest net outflow of bikes per day, and from the second greatest net inflow to the second greatest net outflow, etc. all the way to the median (net gain of 0.033 bikes) would be the most effective way to preserve a net change of 0 bikes over the course of a day (and hence, year) and to match travel patterns. </p>
			<p>
						5. On average, by running the SQL query below, the 2-hour period where there is the least number of rides occurring (and hence least change in bikes), happens during 3-5 am, where there is an average of 0.08 bike rides per station (exceptionally infrequently) in this block. This would be the most optimal time to move bikes between stations.
			<br></p>

			<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=126611753&amp;format=interactive"></iframe>
			<br><br>

			<table style="width:100%">
  <tr>
    <th><u>Station ID</u></th>
    <th><u>Net Change of Bikes Into the Station</u></th>
  </tr>
  <tr>
    <td>3005</td>
    <td>5.165</td>
  </tr>
  <tr>
    <td>3042</td>
    <td>4.787</td>
  </tr>
	<tr>
		<td>3000</td>
		<td>3.468</td>
	</tr>
	<tr>
		<td>3031</td>
		<td>3.326</td>
	</tr>
	<tr>
		<td>3014</td>
		<td>3.049</td>
	</tr>
	<tr>
		<td>3063</td>
		<td>3.049</td>
	</tr>
	<tr>
		<td>3082</td>
		<td>2.978</td>
	</tr>
	<tr>
		<td>3023</td>
		<td>1.923</td>
	</tr>
	<tr>
		<td>3022</td>
		<td>1.663</td>
	</tr>
	<tr>
		<td>3032</td>
		<td>1.169</td>
	</tr>
	</table>


<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=794869951&amp;format=interactive"></iframe>

	<br><br>

	<table style="width:100%">
	<tr>
    <th><br><u>Station ID</u></th>
    <th><br><u>Net Change of Bikes Into the Station</u></th>
  </tr>
	<tr>
		<td>3029</td>
		<td>-1.884</td>
	</tr>
	<tr>
		<td>3028</td>
		<td>-2.464</td>
	</tr>
	<tr>
		<td>3049</td>
		<td>-2.491</td>
	</tr>
	<tr>
		<td>3027</td>
		<td>-2.607</td>
	</tr>
	<tr>
		<td>3052</td>
		<td>-2.831</td>
	</tr>
	<tr>
		<td>3007</td>
		<td>-2.966</td>
	</tr>
	<tr>
		<td>3055</td>
		<td>-3.034</td>
	</tr>
	<tr>
		<td>3030</td>
		<td>-3.127</td>
	</tr>
	<tr>
		<td>3024</td>
		<td>-3.318</td>
	</tr>
	<tr>
		<td>3068</td>
		<td>-8.498</td>
	</tr>
</table>

 <iframe width="713.5" height="441.17969833333336" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1624575144&amp;format=interactive"></iframe>

 <br><br>
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
Net Gain or Loss of Bikes from Each Station:
<br><br>
<pre><code>
SELECT DISTINCT s.StationId,
s.AllRides/
((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare))))
AS NetGainofBikesPerDay

FROM

(SELECT A.StartingId AS StationId, (B.counts2 - A.counts1) AS AllRides

FROM

((SELECT StartingId, COUNT(*)
AS counts1 FROM BikeShare GROUP BY StartingId) AS A
INNER JOIN
(SELECT EndingId, COUNT(*)
AS counts2 FROM BikeShare GROUP BY EndingId) AS B
ON A.StartingId = B.EndingId)

ORDER BY AllRides DESC)
AS s

ORDER BY s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) DESC

</code></pre>
 Total Net Gain of Bikes Per Day Across All Stations:<br><br>
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
Calculating the Median Net Gain of Bikes Per Day:<br><br>

<pre><code>
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

</code></pre>
<pre><code>
CREATE AGGREGATE median(anyelement) (
 SFUNC=array_append,
 STYPE=anyarray,
 FINALFUNC=_final_median,
 INITCOND='{}'
);

</code></pre>
<pre><code>
SELECT median(NetGainofBikesPerDay) FROM

(SELECT DISTINCT s.AllRides/
((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare))))
AS NetGainofBikesPerDay

FROM

(SELECT A.StartingId AS StationId, (B.counts2 - A.counts1) AS AllRides

FROM

((SELECT StartingId, COUNT(*)
AS counts1 FROM BikeShare GROUP BY StartingId) AS A
INNER JOIN
(SELECT EndingId, COUNT(*)
AS counts2 FROM BikeShare GROUP BY EndingId) AS B
ON A.StartingId = B.EndingId)

ORDER BY AllRides DESC)
AS s

ORDER BY s.AllRides/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))) DESC) AS allNet

</code></pre>
Finding Times When Net Flow of Bikes are Relatively Stable:<br><br>
<pre><code>
SELECT
	CASE
		WHEN EXTRACT(HOUR FROM StartTime) >= 0 AND EXTRACT(HOUR FROM StartTime) <= 2
			THEN '0-2'
		WHEN EXTRACT(HOUR FROM StartTime) >= 3 AND EXTRACT(HOUR FROM StartTime) <= 5
			THEN '3-5'
		WHEN EXTRACT(HOUR FROM StartTime) >= 6 AND EXTRACT(HOUR FROM StartTime) <= 8
			THEN '6-8'
		WHEN EXTRACT(HOUR FROM StartTime) >= 9 AND EXTRACT(HOUR FROM StartTime) <= 11
			THEN '9-11'
		WHEN EXTRACT(HOUR FROM StartTime) >= 12 AND EXTRACT(HOUR FROM StartTime) <= 14
			THEN '12-14'
		WHEN EXTRACT(HOUR FROM StartTime) >= 15 AND EXTRACT(HOUR FROM StartTime) <= 17
			THEN '15-17'
		WHEN EXTRACT(HOUR FROM StartTime) >= 18 AND EXTRACT(HOUR FROM StartTime) <= 20
			THEN '18-20'
		WHEN EXTRACT(HOUR FROM StartTime) >= 21 AND EXTRACT(HOUR FROM StartTime) <= 23
			THEN '21-23'
		ELSE 'Out of Bounds'
	END TimeOfDay,
	(COUNT(*)/((SELECT DATE_PART('day',(SELECT MAX(StartTime) FROM BikeShare) - (SELECT MIN(StartTime) FROM BikeShare)))))/(SELECT COUNT(DISTINCT StartingId) FROM BikeShare) AS NetRidesPerDay
FROM BikeShare
GROUP BY TimeOfDay
ORDER BY COUNT(*) DESC;
</code></pre>
	</div>
</section>
</div>
