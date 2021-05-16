good to know:

Code evaluation follows the Logical Processing Order of the SELECT statement .

Aliases can be used only if they were introduced in the preceding step. So aliases in the SELECT clause can be used in the ORDER BY but not the GROUP BY clause.

1.FROM
2.ON
3.JOIN
4.WHERE
5.GROUP BY
6.WITH CUBE or WITH ROLLUP
7.HAVING
8.SELECT
9.DISTINCT
10.RDER BY
11.TOP


1. For the drivers of age groups: underage (less and equal to 18 years), young I [19, 21], young II [22,24],
adult [24,60], elder I [61,64], elder II [65 and over), find the ratio of cases where the driver was the party
at fault. Show this ratio as percentage and display it for every age group – if you were an insurance
company, based on the results would you change your policies?


select  sum(case when AT_FAULT = 1 then 1 else 0 END)/count(*) as RATIO,AGE_GROUP
from PARTY P
INNER JOIN  ((select (CASE
WHEN P1.PARTY_AGE <= 18
THEN 'underage'
WHEN P1.PARTY_AGE >= 19 AND P1.PARTY_AGE <= 21
THEN 'young I'
WHEN P1.PARTY_AGE >= 22 AND P1.PARTY_AGE <= 24
THEN 'young II'
WHEN P1.PARTY_AGE >= 24 AND P1.PARTY_AGE <= 60
THEN 'adult'
WHEN P1.PARTY_AGE >= 61 AND P1.PARTY_AGE <= 64
THEN 'elder I'
WHEN P1.PARTY_AGE >=65
THEN 'elder II'
END) AS AGE_GROUP, P1.PARTY_ID AS new_id
from PARTY P1))  on P.PARTY_ID = new_id
where PARTY_TYPE = '1'
group by AGE_GROUP
order by AGE_GROUP;



2. Find the top-5 vehicle types based on the number of collisions on roads with holes. List both the vehicle
type and their corresponding number of collisions.
3. Find the top-10 vehicle makes based on the number of victims who suffered either a severe injury or
were killed. List both the vehicle make and their corresponding number of victims.
4. Compute the safety index of each seating position as the fraction of total incidents where the victim
suffered no injury. The position with the highest safety index is the safest, while the one with the lowest
is the most unsafe. List the most safe and unsafe victim seating position along with its safety index.
5. How many vehicle types have participated in at least 10 collisions in at least half of the cities?
6. For each of the top-3 most populated cities, show the city location, population, and the bottom-10
collisions in terms of average victim age (show collision id and average victim age).
7. Find all collisions that satisfy the following: the collision was of type pedestrian and all victims were above
100 years old. For each of the qualifying collisions, show the collision id and the age of the eldest collision
victim.
8. Find the vehicles that have participated in at least 10 collisions. Show the vehicle id and number of
collisions the vehicle has participated in, sorted according to number of collisions (descending order).
What do you observe?
9. Find the top-10 (with respect to number of collisions) cities. For each of these cities, show the city
location and number of collisions.
10. Are there more accidents around dawn, dusk, during the day, or during the night? In case lighting
information is not available, assume the following: the dawn is between 06:00 and 07:59, and dusk
between 18:00 and 19:59 in the period September 1 - March 31; and dawn between 04:00 and 06:00,
and dusk between 20:00 and 21:59 in the period April 1 - August 31. The remaining corresponding times
are night and day. Display the number of accidents, and to which group it belongs, and make your
conclusion based on absolute number of accidents in the given 4 periods.