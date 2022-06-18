# test showing all images
library(glue)
data(Logos)

imgtags <- glue("<img src='", "inst/png/", "{Logos[,'png']}' alt='{Logos[,'teamID']}' height=80>")
