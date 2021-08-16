# ex 1
numbers <- c(10.4, 5.6, 3.1, 6.4, 21.7)
cat("avg:", mean(numbers), "\n")
cat("sum:",sum(numbers), "\n")
cat("med:",median(numbers), "\n")
cat("sd:",sd(numbers), "\n")
cat("var:",var(numbers), "\n")

# ex2
# List of Marvel movies (Order by Marvel Phase released)
marvel_movies <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(rep(2008,2),2010,rep(2011,2),2012,rep(2013:2016,each = 2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

cat("The numbers of movies:", length(marvel_movies), "\n")
cat("the 19th movies name:", marvel_movies[19], "\n")

max_freq <- 0
max_temp <- 0
for (k in years) {
    for (i in 1:length(years)) {
        if (k == years[i]) {
            max_temp <- max_temp + 1    
        }
    }
    if (max_temp > max_freq) {
        year <- k
        max_freq <- max_temp
        year_max_freq <- data.frame(year, max_freq)
        max_temp <- 0
    } else if (max_temp == max_freq) {
        year_max_freq <- rbind(year_max_freq, c(k, max_freq))   
        max_temp <- 0
    } else {
        max_temp <- 0
    }
}
year_max_freq <- unique(year_max_freq)
row.names(year_max_freq) <- c(1:length(year_max_freq$year))

print(year_max_freq)