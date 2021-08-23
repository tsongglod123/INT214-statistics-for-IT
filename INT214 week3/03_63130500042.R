packages <- c("DescTools", "MASS")
lapply(packages, library, character.only = T)
help(package=packages[2])

sample1 <- c(29,49,42,43,32,38,37,41,27,27,30)
sample2 <- c(1,2,3,5,10,500)
sample3 <- c("Male","Female","Male","Female","Female")
print(table(sample3))
print(summary(factor(sample3)))

data
head(mtcars)
str(mtcars)

avg_mpg <- colMeans(mtcars)["mpg"]
print(avg_mpg)

