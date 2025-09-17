# Load Packages
install.packages('gridExtra')
library(gridExtra)
install.packages('emmeans')
library(emmeans)

# Copy the dataset
reg.data <- final

#-------------------------------------------------------------------------------#

# Prepare Total Spending vs Email Conversion Rate Smooth Line
ggplot(reg.data, aes(y = TotalSpending, x = EmailConversionRate)) +
  geom_point() + geom_smooth() + labs(x = 'Email Conversion Rate', y = 'Total Spending') +
  ggtitle('Total Spending vs Email Conversion Rate Smooth Line')

# Prepare Total Spending vs Social Media Conversion Rate
ggplot(reg.data, aes(y = TotalSpending, x = SocialMediaConversionRate)) +
  geom_point() + geom_smooth() + labs(x = 'Social Media Conversion Rate', y = 'Total Spending') +
  ggtitle('Total Spending vs Social Media Conversion Rate Smooth Line')

# Prepare Total Spending vs Search Engine Conversion Rate
ggplot(reg.data, aes(y = TotalSpending, x = SearchEngineConversionRate)) +
  geom_point() + geom_smooth() + labs(x = 'Search Engine Conversion Rate', y = 'Total Spending') +
  ggtitle('Total Spending vs Search Engine Conversion Rate Smooth Line')

# Convert reg.data to long format
reg_long <- reg.data %>%
  pivot_longer(cols = c(EmailConversionRate, SocialMediaConversionRate, SearchEngineConversionRate),
               names_to = "ConversionType", values_to = "ConversionRate")

# Plot wrapped plot
ggplot(reg_long, aes(x = ConversionRate, y = TotalSpending)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ ConversionType, nrow = 3, scales = "free_x") +
  labs(x = 'Conversion Rate', y = 'Total Spending', title = 'Total Spending vs Conversion Rates')


#-------------------------------------------------------------------------------#

# Model the regression line with EmailConversionRate
email.reg <- lm(TotalSpending~EmailConversionRate, data = reg.data)
summary(email.reg)

# Model the regression line with SocialMediaConversionRate
social.reg <- lm(TotalSpending~SocialMediaConversionRate, data = reg.data)
summary(social.reg)

# Model the regression line with SearchEngineConversionRate
search.reg <- lm(TotalSpending~SearchEngineConversionRate, data = reg.data)
summary(search.reg)

# Model the regression line with all
all.reg <- lm(TotalSpending~EmailConversionRate + 
                SocialMediaConversionRate + 
                SearchEngineConversionRate, data = reg.data)
summary(all.reg)

# Check confidence intervals
cbind(coef(all.reg), confint(all.reg))

#-------------------------------------------------------------------------------#

# Create bins
email.bins <- quantile(pull(reg.data, EmailConversionRate))
reg.data <- reg.data %>%
  mutate(EmailBin = cut(EmailConversionRate, email.bins, include.lowest = TRUE))

social.bins <- quantile(pull(reg.data, SocialMediaConversionRate))
reg.data <- reg.data %>%
  mutate(SocialBin = cut(SocialMediaConversionRate, social.bins, include.lowest = TRUE))

search.bins <- quantile(pull(reg.data, SearchEngineConversionRate))
reg.data <- reg.data %>%
  mutate(SearchBin = cut(SearchEngineConversionRate, search.bins, include.lowest = TRUE))

#-------------------------------------------------------------------------------#

# Plot the Total Spending vs Social Media Conversion Rate based on Email Conversion Rates
ggplot(reg.data, aes(x = SocialMediaConversionRate, y = TotalSpending, col = EmailBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Social Media Conversion Rate", y = "Total Spending", col = "Email Conversion Rate") +
  ggtitle("Total Spending vs Social Media Conversion Rate based on Email Conversion Rates")

# Plot the Total Spending vs Email Conversion Rate based on Social Media Conversion Rates
ggplot(reg.data, aes(x = EmailConversionRate, y = TotalSpending, col = SocialBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Email Conversion Rate", y = "Total Spending", col = "Social Media Conversion Rate") +
  ggtitle("Total Spending vs Email Conversion Rate based on Social Media Conversion Rates")

# Plot the Total Spending vs Social Media Conversion Rate based on Search Engine Conversion Rate
ggplot(reg.data, aes(x = SocialMediaConversionRate, y = TotalSpending, col = SearchBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Social Media Conversion Rate", y = "Total Spending", col = "Search Engine Conversion Rate") +
  ggtitle("Total Spending vs Social Media Conversion Rate based on Search Engine Conversion Rates")

# Plot the Total Spending vs Search Engine Conversion Rate based on Social Media Conversion Rates
ggplot(reg.data, aes(x = SearchEngineConversionRate, y = TotalSpending, col = SocialBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Search Engine Conversion Rate", y = "Total Spending", col = "Social Media Conversion Rate") +
  ggtitle("Total Spending vs Search Engine Conversion Rate based on Social Media Conversion Rates")

# Plot the Total Spending vs Email Conversion Rate based on Search Engine Conversion Rate
ggplot(reg.data, aes(x = EmailConversionRate, y = TotalSpending, col = SearchBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Email Conversion Rate", y = "Total Spending", col = "Search Engine Conversion Rate") +
  ggtitle("Total Spending vs Email Conversion Rate based on Search Engine Conversion Rates")

# Plot the Total Spending vs Search Engine Conversion Rate based on Email Conversion Rates
ggplot(reg.data, aes(x = SearchEngineConversionRate, y = TotalSpending, col = EmailBin)) +
  geom_point() + geom_smooth(method = lm) + geom_smooth(mapping = aes(col = NULL), method = lm, col = "black") +
  labs(x = "Search Engine Conversion Rate", y = "Total Spending", col = "Email Conversion Rate") +
  ggtitle("Total Spending vs Search Engine Conversion Rate based on Email Conversion Rates")

