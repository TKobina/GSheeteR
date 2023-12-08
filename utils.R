#general functions for a variety of purposes in this project that don't go anywhere else yet


#given a POSIXct date and a year, month, and day, adjust the date to those values and return it
#useful in this context because times in Google Sheet are all defaulted to the same date, even though
#the schedule crosses over the day
set_ct_date <- function(ct_date, year, month, day) {
    lt_date <- as.POSIXlt(ct_date)
    lt_date$year <- (year - 1900)
    lt_date$mon <- month - 1
    lt_date$mday <- day
    return(as.POSIXct(lt_date))
}

TEMPLATE$'...6'[2][[1]] |> map(\(x) set_ct_date(x, 2023, 12, 7))