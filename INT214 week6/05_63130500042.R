packages <- c("dplyr","readr","assertive","stringr")
lapply(packages, library, character.only = T)

products_original <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/products_original.csv")

View(products_original)
glimpse(products_original)

products_original <- products_original %>%
    distinct() %>%
    dplyr::rename(type = gender) %>%
    mutate(type = as.factor(type)) %>%
    mutate(price = str_remove(price, "THB")) %>%
    mutate(price = str_trim(price)) %>%
    mutate(price = str_remove(price, ",")) %>%
    mutate(price = as.numeric(price)) %>%
    arrange(id)
glimpse(products_original)

std_room <- data.frame(
    name = c("Antony","Baifern","Caty","Daniel","Julia","Susan","Tom"),
    mid_score = c(29, 26, 15, 19, 22, 50, NA),
    final_score = c(NA, 15, 26, 19, 20, 18, 20)
)
glimpse(std_room)

absent <- std_room %>%
    filter(is.na(final_score) | is.na(mid_score)) %>%
    select(name)
glimpse(absent)

count_absent <- std_room %>%
    filter(is.na(final_score) | is.na(mid_score)) %>%
    count()
count_absent <- as.numeric(count_absent)
glimpse(count_absent)

no_absent <- std_room %>%
    na.omit()
glimpse(no_absent)

max_mid_score <- std_room %>%
    filter(mid_score == max(mid_score, na.rm = T)) %>%
    select(-final_score)
glimpse(max_mid_score)

# incomplete
max_total_score <- std_room %>%
    mutate(mid_score = coalesce(mid_score, 0)) %>%
    mutate(final_score = coalesce(final_score, 0)) %>%
    rowwise() %>%
    mutate(total_score = sum(c(mid_score, final_score))) %>%
    select(-mid_score, -final_score)
    
