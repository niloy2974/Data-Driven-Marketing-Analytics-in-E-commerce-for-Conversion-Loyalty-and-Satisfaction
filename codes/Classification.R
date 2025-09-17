# Load the package
install.packages('rpart')
library(rpart)
install.packages('rpart.plot')
library(rpart.plot)

# Copy the dataset
tree <- final[,numeric]

#-------------------------------------------------------------------------------#

# Regression Tree (full tree)
tree_mode_full <- rpart(AverageSatisfactionScore ~ ., data = tree,
                    control=rpart.control(minsplit = 1, minbucket = 2))

# Regression Tree (optimised tree)
library(rpart)
tree_mode <- rpart(AverageSatisfactionScore ~ ., data = tree)

# Detailed info on tree
tree_mode_full
tree_mode

# Summary on tree
summary(tree_mode_full)
summary(tree_mode)

# Plot the tree
rpart.plot(tree_mode_full, digits = 3)
rpart.plot(tree_mode, digits = 3)
