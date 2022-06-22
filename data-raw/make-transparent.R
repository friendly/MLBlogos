# from: https://themockup.blog/posts/2021-01-28-removing-image-backgrounds-with-magick/

library(magick)


# clean image and write to disk
clean_img_transparent <- function(img, out_path="inst/trans/", trim = FALSE){


  # some images need to be trimmed
  trim_area <- if(isTRUE(trim)){
    geometry_area(0, 0, 0, 10)
  } else {
    geometry_area(0, 0, 0, 0)
  }

  in_file <- paste0("inst/png-old/", img)
  out_file <- paste0(out_path, img)
  in_file |>
    image_read() |>
#    image_crop(geometry = trim_area) |>
    image_fill(
      color = "transparent",
      refcolor = "white",
      fuzz = 4,
      point = "+1+1"
    ) %>%
    # image_transparent(
    #   color = "white"
    # ) |>
    image_write(path = out_file, format = "png")
}


pngs <- list.files("inst/png-old/", pattern = "*.png")

# img1 <- pngs[1]
# img1_trans <- clean_img_transparent(img1)
#
# c(image_read(img1), img1_trans) |>
#   image_append() |>
#   image_ggplot()

clean_img_transparent(pngs[1])

# do them all

for (i in 1:length(pngs)) {
  clean_img_transparent(pngs[i])
}
