stock_returns <- c(72969,29268,38894,71761,90296,2663,12410,21390,12227,13701,
                   18429,48009,39811,32083,34349,55391,54329,30321,30398,42255,76642,
                   47969,60264,37080,63547)
min(stock_returns)
max(stock_returns)
x_breaks <- seq(from =0 , to = 100000, by = 10000)

stock_groups <- cut(stock_returns , breaks = x_breaks, dig.lab = 10)
print(stock_groups)
table(stock_groups)
stock_data <- data.frame(table(stock_groups)) # Absolute Frequency

stock_data$relative_Freq <- stock_data$Freq/sum(stock_data$Freq)

stock_data$cumulative_Freq <- cumsum(stock_data$relative_Freq)

# Histogram
hist(stock_returns, x_breaks)

# Ogive (Cumulative Frequency)
plot(sort(stock_returns), cumsum(stock_returns)/sum(stock_returns), xlab="Profit",
     ylab="Cumulative Frequency", main = "Ogive of Stock Returns", type="l")
