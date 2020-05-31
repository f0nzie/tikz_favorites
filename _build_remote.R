#!/usr/bin/Rscript
# R script to build the configuration file for Hugo static website
# The output configuration file is "site/data/items.toml"
#-----------------------------------------------------------------------

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

item_content <- function(file) {
    filename <- sub("\\.png$", "", file)
    # https://github.com/f0nzie/tikz_favorites/blob/master/src/3d-cone_intersection%2B3d%2Bpgf.png
    # https://github.com/f0nzie/tikz_favorites/blob/master/src/3d-cylinder-planes%2B3d.tex
    proto <- paste0(c(
        '[[items]]',
        'title = "%s"',
        'image = "https://github.com/f0nzie/tikz_favorites/blob/master/src/%s.png"',
        'thumb = "https://github.com/f0nzie/tikz_favorites/blob/master/src/%s.png"',
        'alt = "%s"',
        'description = "https://github.com/f0nzie/tikz_favorites/"',
        'url = "https://github.com/f0nzie/tikz_favorites/blob/master/src/%s.tex"\n'),
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
invisible(sapply(fls, item_content))

cat("Run `hugo server` in the `site/` directory to see the results.\n")
cat("Run `sh _deploy` to upload site to server.\n")

#-----------------------------------------------------------------------
