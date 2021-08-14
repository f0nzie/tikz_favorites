# test script
# test how to call a function from the command line

dir_exists = function(x) utils::file_test('-d', x)

get_count <- function(x) {
  suffix <- ""
  ext <- "png"
  pattern <- paste0("^", suffix, ".*", "\\.", ext, "$")
  
  root <- rprojroot::find_rstudio_root_file()  
  folder_path <- file.path(root, x)
  
  if (!dir_exists(folder_path)) return(x)
  
  fls <- dir(path = folder_path,
             pattern = pattern,
             full.names = FALSE)
  
  cat(length(fls), "files \n")  # TODO: stop if length = 0; no PNG files
}

main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  # first <- args[1]
  # the_args <- args[-1]
  # cat(first, "\n")  
  # cat(the_args, "\n")
  # cat("How many arguments? ", length(args), "\n")
  if (length(args) == 0) message("You have to supply the folder\n")
  get_count(args[1])
}
  

main()




