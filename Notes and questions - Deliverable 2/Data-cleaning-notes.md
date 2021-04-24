
# Remarks

-tow_away should be boolean

-we can collapse collision_time and collison_date together.

-school_bus_related should be a boolean or included in statewide_vehicle_type (already school bus inside)

-party_type = pedestrian should imply statewide_vehicle_type = pedestrian but sometimes null

- put officer back into collisions and leading zeros



## Collision csv :

collision_date: OK
collision_severity : OK
collision_time : some values are NaN
county_city_location: OK
hit_and_run: 1 value with NaN, we may drop it if needed
jurisdiction: OK
lighting: OK




