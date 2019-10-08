*HW2:dofile
*Jazmyne McNeese 
*Fall 2019
*Version:15
*Topic: eviction data
*Why: cleaning and adjusting the data set
*----------------------------

set more off
* make stata run everything

clear   
* good to start with a clean slate      

set matsize 800 
* sets your maximum matrix size at 800 instead of 400(the default)

cap log close
*closes the log if it was open 

set logtype text
*log your stats session in text

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working


use "https://github.com/jmcneese19/Problem-sets/blob/master/eviction%20sub.dta?raw=true", clear 
*load from git hub

drop subbed
*all zeros dont need it

drop imputed
*all zeros dont need it

drop lowflag
*there no meta data to explain what lowflag means

preserve 
*saves my data where it is so if I mess up I can come back (restore puts it back)

gen id= _n

//recode

//recode

//replace

//replace

//ollapse median           ,evictions

//collapse or bys: egen

des
* assess variables 

save, replace
