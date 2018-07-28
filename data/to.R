#!/usr/bin/env Rscript --no-save

###
#	to.R
#	/Users/abarbour/shakabrah/local.projects/FireHistory/data
#	Created by 
#		/Users/abarbour/bin/ropen ( v. 2.6.6 )
#	on 
#		2018:209 (28-July)
#
#	[ What this script does, broadly ]
#
###

## local functions
#try(source('funcs.R'))

## libs

library(tools)

#if (!require("pacman")) install.packages("pacman", dependencies=TRUE)
#pacman::p_load(package1, package2, package_n)

# loads core tidy packages:  ggplot2, tibble, tidyr, readr, purrr, and dplyr
library(tidyverse)
#tidyverse_conflicts()
#tidyverse_update(TRUE)

## local/github libs
# devtools::install_github("abarbour/kook")
#library(kook)
#Set1 <- brew.set1()
#Set1l <- brew.set1(TRUE)
#Dark2 <- brew.dark2()
#Dark2l <- brew.dark2(TRUE)
#Dark2ll <- brew.dark2(TRUE,TRUE)

#+++++++++++

shake <- FALSE
redo <- FALSE
inter <- interactive()

#if (!exists("something") | redo){
#    fi <- "something.txt"
#    read.table(fi, header=TRUE) %>% tbl_df -> something
#    load(fi, verbose=TRUE)
#}

#+++++++++++

library(rgdal)

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
fc <- readOGR(dsn=fgdb, layer="firep17_1")

# Determine the FC extent, projection, and attribute information
summary(fc)

# View the feature class
#plot(fc)

#+++++++++++

#FIG <- function(...){
#}

#+++++++++++

#shake.fig <- TRUE
#if (shake.fig & inter){
#	FIG() 
#} else {
#	figfi <- "some_figure"
#	h <- w <- 7
#	niceEPS(figfi, h=h, w=w, toPDF=TRUE)
#	try(FIG())
#	niceEPS()
#	nicePNG(figfi, h=h, w=w)
#	try(FIG())
#	nicePNG()
#}

#kook::warn_shake()
