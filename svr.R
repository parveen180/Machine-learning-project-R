# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#feature scaling
dataset$Level=scale(dataset$Level)
dataset$Salary=scale(dataset$Salary)


#fitting svr to dataset
install.packages('e1071')
library(e1071)
regressor=svm(formula= Salary ~ .,
              data=dataset)
#visualising svr results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg,newdata=dataset)),
            colour = 'blue') +
  ggtitle('Truth vs Bluff (svr )') +
  xlab('Level') +
  ylab('Salary')

#polynomial regression plot
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg,newdata=dataset)),
            colour = 'blue') +
  ggtitle('Truth vs Bluff (Polynomial regression)') +
  xlab('Level') +
  ylab('Salary')

