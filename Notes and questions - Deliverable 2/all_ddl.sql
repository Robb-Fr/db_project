create table Vehicle
(
    statewide_vehicle_type CHAR(1) CHECK (statewide_vehicle_type IN
                                          ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O')),
    vehicle_make           CHAR(30),
    vehicle_year           NUMBER(4),
    vehicle_id             INTEGER
        constraint VEHICLE_PK
            primary key
);


create table Road
(
    road_surface      CHAR CHECK (road_surface IN ('A', 'B', 'C', 'D')),
    lighting          CHAR CHECK (lighting IN ('A', 'B', 'C', 'D', 'E')),
    location_type     CHAR CHECK (location_type IN ('H', 'I', 'R')),
    ramp_intersection CHAR CHECK (ramp_intersection IN ('1', '2', '3', '4', '5', '6', '7', '8')),
    road_id           INTEGER
        constraint ROAD_PK
            primary key
);

create table Location
(
    county_city_location INTEGER
        constraint LOCATION_PK
            primary key,
    population           CHAR CHECK ( population IN ('1', '2', '3', '4', '5', '6', '7', '9', '0'))
);

create table Pcf
(
    pcf_violation            NUMBER,
    pcf_violation_category   NUMBER(2) CHECK ( pcf_violation_category >= 0 AND pcf_violation_category <= 24 ),
    pcf_violation_subsection CHAR,
    primary_collision_factor CHAR CHECK ( primary_collision_factor IN ('A', 'B', 'C', 'D', 'E') ),
    pcf_id                   INTEGER
        constraint PCF_PK
            primary key
);

create table Collision
(
    case_id              CHAR(25)
        constraint COLLISION_PK
            primary key,
    collision_date       DATE,
    collision_severity   CHAR not null,
    county_city_location INTEGER
        constraint COLLISION_LOCATION_COUNTY_CITY_LOCATION_FK
            references LOCATION,
    hit_and_run          CHAR not null,
    jurisdiction         NUMBER(4),
    officer_id           Varchar2(20 byte),
    process_date         DATE not null,
    tow_away             INTEGER,
    type_of_collision    CHAR,
    road_id              INTEGER
        constraint COLLISION_ROAD_ROAD_ID_FK
            references ROAD,
    pcf_id               INTEGER
        constraint COLLISION_PCF_PCF_ID_FK
            references PCF
);

create table Collision_In_Road_Conditions
(
    road_conditions CHAR(1) CHECK ( road_conditions IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') ) NOT NULL,
    case_id         CHAR(25)
        constraint COLLISION_IN_ROAD_CONDITION_COLLISION_CASE_ID_FK
            references COLLISION
                on delete cascade
);

create table Collision_In_Weather
(
    case_id CHAR(25)
        constraint COLLISION_IN_WEATHER_COLLISION_CASE_ID_FK
            references COLLISION
                on delete cascade,
    weather CHAR CHECK ( weather IN ('A', 'B', 'C', 'D', 'E', 'F', 'G') ) NOT NULL
);

create table party
(
    party_id                     INTEGER,
    CONSTRAINT PARTY_PK primary key (party_id),
    party_number                 INTEGER,
    at_fault                     NUMBER(1) default 0 not null CHECK (at_fault >= 0 AND at_fault < 2),
    cellphone_use                CHAR CHECK ( cellphone_use IN ('B', 'C', 'D') ),
    financial_responsibility     CHAR CHECK ( financial_responsibility IN ('N', 'Y', 'O', 'E') ),
    hazardous_materials          CHAR CHECK ( hazardous_materials IN ('A') ),
    movement_preceding_collision CHAR CHECK (movement_preceding_collision IN
                                             ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                                              'P', 'Q', 'R')),
    party_age                    INTEGER CHECK ( party_age >= 0 ),
    party_drug_physical          CHAR CHECK ( party_drug_physical IN ('E', 'F', 'H', 'I', 'G') ),
    party_sex                    CHAR CHECK (party_sex IN ('M', 'F')),
    party_sobriety               CHAR CHECK ( party_sobriety IN ('A', 'B', 'C', 'D', 'G', 'H')),
    party_type                   CHAR CHECK (party_type IN ('1', '2', '3', '4', '5')),
    school_bus_related           CHAR CHECK ( school_bus_related IN ('E') ),
    vehicle_id                   INTEGER
        constraint PARTY_VEHICLE_VEHICLE_ID_FK
            references VEHICLE,
    case_id                      CHAR(25)
        constraint PARTY_COLLISION_CASE_ID_FK
            references COLLISION
                on delete cascade
);

create table Party_Equipped_With
(
    party_id         INTEGER
        constraint PARTY_EQUIPPED_WITH_PARTY_PARTY_ID_FK
            references PARTY
                on delete cascade,
    safety_equipment CHAR CHECK ( safety_equipment IN
                                  ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
                                   'T', 'U', 'V', 'W', 'X', 'Y') ) NOT NULL
);

create table Associated_to
(
    party_id                INTEGER
        constraint
            ASSOCIATED_TO_PARTY_PARTY_ID_FK
            references PARTY
                on delete cascade,
    other_associated_factor CHAR(1) CHECK ( other_associated_factor IN
                                            ('A', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                                             'S',
                                             'T', 'U', 'V', 'W', 'X', 'Y') ) NOT NULL
);

create table victim
(
    victim_id               INTEGER
        constraint VICTIM_PK
            primary key,
    victim_age              INTEGER CHECK ( victim_age >= 0 ),
    victim_degree_of_injury CHAR CHECK ( victim_degree_of_injury IN ('1', '2', '3', '4', '5', '6', '7', '0') ),
    victim_ejected          CHAR CHECK ( victim_ejected IN ('0', '1', '2', '3') ),
    victim_role             CHAR CHECK ( victim_role IN ('1', '2', '3', '4', '5', '6') ),
    victim_seating_position CHAR CHECK ( victim_seating_position IN
                                         ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                                          'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4',
                                          '5', '6', '7', '8', '9', '0') ),
    victim_sex              CHAR CHECK ( victim_sex IN ('M', 'F') ),
    party_id                INTEGER
        constraint VICTIM_PARTY_ID_FK references PARTY on delete cascade
);

create table Victim_Equipped_With
(
    victim_id        INTEGER
        constraint VICTIM_EQUIPPED_WITH_VICTIM_VICTIM_ID_FK
            references VICTIM
                on delete cascade,
    safety_equipment CHAR CHECK ( safety_equipment IN
                                  ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
                                   'T', 'U', 'V', 'W', 'X', 'Y') ) NOT NULL
);