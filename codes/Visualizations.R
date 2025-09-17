#-------------------------------------------------------------------------------#

# Prepare box plot for Age
boxplot(final$Age, xlab = 'Age of Customers',
        main = 'Boxplot for Age', horizontal = T)

# Prepare box plot for TotalPurchases
boxplot(final$TotalPurchases, xlab = 'Total Purchases',
        main = 'Boxplot for Total Purchases', horizontal = T)

# Prepare box plot for Age
boxplot(final$AverageOrderValue, xlab = 'Average Order Value (£)',
        main = 'Boxplot for Average Order Value', horizontal = T)

# Prepare box plot for CustomerLifetimeValue
boxplot(final$CustomerLifetimeValue, xlab = 'Customer Lifetime Value',
        main = 'Boxplot for Customer Lifetime Value', horizontal = T)

# Prepare box plot for EmailEngagementRate
boxplot(final$EmailEngagementRate, xlab = 'Email Engagement Rate',
        main = 'Boxplot for Email Engagement Rate', horizontal = T)

# Prepare box plot for SocialMediaEngagementRate
boxplot(final$SocialMediaEngagementRate, xlab = 'Social Media Engagement Rate',
        main = 'Boxplot for Social Media Engagement Rate', horizontal = T)

# Prepare box plot for CustomerServiceInteractions
boxplot(final$CustomerServiceInteractions, xlab = 'Customer Service Interactions (Count)',
        main = 'Boxplot for Customer Service Interactions', horizontal = T)

# Prepare box plot for AverageSatisfactionScore
boxplot(final$AverageSatisfactionScore, xlab = 'Average Satisfaction Score (out of 10)',
        main = 'Boxplot for Average Satisfaction Score', horizontal = T)

# Prepare box plot for EmailConversionRate
boxplot(final$EmailConversionRate, xlab = 'Email Conversion Rate',
        main = 'Boxplot for Email Conversion Rate', horizontal = T)

# Prepare box plot for SocialMediaConversionRate
boxplot(final$SocialMediaConversionRate, xlab = 'Social Media Conversion Rate',
        main = 'Boxplot for Social Media Conversion Rate', horizontal = T)

# Prepare box plot for SearchEngineConversionRate
boxplot(final$SearchEngineConversionRate, xlab = 'Search Engine Conversion Rate',
        main = 'Boxplot for Search Engine Conversion Rate', horizontal = T)

# Prepare box plot for TotalSpending
boxplot(final$TotalSpending, xlab = 'Total Spending (£)',
        main = 'Boxplot for Total Spending', horizontal = T)

#-------------------------------------------------------------------------------#

# Prepare histogram for Age
hist(final$Age, main = 'Histogram for Customer Age',
     xlab = 'Years', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for TotalPurchases
hist(final$TotalPurchases, main = 'Histogram for Total Purchases',
     xlab = 'Number of Purchases', ylab = 'Count',
     breaks = 17, col = 'lightblue')

# Prepare histogram for AverageOrderValue
hist(final$AverageOrderValue, main = 'Histogram for Average Order Value',
     xlab = 'Average Order Value (£)', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for CustomerLifetimeValue
hist(final$CustomerLifetimeValue, main = 'Histogram for Customer Lifetime Value',
     xlab = 'Customer Lifetime Values', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for Email Engagement Rate
hist(final$EmailEngagementRate, main = 'Histogram for Email Engagement Rate',
     xlab = 'Percent', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for SocialMediaEngagementRate
hist(final$SocialMediaEngagementRate, main = 'Histogram for Social Media Engagement Rate',
     xlab = 'Percent', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for CustomerServiceInteractions
hist(final$CustomerServiceInteractions, main = 'Histogram for Customer Service Interactions',
     xlab = 'Number of Interactions', ylab = 'Count',
     breaks = 8, col = 'lightblue')

# Prepare histogram for AverageSatisfactionScore
hist(final$AverageSatisfactionScore, main = 'Histogram for Average Satisfaction Score',
     xlab = 'Scores', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for EmailConversionRate
hist(final$EmailConversionRate, main = 'Histogram for Email Conversion Rate',
     xlab = 'Percent', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for SocialMediaConversionRate
hist(final$SocialMediaConversionRate, main = 'Histogram for Social Media Conversion Rate',
     xlab = 'Percent', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for SearchEngineConversionRate
hist(final$SearchEngineConversionRate, main = 'Histogram for Search Engine Conversion Rate',
     xlab = 'Percent', ylab = 'Count',
     breaks = 30, col = 'lightblue')

# Prepare histogram for TotalSpending
hist(final$TotalSpending, main = 'Histogram for Total Spending',
     xlab = 'Total Spendings (£)', ylab = 'Count',
     breaks = 30, col = 'lightblue')

#-------------------------------------------------------------------------------#

# Prepare pair plot
final_numeric <- final[,numeric]
pairs(final_numeric, cex = 0.5)

final_pair <- final[,c(
  'CustomerLifetimeValue',
  'EmailConversionRate',
  'SocialMediaConversionRate',
  'SearchEngineConversionRate',
  'TotalSpending'
)]
pairs(final_pair, cex = 1)

#-------------------------------------------------------------------------------#

# Prepare correlation heat map
cor_matrix <- cor(final[,numeric], use = 'complete.obs')
corrplot(cor_matrix, method = 'color',
         addCoef.col = 'black', tl.col = 'red')

#-------------------------------------------------------------------------------#

# Prepare bar plot for Gender
ggplot(final, aes(x = Gender)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Gender', x = 'Genders', y = 'Count') +
  theme_minimal()

# Prepare bar plot for IncomeLevel
ggplot(final, aes(x = IncomeLevel)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Income Level', x = 'Income Levels', y = 'Count') +
  theme_minimal()

# Prepare bar plot for Country
ggplot(final, aes(x = Country)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Country', x = 'Countries', y = 'Count') +
  theme_minimal()

# Prepare bar plot for City
ggplot(final, aes(x = City)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for City', x = 'Cities', y = 'Count') +
  theme_minimal()

# Prepare bar plot for FavoriteCategory
ggplot(final, aes(x = FavoriteCategory)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Favorite Category', x = 'Categories', y = 'Count') +
  theme_minimal()

# Prepare bar plot for SecondFavoriteCategory
ggplot(final, aes(x = SecondFavoriteCategory)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Second Favorite Category', x = 'Categories', y = 'Count') +
  theme_minimal()

# Prepare bar plot for MobileAppUsage
ggplot(final, aes(x = MobileAppUsage)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Mobile App Usage', x = 'Usage Levels', y = 'Count') +
  theme_minimal()

# Prepare bar plot for RepeatCustomer
ggplot(final, aes(x = RepeatCustomer)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Repeat Customer', x = 'Repeat or Not', y = 'Count') +
  theme_minimal()

# Prepare bar plot for PremiumMember
ggplot(final, aes(x = PremiumMember)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Premium Member', x = 'Premium or Not', y = 'Count') +
  theme_minimal()

# Prepare bar plot for HasReturnedItems
ggplot(final, aes(x = HasReturnedItems)) + geom_bar(fill = 'lightblue') +
  labs(title = 'Bar Plot for Has Returned Items', x = 'Returned or Not', y = 'Count') +
  theme_minimal()



