# Load Packages
install.packages('gridExtra')
library(gridExtra)
install.packages('emmeans')
library(emmeans)

# Copy the dataset
regint.data <- final

#-------------------------------------------------------------------------------#

# Standardize the numeric factors
regint.std <- regint.data[, numeric]
regint.std[, numeric] <- scale(regint.std[, numeric])

allint.reg <- lm(TotalSpending~EmailConversionRate + 
                SocialMediaConversionRate + 
                SearchEngineConversionRate, data = regint.std)
summary(allint.reg)

#-------------------------------------------------------------------------------#

# Model the regression line with all (without standardization)
all.reg <- lm(TotalSpending~EmailConversionRate + 
                SocialMediaConversionRate + 
                SearchEngineConversionRate, data = reg.data)
summary(all.reg)

# Model the regression line with all (without standardization) with interaction PremiumMember
allint.reg <- lm(TotalSpending~EmailConversionRate + 
                SocialMediaConversionRate + 
                SearchEngineConversionRate +
                PremiumMember, data = reg.data)
summary(allint.reg)

# Interaction with EmailConversionRate
allint1.reg <- lm(TotalSpending~EmailConversionRate + 
                   SocialMediaConversionRate + 
                   SearchEngineConversionRate +
                   PremiumMember + 
                    EmailConversionRate:PremiumMember, data = reg.data)
summary(allint1.reg)

# Interaction with SocialMediaConversionRate
allint2.reg <- lm(TotalSpending~EmailConversionRate + 
                    SocialMediaConversionRate + 
                    SearchEngineConversionRate +
                    PremiumMember +
                    SocialMediaConversionRate:PremiumMember, data = reg.data)
summary(allint2.reg)

# Interaction with SearchEngineConversionRate
allint3.reg <- lm(TotalSpending~EmailConversionRate + 
                    SocialMediaConversionRate + 
                    SearchEngineConversionRate +
                    PremiumMember +
                    SearchEngineConversionRate:PremiumMember, data = reg.data)
summary(allint3.reg)

#-------------------------------------------------------------------------------#

# Interaction with All
allintf.reg <- lm(TotalSpending~EmailConversionRate + 
                    SocialMediaConversionRate + 
                    SearchEngineConversionRate +
                    PremiumMember +
                    EmailConversionRate:PremiumMember +
                    SocialMediaConversionRate:PremiumMember +
                    SearchEngineConversionRate:PremiumMember, data = reg.data)
summary(allintf.reg)
