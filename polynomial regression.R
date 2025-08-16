dataset=read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

#linear regression

lin_reg=lm(formula = Salary ~ .,
             data=dataset)

#polynomial regression
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4
poly_reg=lm(formula = Salary ~ .,
              data=dataset)
#linear regression plot
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg,newdata=dataset)),
            colour = 'blue') +
  ggtitle('Truth vs Bluff (Linear regression)') +
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

#predicting new result linear regression
y_pred=predict(lin_reg,newdata=data.frame(Level=6.5))

#predicting new result polynomial regression
y_pred=predict(poly_reg,newdata=data.frame(Level=6.5,Level2=6.5^2,Level3=6.5^3,Level4=6.5^4))