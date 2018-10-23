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
					<p> Nullam et orci eu lorem consequat tincidunt vivamus et sagittis magna sed nunc rhoncus condimentum sem. In efficitur ligula tate urna. Maecenas massa sed magna lacinia magna pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis tempus. </p>

				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=948254373&amp;format=interactive"></iframe>
				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=936850732&amp;format=interactive"></iframe>

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

		<pre><code>

SELECT PassholderType, COUNT(*) AS Count FROM BikeShare GROUP BY PassholderType ORDER BY COUNT(*) DESC;

</code></pre>
<br>
<pre><code>

SELECT PassholderType, AVG(Duration) AS Average_Time FROM BikeShare GROUP BY PassholderType ORDER BY AVG(Duration) DESC;

</code></pre>
<br>
<pre><code>

SELECT Duration, COUNT(*) AS Count FROM BikeShare GROUP BY Duration ORDER BY COUNT(*) DESC;

 	</code></pre>

	</div>
</section>

</div>
