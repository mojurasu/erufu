use math

symbols = [
    &clarke="Ͼ"
]

# As defined in https://github.com/commonunits/draft
fn clarkes {
    seconds=(+ (* (date +%-H) 3600) (* (date +%-M) 60) (date +%-S))
    put (math:floor (/ (* $seconds 100000) 86400))
}

# Return the current time in kiloclarkes
fn time {
    put (/ (clarkes) 1000)' k'$symbols[clarke]
}
