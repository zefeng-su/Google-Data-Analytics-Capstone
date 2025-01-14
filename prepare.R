#Install packages
install.packages('tidyverse')
install.packages('janitor')
install.packages('lubridate')
install.packages('plyr')

#Loading packages
library(tidyverse)
library(janitor)
library(lubridate)
library(ggplot2)   
library(readr)  
library(plyr) 

#Var name <- Importing the csv(file_location)
Jan2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_01.csv")
Feb2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_02.csv")
Mar2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_03.csv")
Apr2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_04.csv")
May2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_05.csv")
Jun2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_06.csv")
Jul2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_07.csv")
Aug2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_08.csv")
Sep2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_09.csv")
Oct2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_10.csv")
Nov2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_11.csv")
Dec2023 <- read_csv("Cyclistic_Data_2023/Cyclistic_2023_12.csv")

