#str(dataset_name)
str(Jan2023)
str(Feb2023)
str(Mar2023)
str(Apr2023)
str(May2023)
str(Jun2023)
str(Jul2023)
str(Aug2023)
str(Sep2023)
str(Oct2023)
str(Nov2023)
str(Dec2023)

#Creating new dataset name <- binding rows(all_your_datasets)
combined_df <- bind_rows(Jan2023, Feb2023, Mar2023, Apr2023, May2023, Jun2023, Jul2023, Aug2023, Sep2023, Oct2023, Nov2023, Dec2023)
                    
#Cleaning & removing any spaces, parentheses, etc.
combined_df <- clean_names(combined_df)

#removing_empty(dataset_name, by leaving c() empty, it selects rows & columns)
remove_empty(combined_df, which = c())

#Add Ride_Length column for calculations
combined_df$ride_length <- difftime(combined_df$ended_at, combined_df$started_at, units = "mins")

#Add Day_of_week column for calculations
combined_df$day_of_week <- wday(combined_df$started_at)

#Add columns that list the date, month, day, and year of each ride for further calculations
combined_df_v2 <-combined_df
combined_df_v2$date <- as.Date(combined_df_v2$started_at) #Default format yyyy-mm-dd
combined_df_v2$month <- format(as.Date(combined_df_v2$date), "%m")
combined_df_v2$day <- format(as.Date(combined_df_v2$date), "%d")
combined_df_v2$year <- format(as.Date(combined_df_v2$date), "%Y")
combined_df_v2$day_of_week <- format(as.Date(combined_df_v2$date), "%A")

#Remove rows with NA Values
combined_df_v2 <- na.omit(combined_df_v2)

#Remove duplicate rows in the dataframe
combined_df_v2 <- combined_df_v2 %>% 
  distinct()

#Remove columns not needed for analysis: ride_id, start_station_id, end_station_id, start_lat, start_long, end_lat, end_lng
combined_df_v2 <- combined_df_v2 %>%  
  select(-c(ride_id, start_station_id, end_station_id,start_lat,start_lng,end_lat,end_lng))

#Remove data where ride_length is 0 or negative <=0
combined_df_v2  <- combined_df_v2[!(combined_df_v2$ride_length <=0),]

#Convertion of ride length to numeric 
combined_df_v2$ride_length <- as.numeric(as.character(combined_df_v2$ride_length))
is.numeric(combined_df_v2$ride_length)
 
#Rename member_casual column in combined_df_v2 for clarity
combined_df_v2 <- combined_df_v2 %>% 
  dplyr::rename(member_type = member_casual)

#Save final cleaned df in new var
cleaned_df <- combined_df_v2[!(combined_df_v2$ride_length<=0),]

