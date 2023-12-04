#LOAD Configuration and Environment Variables
envar_dir <- "../environment/64t/"
source("config.R")

performAuth("token.json")

sheet_id = getDocumentID("emp_scheduling")
TEMPLATE <- range_read(sheet_id, sheet = "TEMPLATE", range="A5:AR37", col_names = FALSE)
