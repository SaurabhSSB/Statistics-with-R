total_sales <- 485356
brand <- c("Tata Puch","Hyundai Creta","Maruti Brezza","Mahindra Scorpio",
           "Tata Nexon","Others")
sales <- c(72466,63752,59147,53068,48593,188330)
suv_data <- data.frame(brand,sales)
suv_data$rel_Freq <- suv_data$sales/total_sales
suv_data$rel_Freq_Percent <- 100*(suv_data$sales/total_sales)
suv_data$cumulative_Freq <- cumsum(suv_data$rel_Freq)
suv_data$cumulative_Freq_Percent <- 100*suv_data$cumulative_Freq
# Bar Chart







barplot(suv_data$sales~suv_data$brand, xlab = "brand" , ylab = "units sold",
        main = "Bar Plot - Top 5 SUVs in India")

# Pareto Chart

suv_2 <- suv_data[order(suv_data$sales, decreasing = TRUE),]
barplot(suv_2$sales,names.arg = suv_2$brand,main = "Pareto Plot - Top 5 SUV's in India")

# Pie chart

pie(suv_data$rel_Freq, suv_data$brand, main="Pie Chart - Top 5 SUVs in India")

colours <- c("green","yellow","red","orange")
pie(suv_data$rel_Freq_Percent,brand,main = "Pie Chart" , col=colours )

# Dot Plot

Age <- c(52,21,43,52,67,43,63,35,43,52,21,35,21,21,43,35,60,43,35)
plot(Age)
dotchart(Age, main = "Dot Plot of Age", xlab = "Age", xlim = c(20,70))

# Stem and Leaf plot

stem(Age)

