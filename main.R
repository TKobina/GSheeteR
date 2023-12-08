#LOAD Configuration and Environment Variables
envar_dir <- "../environment/64t/"
source("config.R")
source("utils.R")

performAuth("token.json")

schedule_id <- getDocumentID("schedule_ss")

#TEMPLATE <- range_read(schedule_id, sheet = "MASTER", range="A1:BH", col_names = TRUE)

#Read schedule
#FIX: read once, split into sections??
start_date <- range_read(schedule_id, sheet='MASTER', range="C2", col_types='D', col_names = FALSE)[1,1][[1]]
schedule <- range_read(schedule_id, sheet = 'MASTER', range="A3:BH", col_names = schedule_col_names)

#Fix times

schedule$'M1_Start' %>% map_if(x, x < 6, ~as.POSIXct(as.POSIXlt(x)$mday + 1)) %>% as_tibble()

first_date <- as.POSIXlt(start_date, format="Y/%m/%d")

test <- schedule[,5:15]
temp <- test %>% mutate(across(where(is.POSIXct), \(x) correct_dates(x, first_date)))
temp <- temp %>% mutate(across(where(is.POSIXct), \(x) correct_shiftday(x)))

temp$'T1_End'[as.POSIXlt(temp$'T1_End')$hour < 6] <- as.POSIXct(as.POSIXlt(temp$'T1_End')$day + 1)
t7 <- temp %>% mutate(across(where(is.POSIXct), \(x) as.POSIXlt(x)$hour))
