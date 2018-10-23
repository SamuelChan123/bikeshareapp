CREATE OR REPLACE FUNCTION distanceInMiles(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT) RETURNS FLOAT AS $$
DECLARE
   x float = 69.1 * (lat2 - lat1);
   y float = 69.1 * (lon2 - lon1) * cos(lat1 / 57.3);
BEGIN
   RETURN sqrt(x * x + y * y);
END
$$ LANGUAGE plpgsql;


--What is the average distance traveled?

SELECT SUM(Duration) * (SELECT SUM(dist)/SUM(Duration) AS MilesperSecond FROM
(SELECT distanceInMiles(CAST(StartingLatitude AS FLOAT), CAST(StartingLongitude AS FLOAT),
CAST(EndingLatitude AS FLOAT), CAST(EndingLongitude AS FLOAT)) AS dist, Duration FROM BikeShare WHERE TripRouteCategory != 'Round Trip')
AS allDistances1) / SUM(dist2)

FROM

(SELECT distanceInMiles(CAST(StartingLatitude AS FLOAT), CAST(StartingLongitude AS FLOAT),
CAST(EndingLatitude AS FLOAT), CAST(EndingLongitude AS FLOAT)) AS dist2, Duration FROM BikeShare)

AS sumAll;
