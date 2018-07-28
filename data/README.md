(Makefile) downloads:
* [Fires_100.xlsx](), and
* fire17_1.zip

Unzipping (fire17_1.zip) leads to the Geodatabase (fire17_1.gdb)

=================================

Taking a quick peek with GDAL:

```
% ogrinfo fire17_1.gdb
INFO: Open of `fire17_1.gdb'
      using driver `OpenFileGDB' successful.
1: Non_FireRX_Legacy13_1 (Multi Polygon)
2: firep17_1 (Multi Polygon)
3: rxburn17_1 (Multi Polygon)
```

=================================

The official description [1] of these data
are:

[1]: http://frap.fire.ca.gov/projects/fire_data/fire_perimeters_data_description)


## Fire Perimeter Database Description

The Fire Perimeter Database is maintained an an ESRI ArcGIS File Geodatabase. There are three feature classes (data layers) within the GDB. For 2017, these are:

* firep17_1: depicting wildfire perimeters from contributing agencies current as 2017;

* rxburn17_1: depicting prescribed fires supplied from contributing agencies current as 2017;;

* Non_FireRX_Legacy13_1: depicting non-prescribed fire fuel reduction projects that were initially included in the database. Fuels reduction projects that are non prescribed fire are no longer included.

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

