# Load necessary libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(readxl)

# Load the dataset

data <-read_excel("songs.xlsx")
summary(data)
# Remove rows with any NA values
data_cleaned <- na.omit(data)


# Analyze the distribution of videos across different channels
channel_distribution <- data %>%
  count(channelTitle) %>%
  arrange(desc(n))

ggplot(channel_distribution, aes(x = reorder(channelTitle, -n), y = n)) +
  geom_bar(stat = "identity", fill = "purple") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Distribution of Videos Across Channels", x = "Channel", y = "Number of Videos")


# Investigate relationships between likes, comments, and views

# Relationship Between Views and Likes
plot(data$viewCount, data$likeCount,
     main = "Relationship Between Views and Likes",
     xlab = "View Count",
     ylab = "Like Count",
     pch = 16,
     col = "blue")

# Relationship Between Views and Comments
plot(data$viewCount, data$commentCount,
     main = "Relationship Between Views and Comments",
     xlab = "View Count",
     ylab = "Comment Count",
     pch = 16,
     col = "red")

# Relationship Between Views and Favorites
plot(data$viewCount, data$favoriteCount,
     main = "Relationship Between Views and Favorites",
     xlab = "View Count",
     ylab = "Favorite Count",
     pch = 16,
     col = "green")


data <- data %>%
  mutate(publishedAt = as.Date(publishedAt, format = "%Y-%m-%d"))
# Explore temporal trends
data <- data %>%
  mutate(hour = hour(hms(publishedAt)))

# Plot view counts over hours of the day
plot(data$hour,data$viewCount, main = "Views Over Hours of the Day", xlab = "Hour", ylab = "Views")


