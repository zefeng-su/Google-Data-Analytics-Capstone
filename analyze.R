#count of bike type, number of trips, member type
cleaned_df %>%
  group_by(rideable_type, member_type) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x = rideable_type, y = count_trips, fill = member_type)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  geom_text(aes(label = count_trips), position = position_dodge(width = 0.9), vjust = -0.3) +
  scale_fill_manual(values = c("casual" = "#f6c85f", "member" = "#0b84a5")) +
  theme_minimal() +
  labs(title = "Bicycle Type Number of Trips", x = "Bicycle Type", y = "Count of Trips")


#count of bike type, number of trips, member type, facet by Member Type  
cleaned_df %>%
  group_by(rideable_type, member_type) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x = rideable_type, y = count_trips, fill = rideable_type)) +
  geom_bar(stat = 'identity') +
  facet_wrap(~ member_type) +
  scale_fill_manual(values = c("classic_bike" = "#f6c85f", "electric_bike" = "#0b84a5", "docked_bike" = "#996666")) +
  theme_bw() +
  labs(title = "Bicycle Type Number of Trips by Member Type", x = "Bicycle Type", y = "Count of Trips")


#Arranges the weekdays in order Mon to Sun.
cleaned_df$day_of_week <- ordered(cleaned_df$day_of_week, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"))

#Number bike rides per week BAR CHART
cleaned_df %>%
  group_by(member_type,day_of_week) %>%
  dplyr::summarize(count_trips = n()) %>%  
  ggplot(aes(x= day_of_week, y=count_trips, fill= member_type, color=member_type)) +
  geom_bar(stat='identity', position = 'dodge') +
  scale_fill_manual(values = c("casual" = "#f6c85f", "member" = "#0b84a5")) +
  theme_minimal()+
  labs(title ="Number of bike rides per Week", x = "Day", y = "Count of Trips")

#Number bike rides per month BAR CHART
# Order the month column
cleaned_df$month <- ordered(cleaned_df$month, levels=c("01", "02", "03", "04", "05", "06", "07","08","09","10","11","12"))

cleaned_df %>%
  group_by(member_type, month) %>%
  dplyr::summarize(count_trips = n()) %>%
  ggplot(aes(x = month, y = count_trips, fill = member_type, color = member_type)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  scale_fill_manual(values = c("casual" = "#f6c85f", "member" = "#0b84a5")) +
  theme_minimal() +
  labs(title = "Number of bike rides per month", x = "Month", y = "Count of Trips")

#Popular Start Stations for Casual riders
# Summarize and filter the data
top_stations <- cleaned_df %>%
  group_by(member_type, start_station_name) %>%
  dplyr::summarise(number_of_ride = n()) %>%
  filter(start_station_name != "", member_type == "casual") %>%
  arrange(desc(number_of_ride)) %>%
  head(n = 30) %>%
  select(-member_type)

ggplot(top_stations, aes(x = reorder(start_station_name, -number_of_ride), y = number_of_ride)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Flip coordinates for readability
  labs(
    title = "Top 30 Start Stations by Number of Rides for Casual Members",
    x = "Start Station Name",
    y = "Number of Rides"
  ) +
  theme_minimal()

#Popular Start Stations for Member riders
# Summarize and filter the data
top_member_stations <- cleaned_df %>%
  group_by(member_type, start_station_name) %>%
  dplyr::summarise(number_of_ride = n()) %>%
  filter(start_station_name != "", member_type == "member") %>%
  arrange(desc(number_of_ride)) %>%
  head(n = 30) %>%
  select(-member_type)

# Create the bar chart with ggplot2
ggplot(top_member_stations, aes(x = reorder(start_station_name, -number_of_ride), y = number_of_ride)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Flip coordinates for readability
  labs(
    title = "Top 30 Start Stations by Number of Rides for Members",
    x = "Start Station Name",
    y = "Number of Rides"
  ) +
  theme_minimal()

