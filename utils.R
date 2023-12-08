#general functions for a variety of purposes in this project that don't go anywhere else yet


#given a POSIXct date and a year, month, and day, adjust the date to those values and return it
#useful in this context because times in Google Sheet are all defaulted to the same date, even though
#the schedule crosses over the day
set_ct_date <- function(ct_date, year, month, day) {
    lt_date <- as.POSIXlt(ct_date)
    lt_date$year <- (year)
    lt_date$mon <- month
    lt_date$mday <- day
    return(as.POSIXct(lt_date))
}

#given the datetime as POSIXct and the date to change it to as an 
set_ct_date_from_lt <- function(ct_date, shift_date) {
    return(set_ct_date(ct_date, shift_date$year,shift_date$mon, shift_date$mday))
}

is.POSIXct <- function(x) inherits(x, "POSIXct")

correct_dates <- function(ct_date, first_date, date_index=0){
    lt_date <- as.POSIXlt(ct_date)
    lt_date$year <-  first_date$year
    lt_date$mon <- first_date$mon
    lt_date$mday <-  first_date$mday + date_index

    return(as.POSIXct(lt_date))
}

correct_date_vector <- function(v){
    return(v %>% mutate(where(as.POSIXlt(.x)), \(.x) correct_shiftday(.x)))
}

correct_shiftday <- function(ct_date, date_index=0){
    lt_date <- as.POSIXlt(ct_date)
    if (lt_date$hour > 0 && lt_date$hour < 6) {
        print('one was found?')
        lt_date$mday <- lt_date$mday + 1
    }  
    return(as.POSIXct(lt_date))
}

#Clean this up and do it programatically later!!!
schedule_col_names <- c('Role','Name','Phone','Total Hours',
    'M1_Code', 'M1_Start', 'M1_End', 'M1_Hours',
    'T1_Code', 'T1_Start', 'T1_End', 'T1_Hours',
    'W1_Code', 'W1_Start', 'W1_End', 'W1_Hours',
    'R1_Code', 'R1_Start', 'R1_End', 'R1_Hours',
    'F1_Code', 'F1_Start', 'F1_End', 'F1_Hours',
    'S1_Code', 'S1_Start', 'S1_End', 'S1_Hours',
    'N1_Code', 'N1_Start', 'N1_End', 'N1_Hours',
    'M2_Code', 'M2_Start', 'M2_End', 'M2_Hours',
    'T2_Code', 'T2_Start', 'T2_End', 'T2_Hours',
    'W2_Code', 'W2_Start', 'W2_End', 'W2_Hours',
    'R2_Code', 'R2_Start', 'R2_End', 'R2_Hours',
    'F2_Code', 'F2_Start', 'F2_End', 'F2_Hours',
    'S2_Code', 'S2_Start', 'S2_End', 'S2_Hours',
    'N2_Code', 'N2_Start', 'N2_End', 'N2_Hours')