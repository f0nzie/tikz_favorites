#!/usr/bin/Rscript

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
suffix <- ""
ext <- "png"
pattern <- paste0("^", suffix, ".*", "\\.", ext, "$")

# pattern = "\\.png$"

fls <- dir(path = "src",
           pattern = pattern,
           full.names = FALSE)

cat(length(fls), "files \n")

item_content <- function(file) {
    filename <- sub("\\.png$", "", file)
    proto <- paste0(c(
        '[[items]]',
        'title = "%s"',
        'image = "../../src/%s.png"',
        'thumb = "../../src/%s.png"',
        'alt = "%s"',
        'description = "github.com/walmes/Tikz"',
        'url = "../../src/%s.tex"\n'),
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

if (!dir.exists("site/data")) {
    dir.create("site/data")
}

if (!dir.exists("site/content")) {
    dir.create("site/content")
}

if (file.exists("site/data/items.toml")) {
    invisible(file.remove("site/data/items.toml"))
}
cat("Creating/updating the `site/data/items.toml` file.\n")
invisible(sapply(fls, item_content))

cat("Run `hugo server` in the `site/` directory to see the results.\n")
cat("Run `sh _deploy` to upload site to server.\n")

#-----------------------------------------------------------------------
