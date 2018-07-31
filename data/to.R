#!/usr/bin/env Rscript --no-save

###
#	to.R
# FireHistory/data
#	Created by 
#		/Users/abarbour/bin/ropen ( v. 2.6.6 )
#	on 
#		2018:209 (28-July)
#
#	[ Basic operations to test I/O of Geodatabase ]
#
###

library(tools)
library(tidyverse)
library(rgdal)
library(sp)

# The input file geodatabase
fgdb <- "./fire17_1.gdb"

# List all feature classes in a file geodatabase
subset(ogrDrivers(), grepl("GDB", name))
fc_list <- ogrListLayers(fgdb)

print(fc_list)
#[1] "Non_FireRX_Legacy13_1" "firep17_1"             "rxburn17_1"
#attr(,"driver")
#[1] "OpenFileGDB"
#attr(,"nlayers")
#[1] 3

# Read the feature class
reload <- FALSE
if (!exists('fc') | reload) fc <- readOGR(dsn=fgdb, layer="firep17_1")

# Determine the FC extent, projection, and attribute information
summary(fc)
#Object of class SpatialPolygonsDataFrame
#Coordinates:
#        min      max
#x -373237.5 519987.8
#y -604727.6 518283.7
#Is projected: TRUE
#proj4string :
#[+proj=aea +lat_1=34 +lat_2=40.5 +lat_0=0 +lon_0=-120 +x_0=0
#+y_0=-4000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs]
#Data attributes:
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
#   Shape_Area
# Min.   :5.000e+00
# 1st Qu.:1.360e+05
# Median :7.056e+05
# Mean   :6.848e+06
# 3rd Qu.:2.720e+06
# Max.   :2.028e+09

# View the feature class
#plot(fc) # this takes a while!

#+++++++++++

# > str(fc,2)
# Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#   ..@ data       :'data.frame':	20096 obs. of  17 variables:
#   ..@ polygons   :List of 20096
#   ..@ plotOrder  : int [1:20096] 10195 17383 19930 15181 17730 277 13009 10128 11441 16464 ...
#   ..@ bbox       : num [1:2, 1:2] -373238 -604728 519988 518284
#   .. ..- attr(*, "dimnames")=List of 2
#   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot

fc@data %>% tbl_df %>% 
	dplyr::mutate(Year = as.numeric(YEAR_),
		ALARM_DATE = gsub("2106", "2016", ALARM_DATE),
		Alarm = as.Date(ALARM_DATE),
		Contained = as.Date(CONT_DATE)) -> Dat

par(las=1)
plot(GIS_ACRES/sd(GIS_ACRES, na.rm=TRUE) ~ Alarm, Dat)

GRTo::bvmed(lis=log10(na.omit(Dat$GIS_ACRES)))

