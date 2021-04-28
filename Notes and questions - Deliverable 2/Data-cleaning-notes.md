
# Remarks

-tow_away should be boolean

-we can collapse collision_time and collison_date together.

-school_bus_related should be a boolean or included in statewide_vehicle_type (already school bus inside)

-party_type = pedestrian should imply statewide_vehicle_type = pedestrian but sometimes null

- put officer back into collisions and leading zeros



# Collision csv :

collision_severity : OK

collision_time : some values are NaN

county_city_location: OK

hit_and_run: 1 value with NaN, we may drop it if needed

jurisdiction: OK

pcf_violation_category: "Driving or Bicycling Under the Influence of Alcohol or Drug" = "dui"

population: déjà encodé !

primary_collision_factor: "(Vehicle) Code Violation" =  vehicle code violation

process_date: OK

ramp_intersection: déjà encodé !

road_condition_1: encodé bizarrement, NEED TO MAKE ASSUMPTIONS

 normal
 construction
 obstruction
 holes
 loose material
 reduced width
 flooded
 other

road_surface: "Snowy or Icy" = "snowy" AND "Slippery (Muddy, Oily, etc.)" = slippery

tow_away: already encoded as boolean

type_of_collision: "Vehicle/Pedestrian" = "pedestrian"




# Parties csv :

at_fault: already encoded as a boolean

cellphone_use: already encoded

financial_responsibility: already encoded

hazardous_materials: already encoded as A but should probably be boolean ?

other_associated_factor_1: 
	WARNING "other_associated_factor_1" is written as "other_associate_factor_1"
	it's already encoded !

party_age: 15% of the values are missing ! 

Seems too much to drop the rows, we have to decide whether to replace by mean or median and the effects it will have
			
party_drug_physical: weird G value appearing, will become null value probably

party_safety_equipment_1: already encoded

party_sobriety: already encoded


party_type:  "Driver (including Hit and Run)" = "driver"

school_bus_related: already encoded as E but should probably be boolean ?

statewide_vehicle_type: "Passenger Car/Station Wagon" = "passenger car"


vehicle_make and vehicle_year: 5.8% of vehicle makes are missing, should we replace them by a new category UNKNOWN ?


# Victims csv :


party_age: 3.5% of values are missing, may be interesting to replace by mean or median

victim_ejected: already encoded

victim_role: already encoded

victim_safety_equipment_1: already encoded

victim_seating_position: already encoded



