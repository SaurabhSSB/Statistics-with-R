library(readxl)
df<-read_excel("C:/Users/Hp/Desktop/titanic.xlsx")

head(df,10)


str(df)

summary(df)

df[2,]
df[1:5,]
df[,6]
df[,6:8]
df[3:5,1:5]
df$gender

summary(df$survived)

sum(is.na(df))

names(which(colSums(is.na(df)) > 0))

which(is.na(df$embarked))

df[169,]

# install.packages("Hmisc") - First time only

library(Hmisc)
sum(is.na(df$age))
df$age <- impute(df$age, fun = mean)
which(is.imputed(df$age))

df <- na.omit(df)

df$survived <- as.factor(df$survived)
df$pclass <- as.factor(df$pclass)
df$gender <- as.factor(df$gender)
df$embarked <- as.factor(df$embarked)

levels(df$survived)
levels(df$gender)
levels(df$pclass)

nlevels(df$embarked)

levels(df$survived) <- c("No","Yes")

df$accident_year <- 1912

df_2 <- subset(df, embarked == "S")

summary(df_2$embarked)
nlevels(df_2$embarked)

df_2$embarked <- factor(df_2$embarked)
summary(df_2$embarked)
nlevels(df_2$embarked)

df_2 <- Filter(is.numeric, df)

by(df, df$survived, summary)
by(df, df$pclass, summary)

library(pastecs)
stat.desc(df)           

stat.desc(Filter(is.numeric, df))

table(df$survived, df$pclass)
barplot(table(df$survived, df$pclass), legend.text = TRUE) ## plot it

table(df$survived, df$gender)

xtabs(~survived+pclass+gender, data = df)
plot(xtabs(~survived+pclass+gender, data = df))

table(df$age)

aggregate(fare ~ survived, data = df,FUN = sd)
aggregate(age ~ survived, data = df,FUN = mean)
aggregate(fare ~ gender, data = df,FUN = mean)

ifelse(df$age<18,print("Minor"), print("Adult"))

df$minor <- ifelse(df$age<18,"Yes", "No")
str(df$minor)
df$minor <- as.factor(df$minor)

for (i in 1:5)
{
  print(df[i,3])
}

i = 1
while (i <= 5) {
  print(df[i,3])
  i = i + 1
}

Mode <- function(x) {
  a <- table(x)
  as.numeric(names(a)[a == max(a)])
}
Mode(df$age)

library(ggplot2)

ggplot(data = df, aes(survived,fare)) + geom_boxplot()