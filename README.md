# Data-Driven-Marketing-Analytics-in-E-commerce-for-Conversion-Loyalty-and-Satisfaction
This project applies marketing analytics to a synthetic e-commerce dataset to evaluate channel effectiveness, analyse premium member behaviour, and identify drivers of satisfaction. Using regression and classification models, it provides insights to optimise conversions, loyalty programmes, and engagement.
# Overview
This project explores how marketing analytics can be applied in the e-commerce industry to improve customer engagement, conversion, and satisfaction. Using a synthetic dataset containing customer demographics, purchasing behaviour, and marketing interactions, the analysis focuses on three objectives: evaluating the performance of marketing channels, examining the behaviour of premium members, and identifying key factors driving customer satisfaction.

Descriptive statistics and visualisations were used to understand data distributions and highlight outliers. Multivariate regression models assessed the impact of different marketing channels on spending, while interaction models tested the role of membership type. A regression tree classification was then applied to uncover factors influencing satisfaction levels.

The results highlight the importance of integrated marketing strategies, reveal social media as the most impactful channel for revenue, and provide evidence that loyalty programmes require refinement to better engage premium members. These insights offer practical recommendations for optimising conversions, enhancing customer retention, and improving overall business performance.
# Data Source
The project uses a synthetic e-commerce dataset [(Kaggle Dataset Link)](https://www.kaggle.com/datasets/noir1112/e-commerce-customer-engagement?resource=download) containing customer demographics, behaviour, and marketing interactions. A detailed data dictionary provides context for all variables, while feature selection identifies key metrics for analysis, including total spending as the target and conversion rates, engagement, and membership type as predictors.

**Customer Details**
1. CustomerID: Unique identifier for each customer
2. RegistrationDate: Date when the customer registered (date)
3. FavoriteCategory: Their favourite category (7 Categories)
4. SecondFavoriteCategory: Their second favourite category (7 Categories)	Qualitative-Nominal

**Customer Demography**
1. Age: Age of the customer
2. Gender: Their gender (Categories: Male, Female)
3. IncomeLevel: Income level (Low, Medium, High, Very High)
4. Country: Country of residence (7 Categories)
5. City: City of residence (7 Categories)

**Customer Interaction**
1. CustomerLifetimeValue: Estimated value based on the expected total revenue over their entire lifetime (Rating)
2. EmailEngagementRate: Percentage measured based on interaction with customer's email campaigns (Percent)
3. SocialMediaEngagementRate: Percentage measured based on interaction with customer's social media campaigns (Percent)
4. EmailConversionRate: Percentage of email interactions resulting in desired action like purchase and sign-up (Percent)
5. SocialMediaConversionRate: Percentage of social media interactions resulting in desired action like purchase and sign-up (Percent)
6. SearchEngineConversionRate: Percentage of search interactions resulting in desired action like purchase and sign-up (Percent)
7. MobileAppUsage: The frequency of time user spends interacting with the mobile app (Never, Low, Medium, High)
8. CustomerServiceInteractions: Count of interactions with support (Counts)
9. AverageSatisfactionScore: Their score based on contentment with the product and service (Rating out of 10)
10. PremiumMember: Whether they are a premium member (Yes, No)

**Customer Purchasing Behaviour**
1. TotalPurchases: Total purchases made by the customer (Counts)
2. AverageOrderValue: Average value of orders by the customer (£)
3. TotalSpending: Total value of orders placed by the customer (f)
4. RepeatCustomer: Whether they are a repeat customer (Yes, No)
5. HasReturnedltems: Whether they have returned items (Yes, No)
# Data Preprocessing
## Descriptive Statistics
![Descriptive Statistics]()

Descriptive statistics on the numerical variables provide valuable insights into central tendency, spread, and distribution, helping to identify patterns and trends. In the demographic data, the central tendency (mean=39.53, median=40) of Age indicates that most customers are adults. In purchasing behaviour, the moderate right-skewness in TotalPurchases (0.78) and TotalSpending (0.83) suggests that most customers make fewer purchases at lower amounts. This is further supported by the highly right-skewed AverageOrderValue (2.92), indicating that customers tend to prefer cheaper products, despite the potential for higher-value purchases (max=445.59).

Regarding interaction, most responses are positive, with minimal skewness (0.57) and a positive central tendency (mean=295.23). Engagement and conversion rates generally show similar centrality and spread, except for the SearchEngineConversionRate. This variable exhibits a nearly normal distribution with a high kurtosis (2.77), indicating it is more spread out than the other conversion rates, which have similar statistics in other parameters. This is also reflected in its relatively higher variation (sd=10.07). The SatisfactionScore shows a moderate spread (skew=-0.06, kurtosis=-0.76) and centrality (mean=6.86, median=6.89), indicating that customers are generally satisfied. To better understand the individual impact of conversion rates on satisfaction, further analysis must be conducted in this report.
## Outlier Analysis
![Boxplots]()

Boxplots for the numerical variables help visualise distributions and detect outliers. Among all the variables, AverageOrderValue has the lowest median (51.33) and the smallest interquartile range, while AverageSatisfactionScore has the highest median (6.89). In terms of interquartile range, Age, SocialMediaEngagementRate, AverageSatisfactionScore, and CustomerServiceInteractions show greater variability compared to other variables. Outliers are visible across several variables, including the conversion rates, CustomerLifetimeValue, and AverageOrderValue, indicating the presence of customers with unusually high values that stretch the distribution. However, as multiple outliers have already been removed during earlier cleaning stages, no further filtering was applied, even though AverageOrderValue still contains several extreme outliers.
## Distribution of Numerical Variables
![Histograms]()

Histograms help visualise the shape, spread, and distribution of numerical variables. Most variables display a moderate right-skew, except for AverageSatisfactionScore (skew=-0.06), which shows a slight normal distribution with a high peak near the upper end. This explains its relatively high mean (6.86), despite an otherwise even spread. AverageOrderValue displays a sharp peak at lower spending levels, contributing to its high kurtosis (12.27), suggesting that most customers make low-value purchases. CustomerLifetimeValue is the only variable that follows a moderately normal distribution, with values symmetrically distributed around the mean (295.23). All engagement and conversion rates show similar distribution patterns, suggesting equivalent performance across email, social media, and search engine channels. To maximise efficiency, the business should compare the investment in each channel to determine which delivers the best return.
## Relationships between Numerical Variables
![Correlation Heatmap]()

The correlation heatmap visually presents the strength and direction of relationships between variables, helping to identify associations or potential multicollinearity. The strongest correlation (0.90) is observed between CustomerLifetimeValue and TotalSpending, which can be explained by the combined effect of TotalPurchases and AverageOrderValue, as both directly influence customer value. This suggests that the company’s customer valuation is heavily dependent on both purchase frequency and spending behaviour. All conversion rates show stronger correlations with TotalSpending than with CustomerLifetimeValue, indicating that these promotional channels contribute more directly to driving immediate revenue rather than long-term customer value.

![Pairplot]()

A pair plot was also included to visually explore these underlying relationships, offering clearer insights into their interactions. Additionally, it shows the conversion rates forming a strong cluster at the lower end, in contrast to the more linear relationship between CustomerLifetimeValue and TotalSpending.
## Distribution of Categorical Variables
![Barplots]()

The bar plots represent the frequency distribution of the categorical variables, allowing comparison of group sizes. In customer demography, most groups across Gender, IncomeLevel, Country and City are evenly distributed. Among favourite product categories, customers prefer ‘Home Goods’ and ‘Electronics’ the most. In terms of interaction, most customers are basic members and frequently use the mobile app. For behavioural patterns, the majority are repeat customers with a low rate of item returns.
# Hypothesis Preparation
## Hypothesis Statement without Interaction
For a business to run effectively, there must be a balanced relationship between investment and revenue. In this report, TotalSpending serves as a direct indicator of revenue and reflects customer lifetime value. On the other hand, the conversion rates are key performance indicators that measure the effectiveness of marketing efforts in turning engagement into actual purchases. While it is expected that conversion rates have a positive impact on spending, different marketing channels may vary in their level of influence. Therefore, the following hypothesis statements are formed to examine whether conversion rates are associated with increased spending.

**H₀: None of the conversion rates significantly explain the variation in spending behaviour.**

**H₁: At least one of the conversion rates significantly explains the variation in spending behaviour.**

To find out whether we can reject the null hypothesis (H0) or not, we will run the following econometric model on a multivariate linear regression analysis:

![Econometric Model1]()
## Hypothesis Statement with Interaction
Comparing the conversion rates alone may not produce a strong model, as different demographic segments can respond differently to the same marketing channel. To understand whether the relationship identified in (1) varies across customer groups, PremiumMember is included to interact with each. Businesses often treat customers differently based on loyalty programme tiers. This makes membership type an ideal segmentation to test the model, as loyalty programmes are closely aligned with marketing strategies. Therefore, the following hypothesis statements are formed to examine whether membership level influences the effect of conversion rates on spending.

**H₀: Membership level does not influence the relationship between conversion rates and spending behaviour.**

**H₁: Membership level influences the relationship between at least one conversion rate and spending behaviour.**

To find out whether we can reject the null hypothesis (H0) or not, we will run the following second econometric model, on a multivariate linear regression analysis:

![Econometric Model2]()
# Data Analysis
## Multivariate Linear Regression Insights
![Scatterplots of Total Spending and Conversion Rates with Smoothed Line]()

Examining the trends of TotalSpending against all the conversion rates reveals a generally positive impact across the board. SocialMediaConversionRate shows the strongest upward trend, SearchEngineConversionRate displays the most consistent pattern, while EmailConversionRate demonstrates significant variation at the higher end, followed by a noticeable decline in trend. This indicates that increases in conversion rates generally boost customer spending, but the variations in their patterns suggest deeper dynamics that can be further explored through the regression model results.

![Regression Results]()

The results indicate that all conversion rates are significant in predicting TotalSpending, as the p-values for EmailConversionRate (2.56e-05), SocialMediaConversionRate (3.80e-07), and SearchEngineConversionRate (1.86e-07) are all below 0.05. Among them, SearchEngineConversionRate shows the strongest significance due to the smallest p-value, making it the best predictor.

Looking at the coefficients, we find that with other variables held constant, TotalSpending increases by £5.90 for each 1% increase in EmailConversionRate. Similarly, TotalSpending increases by £7.31 for a 1% rise in SocialMediaConversionRate and by £6.56 for a 1% increase in SearchEngineConversionRate. This shows that social media conversion rates generate the most revenue, with the 95% confidence interval [4.57,10.06] supporting its stronger impact.

In terms of model accuracy, it explains 39% (R-squared=0.39) of the variation. The Adjusted R-squared (0.38) suggests that the contribution of each variable is meaningful, as it did not decrease significantly. The spread of the residuals indicates that the model's prediction is generally strong, with a median residual of -5.16. However, the model could be improved by addressing outliers that caused the maximum errors (min=-336.76, max=443.76).

![Scatterplots of Total Spending and Social Media Conversion Rate]()

Given that social media activities are the most effective at boosting revenue, further visualizations were created to explore how they interact with different quartiles of EmailConversionRate and SearchEngineConversionRate. The increasing slope in the visualizations shows that customers converted through email and search engine are more likely to also make purchases through social media. In conclusion, the channels are not individually effective, but when combined, they contribute to higher spending.
## Multivariate Linear Regression with Interaction Insights
To analyse the interaction between membership types and the conversion rates, the initial step is to assess the significance of membership types in predicting TotalSpending.

![Regression Update with New Variable]()

The overall model accuracy improves slightly, with the R-squared increasing to 0.40 compared to the previous model. This is expected, as adding more variables typically allows the model to explain more variation. PremiumMember is statistically significant with a p-value of 0.0445, which is below the 0.05 threshold, though it is less significant than the other predictors. This is further supported by a rise in prediction errors, as the median residual shifts to -13.15.

![Regression Results with Interaction]()

The updated model, which includes interactions between the conversion rates and membership types, clearly shows that these interactions are not significant in predicting the spending behaviour of premium customers. The high p-values for EmailConversionRate: PremiumMemberYes (0.1858), SocialMediaConversionRate: PremiumMemberYes (0.1865), and SearchEngineConversionRate: PremiumMemberYes (0.7232) indicate that membership type does not meaningfully influence the relationship between conversion rates and spending. Additionally, the negative coefficients suggest that while premium customers may be making fewer purchases, they are likely opting for more expensive products.

In comparison to previous models, the p-values for the conversion rates remain largely unchanged for basic members, indicating that these variables continue to be strong predictors for this group. The increase in all coefficients further suggests that basic members spend more than the overall average for every 1% increase in conversion rates.

Overall, the model’s accuracy improves slightly, as reflected by the R-squared rising to 0.42, meaning it explains 42% of the variation in spending. However, the median residual increases to -17.09, likely due to less accurate predictions for premium customers.
## Regression Tree Classification Insights
For exploring the numerical factors acting in customer to have higher satisfaction, Regression Tree model was applied to classify them taking AverageSatisfactionScore as the target numerical variable.

![Variable Improtance and Node Splits]()

The variable importance results indicate that AverageOrderValue and TotalSpending are the strongest predictors of satisfaction, each receiving the highest importance score (17). This aligns with expectations, as customers who spend more are generally more satisfied. Regarding model accuracy, the cross-validated error (xerror=1.23) begins to rise after six splits (nsplit=6), suggesting that the model starts to overfit beyond this point.

![Regression Tree Node Details]()

A closer look at the terminal nodes (*) of the tree shows that node-82 and node-320 provide the best fits, as they have lower deviance and residual sum of squares—5.99 and 8.93 respectively. Node-320, with the lowest mean score (yval=3.94), effectively identifies the least satisfied customers. On the other hand, node-22 accounts for the largest group (n=21) with the highest deviance (yval=51.93), indicating a wider range of satisfaction within this segment. Reviewing the regression tree structure can help trace the branch paths and identify how satisfaction levels vary.

![Regression Tree Model Plot]()

While AverageOrderValue and TotalSpending were the top predictors, the tree's initial splits are based on SearchEngineConversionRate, suggesting its strong role in segmenting customer satisfaction. The group with the highest AverageSatisfactionScore had high search engine conversion and moderate purchases. Conversely, the group with the lowest satisfaction score had low conversion rates across all channels, highlighting the need to improve campaign effectiveness to enhance customer satisfaction.
# Recommendations
E-commerce businesses operate within a complex digital landscape where large volumes of data must be continuously monitored and managed. Despite this complexity, the potential rewards are substantial, as insights drawn from data can uncover clear opportunities for strategic decision-making. In this report, several important findings emerged from the customer data which can support the development of marketing strategies that directly contribute to business success.

**Conversion across marketing channels plays a vital role in driving revenue, particularly when campaigns are implemented cohesively.** Since all conversion rates were found to be significant and positively correlated, it suggests that customers tend to respond similarly across different channels. This indicates that loyal customers are likely to engage and make purchases regardless of the channel through which they are approached. The company should adopt **an omnichannel marketing approach** to ensure consistent messaging and strengthen relationships with loyal customers. Sephora’s omnichannel strategy, where customers can save their products in the "Beauty Bag" across mobile, web, and in-store, demonstrates how a seamless experience across all channels enhances customer loyalty and engagement.

**On the other hand, the similar response across channels also implies that customers who disengage from one channel may ignore others as well.** The company should investigate low-conversion customer segments to understand their preferred channels and what content resonates with them. **Personalized marketing** through a single effective medium can then be used to re-engage these customers. Amazon’s browsing-based email campaigns target non-converting visitors with personalized product suggestions, effectively re-engaging them through email based on prior interactions.

**Although conversion rates are similar across channels, social media contributes more significantly to revenue.** The company should focus on social media as a cost-effective channel, especially when facing budget limitations, and invest in **performance marketing** to reach new customers. Gymshark’s influencer-led campaigns on Instagram and TikTok, such as the “66 Days: Change Your Life” challenge, leverage the power of social platforms' algorithm-based profiling to expand reach and drive revenue with minimal budget.

**Membership type does not significantly influence the effectiveness of marketing channels, as premium members showed unpredictable behaviour.** The company should reconsider the current customer segmentation and loyalty program designs to better engage premium members. **Tailoring content and engagement strategies** more specifically for the premium segment could lead to better outcomes. ASOS’s Premier Delivery, which pairs loyalty benefits with app-exclusive offers and early access, is a good example of how to better engage premium customers with tailored strategies.

**While higher conversion rates don’t always directly lead to higher satisfaction scores, they are a clear indicator of increased satisfaction.** The company should prioritize customer retention and continuously monitor low-conversion customers, implementing **special offers and incentivized re-engagement campaigns**. Zalando’s loyalty rewards and Zircle resale program create post-purchase value and incentivize feedback, helping to encourage repeat engagement and improve customer satisfaction.
