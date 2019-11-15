pwcorr eviction*
gr matrix eviction*, half //super interesting bunch of outliers!
//and then to do a loop simply 

foreach dv of varlist eviction*{
reg `dv' pctwhite 
est store `dv'_r 
reg `dv' pctwhite povertyrate 
est store `dv'_po 
reg `dv' pctwhite povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}

est tab evictions_*, b(%9.2f) star
