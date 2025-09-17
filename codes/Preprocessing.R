# Load the package
library(readr)
library(dplyr)
library(tidyr)
library(corrplot)
library(ggplot2)
library(tidyverse)
install.packages('psych')
library(psych)

# Load the dataset
main <- read_csv("main.csv")
View(main)
summary(main)
str(main)

# Remove the NA values
main_clean <- main %>% drop_na()

# Sample 200 rows
main_clean <- main_clean[sample(nrow(main_clean), 200), ]

# Transformation of the rates
main_clean$EmailEngagementRate <- main_clean$EmailEngagementRate * 100
main_clean$SocialMediaEngagementRate <- main_clean$SocialMediaEngagementRate * 100
main_clean$EmailConversionRate <- main_clean$EmailConversionRate * 100
main_clean$SocialMediaConversionRate <- main_clean$SocialMediaConversionRate * 100
main_clean$SearchEngineConversionRate <- main_clean$SearchEngineConversionRate * 100

# Factorisation of the Categorical variables
main_clean$Gender <- factor(main_clean$Gender)
main_clean$IncomeLevel <- factor(main_clean$IncomeLevel)
main_clean$Country <- factor(main_clean$Country)
main_clean$City <- factor(main_clean$City)
main_clean$FavoriteCategory <- factor(main_clean$FavoriteCategory)
main_clean$SecondFavoriteCategory <- factor(main_clean$SecondFavoriteCategory)
main_clean$MobileAppUsage <- factor(main_clean$MobileAppUsage)
main_clean$RepeatCustomer <- factor(main_clean$RepeatCustomer)
main_clean$PremiumMember <- factor(main_clean$PremiumMember)
main_clean$HasReturnedItems <- factor(main_clean$HasReturnedItems)
summary(main_clean)
str(main_clean)

# Create 'TotalSpending' column
main_clean <- main_clean %>% 
  mutate(TotalSpending = TotalPurchases * AverageOrderValue)

# Copy the dataset
final <- main_clean
summary(final)

# Summarise the numeric variables
summary(final[,numeric])
desc_stat <- describe(final[,numeric])
desc_stat <- desc_stat[, !colnames(desc_stat) %in% c("trimmed", "mad", "se")]
desc_stat

# List data types
numeric <- c(
  'Age',
  'TotalPurchases',
  'AverageOrderValue',
  'CustomerLifetimeValue',
  'EmailEngagementRate',
  'SocialMediaEngagementRate',
  'CustomerServiceInteractions',
  'AverageSatisfactionScore',
  'EmailConversionRate',
  'SocialMediaConversionRate',
  'SearchEngineConversionRate',
  'TotalSpending'
)

categorical <- c(
  'Gender',
  'IncomeLevel',
  'Country',
  'City',
  'FavoriteCategory',
  'SecondFavoriteCategory',
  'MobileAppUsage',
  'RepeatCustomer',
  'PremiumMember',
  'HasReturnedItems'
)

