#random commands I want to remember
test_id <- getDocumentID("test_ss")

test <- gs4_formula(c('=2+1'))
sheet_write(data.frame(test), test_id, sheet = 'df')

phones[-c(1, 27, 28, 29, 30, 31)]