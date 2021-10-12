packages <- c("dplyr","readr","ggplot2")
lapply(packages, library, character.only = T)

# Load data
marvels <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/Marvels.csv")

glimpse(starwars)
print(colSums(is.na(starwars)))

hist(starwars$height)

plot(density(starwars$height, na.rm = T))

plot(x = starwars$height, y = starwars$mass)

barplot(table(starwars$sex[!is.na(starwars$sex)]))

pie(table(starwars$sex))

boxplot(starwars$height, data = starwars)

count_marvel <- table(marvels$years)

barplot(count_marvel, 
        main = "Number of Released marvel movies",
        xlab = "Released year",
        ylab = "Number of movies")
axis(side = 2, tck = 1, lty = 1, col = "gray")

marvel_plot <- ggplot(marvels, aes(x = years)) + geom_bar()
marvel_plot + ggtitle("Number of Released Marvel Movies") + ylab("Number of movies")

scat_plot <- starwars %>% 
    filter(mass < 500) %>%
    ggplot() +
    aes(x = height, y = mass) +
    geom_point() +
    geom_smooth()
scat_plot

hist_plot <- starwars %>%
    ggplot() + 
    aes(x = height) + 
    geom_histogram(binwidth = 20, na.rm = T) + 
    ggtitle("Number of weight in each range")
hist_plot
