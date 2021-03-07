1.List the year and the number of collisions per year. Suppose there are more years than just 2018. 

Tricky part is the date. Will store in DATE format.

` SELECT DISTINCT COUNT(*) AS num_collisions, DATEPART(yyyy, C.collision_date)  AS Year FROM Collisions C GROUP BY DATEPART(yyyy, C.collision_date)   `


2. Find the most popular vehicle make in the database. Also list the number of vehicles of that particular
make.

` SELECT P.vehicle_make, COUNT(*) FROM Parties P GROUP BY P.vehicle_make ORDER BY COUNT(*) DESC LIMIT 1 `


3. Find the fraction of total collisions that happened under dark lighting conditions.

` SELECT (COUNT(*)/(SELECT COUNT(*) FROM Collisions)) AS fraction FROM Collisions C WHERE C.lightning IN ('C', 'D', 'E') `


4. Find the number of collisions that have occurred under snowy weather conditions

` SELECT COUNT(*) FROM Collisions C WHERE C.weather_1='D' OR C.weather_2='D' `

(do we need to keep weather_2 ? is it useful)

5. Compute the number of collisions per day of the week, and find the day that witnessed the highest
number of collisions. List the day along with the number of collisions.

` SELECT COUNT(*) AS num_collisions, DATENAME(WEEKDAY, C.collison_date) FROM Collisions C GROUP BY DATEPART(WEEKDAY, C.collison_date) ORDER BY
COUNT(*) DESC LIMIT 1 `

6. List all weather types and their corresponding number of collisions in descending order of the number
of collisions.

` SELECT W.weather_name, COUNT(*) FROM Collisions C, WeatherTranslation W WHERE C.weather_1 = W.weather_id GROUP BY C.weather_1 ORDER BY COUNT(*) DESC ` 

7. Find the number of at-fault collision parties with financial responsibility and loose material road
conditions.

` SELECT COUNT(*) FROM COLLISIONS C, PARTIES P WHERE C.case_id=P.case_id AND P.at_fault= 1 AND P.financial_responsability= 'Y' AND 
C.road_condition_1 = 'B' OR C.road_condition_2='B' `


8. Find the median victim age and the most common victim seating position.

` SELECT (SELECT S.seating_positon FROM Victims V, SeatingTranslation S WHERE S.id =V.victim_seating_position GROUP BY V.victim_seating_position ORDER BY COUNT(*) DESC LIMIT 1) as most_common_position, MEDIAN(V.victim_age) as median_age FROM VICTIMS V1 `

9. What is the fraction of all participants that have been victims of collisions while using a belt?

` SELECT COUNT(*)/(SELECT COUNT(*) FROM VICTIMS) FROM VICTIMS V WHERE V.victim_safety_equipment1='C' AND / OR V.victim_safety_equipment1='G' `

10. Compute and the fraction of the collisions happening for each hour of the day (for example, x% at 13, where 13 means period from 13:00 to 13:59). Display the ratio as percentage for all the hours of the day. 

` SELECT COUNT(*)/(SELECT COUNT(*) FROM COLLISIONS) AS percentage, EXTRACT(HOUR from C.collision_time) AS hour  FROM Collisions C GROUP BY hour `