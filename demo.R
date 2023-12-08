#random commands I want to remember
test_id <- getDocumentID("test_ss")

test <- gs4_formula(c('=2+1'))
sheet_write(data.frame(test), test_id, sheet = 'df')

phones[-c(1, 27, 28, 29, 30, 31)]


test <- gs4_formula(c('=1+1'))

cnames <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'col_emp_name'
cphones <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'col_emp_phone'
sd <- TEMPLATE[sdc[1],sdc[2]][[1]][[1]]

df <- data.frame()
df$phones <- unlist(TEMPLATE[,cphones][[1]])
df$names <- unlist(TEMPLATE[,cnames][[1]])


sdc <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'cell_start_date'
start_date <- TEMPLATE[sdc[1],sdc[2]][[1]][[1]]


#Iterate through shifts
n_weeks <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'sheet_weeks'

col_first_shift_start <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'col_first_shift_start'
col_first_shift_end <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'col_first_shift_end'

i_start <-fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'col_first_shift' + 
        col_first_shift_start

cols_per_shift <- fromJSON(file = 'tab_formats.json')$'schedule'[[1]]$'columns_per_shift'

i_stop <- i_start +
        n_weeks *
        7 *
        cols_per_shift

for (i in i_start:i_stop) {
    if (i%%cols_per_shift == 2 || i%%cols_per_shift == 3)   #FIGURE OUT THESE MAGIC NUMBERS????
    {
        print(i)
    }
}

tail(vector, n=length(vector) - 5)
schedule_col_names[5:length(schedule_col_names)]

TEMPLATE$'...6'[2][[1]] |> map(\(x) set_ct_date(x, 2023, 12, 7))

schedule_col_names <- rep(c(
        rep(c('M'), each=4),
        rep(c('T'), each=4),
        rep(c('W'), each=4),
        rep(c('R'), each=4),
        rep(c('F'), each=4),
        rep(c('S'), each=4),
        rep(c('N'), each=4)
    ), each=2)