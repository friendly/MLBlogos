## ggimage example
# from: https://stackoverflow.com/questions/60764518/inserting-an-image-to-a-bar-chart-in-ggplot

library(ggplot2)
library(ggimage)
library(dplyr)

set.seed(1234)

img <- list.files(system.file("extdata", package="ggimage"),
                  pattern="png", full.names=TRUE)

df = data.frame(
  group = c('a', 'b', 'c'),
  value = 1:3,
  image = sample(img, size=3, replace = TRUE)
) %>%
  mutate(value1 = .5 * value)

ggplot(df, aes(group, value)) +
  geom_col() +
  geom_image(aes(image=image, y = value1), size=.2)
