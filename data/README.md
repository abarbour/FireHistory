[Makefile](Makefile) downloads:
* [Fires_100.xlsx](Fires_100.xlsx), and
* fire17_1.zip (not tracked here since it's ~35 Mb)

Unzipping (fire17_1.zip) leads to the Geodatabase (fire17_1.gdb)

-----

Taking a quick peek with GDAL:

```
% ogrinfo fire17_1.gdb
INFO: Open of `fire17_1.gdb'
      using driver `OpenFileGDB' successful.
1: Non_FireRX_Legacy13_1 (Multi Polygon)
2: firep17_1 (Multi Polygon)
3: rxburn17_1 (Multi Polygon)
```

In [R](https://www.r-project.org/), for example, we can then access the `.gdb` directory:
```r
library(rgdal)

fc <- readOGR(dsn="./fire17_1.gdb", layer="firep17_1")
# OGR data source with driver: OpenFileGDB
#  Source: "[...]/FireHistory/data/fire17_1.gdb", layer: "firep17_1"
# with 20096 features
# It has 17 fields

summary(fc)
# Object of class SpatialPolygonsDataFrame
# Coordinates:
#         min      max
# x -373237.5 519987.8
# y -604727.6 518283.7
# Is projected: TRUE
# proj4string :
# [+proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0
# +y_0=-4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs]
# Data attributes:
#    YEAR_              STATE              AGENCY            UNIT_ID
# Length:20096       Length:20096       Length:20096       Length:20096
# Class :character   Class :character   Class :character   Class :character
# Mode  :character   Mode  :character   Mode  :character   Mode  :character
#
#  FIRE_NAME           INC_NUM           ALARM_DATE         CONT_DATE
# Length:20096       Length:20096       Length:20096       Length:20096
# Class :character   Class :character   Class :character   Class :character
# Mode  :character   Mode  :character   Mode  :character   Mode  :character
#
#     CAUSE          COMMENTS           REPORT_AC        GIS_ACRES
# Min.   : 1.000   Length:20096       Min.   :     0   Min.   :     0.0
# 1st Qu.: 4.000   Class :character   1st Qu.:    16   1st Qu.:    33.7
# Median : 9.000   Mode  :character   Median :    65   Median :   174.6
# Mean   : 9.266                      Mean   :  2023   Mean   :  1692.6
# 3rd Qu.:14.000                      3rd Qu.:   375   3rd Qu.:   672.4
# Max.   :19.000                      Max.   :499945   Max.   :501082.0
# NA's   :42                          NA's   :12346    NA's   :6
#
#    C_METHOD       OBJECTIVE       FIRE_NUM          Shape_Length
# Min.   :1.000   Min.   :1.000   Length:20096       Min.   :     8.8
# 1st Qu.:1.000   1st Qu.:1.000   Class :character   1st Qu.:  1757.2
# Median :6.000   Median :1.000   Mode  :character   Median :  4059.9
# Mean   :4.821   Mean   :1.013                      Mean   :  8694.1
# 3rd Qu.:8.000   3rd Qu.:1.000                      3rd Qu.:  8510.8
# Max.   :8.000   Max.   :2.000                      Max.   :445282.4
# NA's   :12221   NA's   :195
#
#   Shape_Area
# Min.   :5.000e+00
# 1st Qu.:1.360e+05
# Median :7.056e+05
# Mean   :6.848e+06
# 3rd Qu.:2.720e+06
# Max.   :2.028e+09
```

-----

The official description<sup>[1]</sup> of these data
are:



## Fire Perimeter Database Description

The Fire Perimeter Database is maintained an an ESRI ArcGIS File Geodatabase. There are three feature classes (data layers) within the GDB. For 2017, these are:

* `firep17_1`: depicting wildfire perimeters from contributing agencies current as 2017;

* `rxburn17_1`: depicting prescribed fires supplied from contributing agencies current as 2017;;

* `Non_FireRX_Legacy13_1`: depicting non-prescribed fire fuel reduction projects that were initially included in the database. Fuels reduction projects that are non prescribed fire are no longer included.

## Fire Perimeters Attribute Table Item Definitions

|ITEM NAME |DATA |TYPEDESCRIPTION |Domain |
|--------- |---- |--------------- |------ |
|YEAR_ | Text | Fire Year | No |
|STATE | Text | State | Yes |
|AGENCY | Text | Direct protection agency responsible for fire | Yes |
|UNIT_ID | Text	 | ICS code for unit | Yes |
|FIRE_NAME | Text | Name of the fire | No |
|INC_NUM | Text | Number assigned by the Emergency Command Center of the responsible agency for the fire | No |
|ALARM_DATE | Date | Alarm date for fire | No |
|CONT_DATE | Date | Containment date for fire | No |
|CAUSE | Integer | Reason fire ignited | Yes |
|COMMENTS | Text | Miscellaneous comments | No |
|REPORT_AC | Number | Estimated area consumed in fire | No |
|GIS_ACRES | Number | GIS calculated area in acres | No |
|C_METHOD | Integer | Method used to collect perimeter data | Yes |
|OBJECTIVE | Integer | Either suppression or resource benefit | Yes |
|FIRE_NUM | Text | -- | No |

## State Coding

|Agency ID | Description |
|--------- |------------ |
|CA | California |
|NV | Nevada |
|OR | Oregon |
|AZ | Arizona |

## Agency Coding

|Agency |Description |
|------ |----------- |
|BIA | USDI Bureau of Indian Affairs|
|BLM | Bureau of Land Management|
|CDF | California Department of Forestry and Fire Protection|
|CCO | Contract Counties|
|DOD | Department of Defense|
|FWS | USDI Fish and Wildlife Service|
|LRA | Local Response Area|
|NOP | No Protection|
|NPS | National Park Service|
|PVT | Private|
|USF | United States Forest Service|
|OTH | Other|

## Cause coding

|Cause Code |Description |
|---------- |----------- |
|1 | Lightning|
|2 | Equipment Use|
|3 | Smoking|
|4 | Campfire|
|5 | Debris|
|6 | Railroad|
|7 | Arson|
|8 | Playing with Fire|
|9 | Miscellaneous|
|10 | Vehicle|
|11 | Power Line|
|12 | Firefighter Training|
|13 | Non-Firefighter Training|
|14 | Unknown/Unidentified|
|15 | Structure|
|16 | Aircraft|
|17 | Volcanic|
|18 | Escaped Prescribed Burn|
|19 | Illegal Alien Campfire|

## Collection Method coding

|Cause Code |Description |
|---------- |----------- |
|1 | GPS Ground|
|2 | GPS Air|
|3 | Infrared|
|4 | Other Imagery|
|5 | Photo Interpretation|
|6 | Hand Drawn|
|7 | Mixed Collection Methods|
|8 | Unknown|

## Objective coding

|Cause Code |Description |
|---------- |----------- |
|1 | Suppression (Wildfire)|
|2 | Resource Benefit (WFU)|

## UNIT ID coding

For unit id codes, download this spreadsheet.

[1]: http://frap.fire.ca.gov/projects/fire_data/fire_perimeters_data_description
