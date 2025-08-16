# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#fitting svr to dataset
install.packages('e1071')
library(e1071)
regressor=svm(formula= Salary ~ .,
              data=dataset,
              type='eps-regression')

#predicting new results
y_pred=predict(regressor,data.frame(Level=6.5))

#visualising svr results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor,newdata=dataset)),
            colour = 'blue') +
  ggtitle('Truth vs Bluff (svr )') +
  xlab('Level') +
  ylab('Salary')



