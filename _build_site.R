# _build_site.R
# replaces the other R scripts that were building the Hugo site
# this script can be called from Makefile

remote <- c(
  '[[items]]',
  'title = "%s"',
  'image = "https://github.com/f0nzie/tikz_favorites/raw/master/src/%s.png"',
  'thumb = "https://github.com/f0nzie/tikz_favorites/raw/master/src/%s.png"',
  'alt = "%s"',
  'description = "https://github.com/f0nzie/tikz_favorites"',
  'url = "https://github.com/f0nzie/tikz_favorites/blob/master/src/%s.tex"\n')

# TODO: if using docs/ folder at the root 'image = "../src/%s.png"'
# if using site/public folder 'image = "../../src/%s.png"'
local <- c(
  '[[items]]',
  'title = "%s"',
  'image = "../src/%s.png"',
  'thumb = "../src/%s.png"',
  'alt = "%s"',
  'description = "github.com/f0nzie/tikz_favorites"',
  'url = "../src/%s.tex"\n')

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
  invisible(file.remove(list.files("./src", 
                                   pattern = "*\\.aux$|*\\.log$|*\\.gz$", 
                                   full.names = TRUE)))
  
  #-----------------------------------------------------------------------
  # modification of the original script. allows addition of tags as suffix
  # TODO: add AND condition for multiple tags. Example: +3d+foreach
  suffix <- ""
  ext <- "png"
  pattern <- paste0("^", suffix, ".*", "\\.", ext, "$")
  
  # pattern = "\\.png$"
  
  fls <- dir(path = "src",
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
    x <- remote
  }
  else if (site_mode == "local") {
    x <- local
  }
  
  invisible(sapply(fls, item_content, x))
  
  cat("Run `hugo server` in the `site/` directory to see the results.\n")
  # cat("Run `sh _deploy` to upload site to server.\n")  
}


main()