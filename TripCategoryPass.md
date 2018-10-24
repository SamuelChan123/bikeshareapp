---
title: Trip Category + Pass Holders
layout: landing
description: 'What is the breakdown of Trip Route Category-Passholder type combinations? What might make a particular combination more popular?'
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
					<h3>Graphs and Data Visualization</h3>
				</header>
				<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSDkHpvMe6_URtnaDE1rfvSKauAQcQgESzbr7ernzcGIYiuz_fZAl-odFaRAI2dq172609pAhdRL7Pc/pubchart?oid=1079006564&amp;format=interactive"></iframe>
				<br><br>
					<p> Using the SQL query below, I acquired and then graphed the data in the interactive graphic above. As can be observed, bike share riders are  disproportionately are monthly pass holders and one way riders. Walk-ups riding One Way are also fairly common; however, they are only about 40% of the number of riders who ride monthly/one way. Round trips, regardless of which pass, are fairly rare. In proportion to the corresponding trip category, however, walk-ups are much more likely to go round trip than flex or monthly pass holders.

					<br><br>

					For example, for monthly pass holders, the ratio of round trips to one way trips is about 0.0487, for flex pass holders, the ratio is 0.0535, and for walk-ups, the ratio is 0.2577.

					 Staff riders are fairly statistically insignificant due to their fair rarity of rides, but for them, the ratio of round trips to one way trips is 0.2776.  </p>


			</div>
		</div>
	</section>
	<section>
		<a href="generic.html" class="image">
			<img src="assets/images/bike3.jpg" alt="" data-position="top center" />
		</a>
		<div class="content">
			<div class="inner">
				<header class="major">
					<h3>Analysis</h3>
				</header>
				<p> 1. Regular pass holders (monthly + flex pass holders) are much more likely to take one-way trips. This makes sense because these individuals are those who are most likely to commute on a regular basis to and from work; thus, they have to take a one-way trip from home to work, and another one-way trip from work back to home. The ratio difference between monthly and flex pass holders is inconsequential, since both groups are most likely to be commuters. </p>

			</div>
		</div>
	</section>

</section>


<section id="two" class="spotlights">
<section>
<div class="content">
	<div class="inner">

				<p>2. Since round-trips tend to be more for those who are willing to enjoy their bike ride (they must start and end at the same destination, so it can be assumed they are bike sharing for the experience as opposed to using it as a quicker, cheap mode of transportation) and less likely to commute, it makes sense that those who do not have regular passes (walk-ups) have a higher ratio of round-trips as opposed to regular pass holders. Of course, this ratio is still low because many walk-ups still take one-way trips from one destination to another.

				<br><br>3. Staff annual pass holders are a different case––they are a regular pass holder and yet their ratio is the highest for round-trips to one-way trips. Part of this can be attributed to statistical error, which is greater for smaller sample sizes. However, a big reason why staff might have a higher ratio is because many staff ride on the same bike throughout the day to conduct their responsibilities (whether that be making sure the bike stations are well-stocked, no logistical/physical issue, etc.) </p>

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
Number of Rides for Pass Holder Type and Trip Category:
<br><br>
		<pre><code>
SELECT PassholderType, TripRouteCategory, COUNT(*) AS Count
FROM BikeShare
GROUP BY PassholderType, TripRouteCategory
ORDER BY COUNT(*) DESC;
		</code></pre>

	</div>
</section>

</div>
