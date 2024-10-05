
# Load necessary libraries
library(ggplot2)
library(ggthemes)
library(dplyr)
library(scales)  # For formatting the y-axis labels
library(readxl)  # Assuming you need this to read the Excel file

# Most Traded goods +--------------------------------

colombian_exports_2022 <- read_excel("Padova/Game Theory/Project/colombian_exports_2022.xlsx")
View(colombian_exports_2022)

# Price +--------------------------------
# Import price data
coffee_price <- read_excel("Padova/Game Theory/Project/coffee_price.xlsx")

# Ensure the date column is in Date format
coffee_price$date <- as.Date(coffee_price$date)

# Filter data for dates after December 2015
filtered_data <- coffee_price %>% 
  filter(date > as.Date("2015-12-31") & date < as.Date("2022-12-01"))

# Create the line chart with a thicker, dark blue line
p <- ggplot(filtered_data, aes(x=date, y=price)) +
  geom_line(size = 1.5, color = "darkblue") +  # Thicker dark blue line
  scale_x_date(date_breaks = "3 months", date_labels = "%b %Y") +  # Quarterly x-axis labels
  scale_y_continuous(labels = scales::comma) +  # Format y-axis labels with commas
  theme_economist() +  # Apply Economist theme
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +  # Rotate x-axis labels
  labs(x="Date", y="Price", title="Price Trend from January 2016 to November 2022")

# Print the plot
print(p)

ggsave("coffee_price_plot.pdf", plot = p, width = 6, height = 6)


