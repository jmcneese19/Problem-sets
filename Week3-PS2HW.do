*HW2:dofile
*Jazmyne McNeese 
*Fall 2019
*Version:15
*Topic: eviction data
**I am interested in looking at the impact of new housing 
**construction on evictions, home values, and poverty.
**My research interest in this project is to explore the effect 
**of structural inequality in the housing market.
**Literature states that new homes that are being built are bigger 
**and therefore my expensive (Dwyer).
**Therefore, my theory is that renter-occupied homes are decreasing 
**in stock and provide a propensity for landlord to file for evictions 
**due to increased demand for affordable or smaller housing.
**My hypothesis is then that an increase in new and more expensive housing 
**construction will lead to an increase in eviction filings and the overall 
**eviction rate. My variables include, year housing was built, eviction filings, 
**eviction rate, poverty rate, home values, renter-occupied homes etc..I intend 
**to use a series of regressions to explain the variation in eviction filings or evictions.
*Why: learning to use recode, collapse, drop, merge and replace
*----------------------------

/*
can
use
block
comment
above like this
instead of typing in each line **
*/

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

preserve 
*saves my data where it is so if I mess up I can come back (restore puts it back)
* decided to add this because my data is organized in a way that is unhelpful 

gen state=0
replace state=1 if name=="New Jersey" 

recode population missing =0
* establishing a ture zero 

recode  renteroccupiedhouseholds missing =0
* establishing a ture zero 

replace povertyrate= -1 if povertyrate==.
**better to have all numeric values and a negative denites teh difference 

drop subbed
*all zeros dont need it

drop imputed
*all zeros dont need it

drop lowflag
*there no meta data to explain what lowflag means

keep in 1/9
collapse povertyrate, by(year)
*gives me the state wide poverty rate from 2008-2016

tab povertyrate year
* The mean state poverty rate increased from 2008-2016 6.5 - 8.2

restore
*go back to orginial data

preserve
*Try this again with a different geography 

keep in 10/198
* Keeping the county level variables 

rename GEOID id2
*preparing for the merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housingdata.dta?raw=true"
*merge evenivtion data with new houisng constrution data

collapse povertyrate, by(year)
*gives me the county wide poverty rate from 2008-2016 

tab povertyrate year
* The mean county poverty rate increased from 2008-2016 from 6.3-7.9

restore
*back to the originl state




// addtional code //
*gen countyid=substr(name,-6,.)
**last 6 places i the varibae name

