#holds library invocations and configuration functions to get R and GoogleSheets talking, and pull options from JSON files

library(rjson)
library(googlesheets4)
library(tibble)

performAuth <- function(x) {
    gs4_auth(path = paste(envar_dir, x, sep=''))
}

getDocumentID <- function(x) {
    fname <- paste(envar_dir, "vars.json", sep='')
    return(fromJSON(file = fname)[x][[1]])
}
