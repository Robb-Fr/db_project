## ENTITIES :


### VICTIMS:
- victims (key: id) (linked to a case_id and party_number) (might be a relationship ?)

is the victim id unique to every other victim in the database or only unique if taking into account case_id and party_number ? It seems to be unique on its own.

### COLLISIONS:
- case (key : case_id)

tow_away should be boolean

location_type, que veut dire "Blank or - - Not State Highway" dans la description du projet ?

### PARTIES:
- party (key: id) (linked to a case_id) (party_number is the assigned number in the case)(def : groups of people (parties) that were involved in the accident)

party_sex and party_age indicates the age and sex of the party at the time of the collision (BUT IT'S A GROUP ??) QUESTION


les codes alphabétiques sont appliqués la moitié du temps, à uniformiser

Il y a des valeurs vides pour certain attribute (vehicle_year) où "Blank -- Not Stated" n'est pas mentionné dans leur description, est-ce acceptable ?

## RELATIONSHIPS:

on pourra avoir pour chaque code alphabétique, une table qui fait la translation ( A : Code violation, B: Other Improper Driving, ...) afin d'avoir des attributs qui sont strictement de longeur 1 et UTF-8

### Requirements

A victim is involved in one collision.
A party is involved in one collision.
A party is constituted of one or more victims.

A collision has one or more parties involved.


## QUERIES requirement 