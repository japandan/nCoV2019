## Author: Daniel Vogel
## Map to Coordinates of Coronavirus 
##
## Required packages.  Install once
# having issues loading dplyr...try to run without this
#install.packages(c("data.table", "dplyr", "ggrepel", "tidyverse"))
# Load the relevant libraries - do this every time
require("lubridate")
require("ggplot2")
#require("dplyr")
#require("dbplyr")
require("data.table")
require("ggrepel")
require("tidyverse")
library("lubridate")
library("ggplot2")
library("data.table")
library("ggrepel")
library("tidyverse")
#
# grab the data
ncov_outside_hubei<-read.csv("./ncov_outside_hubei.csv")
ncov_hubei<-read.csv("./ncov_hubei.csv")
##
##
# Create some color variables for graphing later
col1 = "#011f4b"
col2 = "#6497b1"
col3 = "#b3cde0"
col4 = "#CC0000"
#
# Maps Static API key
#More Q&A - https://github.com/dkahle/ggmap/issues/51
#Get the latest Install
#if(!requireNamespace("devtools")) install.packages("devtools")
#devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)

#Load the library
library("ggmap")

#Set your API Key
ggmap::register_google(key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ....")

#Notes: If you get still have a failure then I suggest to restart R and run the library and register google commands again.
# AIzaSyBPLIptr_3tvU3BG2TL4fzezJ9RDL5Jxvg

##1) Create a map with all of the victim locations plotted.

p <- ggmap(get_googlemap(center = c(lon = 117.2, lat = 31.8),
                         zoom = 4, scale = 2,
                         maptype ='terrain',
                         color = 'color'))

p + geom_point(aes(x = longitude, y = latitude,  colour = Initial.Type.Group), data = ncov_outside_hubei, size = 0.5) + 
  theme(legend.position="bottom")
