R < main.r --no-save
# TO DO:
*  Cleanup readme.md
*  
# DOCUMENTS
* https://gargle.r-lib.org/articles/non-interactive-auth.html
* https://cloud.google.com/docs/authentication/api-keys
* https://googlesheets4.tidyverse.org/reference/range_read.html
* https://googlesheets4.tidyverse.org/articles/read-sheets.html
* https://arbor-analytics.com/post/getting-your-data-into-r-from-google-sheets/
* https://bookdown.org/dli/rguide/working-with-data-frames.html
* https://googlesheets4.tidyverse.org/reference/range_flood.html
  * look into for sending formatting
# LIBRARIES
* googlesheets4
* gargle
* tidyverse
* hms (not currently in use, but might be useful?)
# SETTING UP NON-INTERACTIVE AUTHENTICATION
   * Google Cloud
     * Create project (if don't already have one)
     * Create a service user
     * Add/Enable Google Sheets API for that account(?)
     * Download the token for that service user (this is what you'll be authenticating with)
   * Google Sheets
     * Add the service user's e-mail to the Google Sheet
# R COMMANDS
* general
* install.packages("packagenamehere")
* googlesheets4
   *  'range_read(sheet_id, range = "TEMPLATE!A5:AR37", col_names = TRUE)'
   *  'range_read(sheet_id, sheet = "TEMPLATE", range="A5:AR37", col_names = FALSE)'
   *  'sheet_properties(ssid)'
   *  'sheet_names(ssid)'
   *  'sheet_write(df, ssid)'
      *  creates a new tab/page
   *  'sheet_id %>% sheet_append(data.frame(x=11, letters[11], sheet="df"))'
      *  needs some study, not sure about this
*  Tibbles
*  POSIXct
   *  Converting to POSIXct
      *  date = "2018-11-13 11:30:00"
      *  date = as.POSIXct(date, "%Y-%m-%d %H:%M:%S")
*  POSIXlt
   *  Can access parts with $day, $hour, etc.
   *  Extracting time only from POSIXct
      *  as_hms(time)
*  source
   *  runs an R file, giving access to functions and variables in it
   *  'source("config.R")'