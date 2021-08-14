# _build_site.R
# script was updated to allow customization of:
# the source directory or lcation of the TikZ files
# the out directory or location of the image files
# the website URL
# the file pattern for the images and TikZ files
# and the relative position of the source folder in respect to the folder "site"
#
# This script can be called from Makefile or the command line
#          Rscript _build_site.R remote
#          Rscript _build_site.R locals
source_dir <- "src"
output_dir <- "out"
website_url <- "https://github.com/f0nzie/tikz_favorites"
branch <- "master"
all_png <- "%s.png"
all_tex <- "%s.tex"
dir_level <- ".."    # directory level of src/ with respect to publishing folder

get_item_toml <- function(site_mode) {

  if (site_mode == "remote") {
    x <- c(
      '[[items]]',
      'title = "%s"',
      paste0('image = ', '"', paste(website_url, "raw", branch, output_dir, all_png, sep = "/"), '"'),
      paste0('thumb = ', '"', paste(website_url, "raw", branch, output_dir, all_png, sep = "/"), '"'),
      'alt = "%s"',
      paste0('description = ', '"', website_url, '"'),
      paste0('url = ', '"', paste(website_url, "blob", branch, source_dir, all_tex, sep = "/"), '"', "\n")
    )
  }
  else if (site_mode == "local") {
    # TODO: if using docs/ folder at the root 'image = "../src/%s.png"'
    # if using site/public folder 'image = "../../src/%s.png"'
    x <- c(
      '[[items]]',
      'title = "%s"',
      paste0("image = ", '"', paste(dir_level, output_dir, all_png, sep = "/"), '"'),
      paste0("thumb = ", '"', paste(dir_level, output_dir, all_png, sep = "/"), '"'),
      'alt = "%s"',
      paste0("description = ", '"', sub("^https://", '', website_url), '"'),
      paste0("url = ", '"', paste(dir_level, source_dir, all_tex, sep = "/"), '"', "\n")
    )
  }
  x
}


main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  site_mode <- args[1]
  # the_args <- args[-1]
  # message("You have to supply the parameters!\n")
  # get_count(args[1])

  # Clone the theme.
  if (!dir.exists("site/themes/hugrid")) {
    cat("Cloning the theme:\n")
    system("git clone https://github.com/aerohub/hugrid.git site/themes/hugrid")
  } else {
    cat("Theme already present.\n")
  }

  # clean up from unwanted files
  invisible(file.remove(list.files(output_dir,
                                   pattern = "*\\.aux$|*\\.log$|*\\.gz$",
                                   full.names = TRUE)))

  #-----------------------------------------------------------------------
  # modification of the original script. allows addition of tags as suffix
  # TODO: add AND condition for multiple tags. Example: +3d+foreach
  suffix <- ""
  ext <- "png"
  pattern <- paste0("^", suffix, ".*", "\\.", ext, "$")

  # pattern = "\\.png$"

  fls <- dir(path = output_dir,
             pattern = pattern,
             full.names = FALSE)

  cat(length(fls), "files \n")  # TODO: stop if length = 0; no PNG files

  item_content <- function(file, x) {
    filename <- sub("\\.png$", "", file)
    proto <- paste0(x,
      collapse = "\n")
    string <- do.call(sprintf,
                      c(list(fmt = proto),
                        replicate(n = 5,
                                  expr = filename,
                                  simplify = "list")))
    # generate config file items.toml with all items to be processed:
    # title, image, thumbnail, alt text, description and url
    # Hugo will use this file to generate web site.
    cat(string, "\n",
        file = "site/data/items.toml",
        append = TRUE)
  }

  if (!dir.exists("site/data")) {      # add folder site/data
    dir.create("site/data")
  }

  if (!dir.exists("site/content")) {   # add folder site/content
    dir.create("site/content")
  }

  if (file.exists("site/data/items.toml")) {   # remove older items.toml
    invisible(file.remove("site/data/items.toml"))
  }

  # create items.toml from PNG files detected
  cat("Creating/updating the `site/data/items.toml` file.\n")
  if (site_mode == "remote") {
    x <- get_item_toml("remote")
  }
  else if (site_mode == "local") {
    x <- get_item_toml("local")
  }
  invisible(sapply(fls, item_content, x))
  cat("Run `hugo server` in the `site/` directory to see the results.\n")
}

main()
