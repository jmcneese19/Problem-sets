*________________________________________________________________________________________*

**HW3:dofile
**Jazmyne McNeese 
**Fall 2019
**Version:15
**Topic: eviction data
**DUE OCT 17th

**Summary:
*I am interested in looking at the impact of new housing 
*construction on evictions, home values, and poverty.
*My research interest in this project is to explore the effect 
*of structural inequality in the housing market.
*Literature states that new homes that are being built are bigger 
*and therefore my expensive (Dwyer).
*Therefore, my theory is that renter-occupied homes are decreasing 
*in stock and provide a propensity for landlord to file for evictions 
*due to increased demand for affordable or smaller housing.
*My hypothesis is then that an increase in new and more expensive housing 
*construction will lead to an increase in eviction filings and the overall 
*eviction rate. My variables include, year housing was built, eviction filings, 
*eviction rate, poverty rate, home values, renter-occupied homes etc..I intend 
*to use a series of regressions to explain the variation in eviction filings or evictions.

**Why: learning to merge 5 times and reshape and cleaning, this time using county level data only and filling in the years 2008-20016 
*____________________________________________________________________________________________*


////////////////////////////////////////////////
/////			Stata Set Up              /////
////////////////////////////////////////////// 


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


////////////////////////////////////////////////
/////		Data Loading and Cleaning     /////
////////////////////////////////////////////// 


use "https://github.com/jmcneese19/Problem-sets/blob/master/eviction%20sub.dta?raw=true", clear 
*load eviction from git hub

drop subbed
*all zeros dont need it

drop imputed
*all zeros dont need it

drop lowflag
*there no meta data to explain what lowflag means

keep in 10/198
* Keeping the county level variables 

rename GEOID id2
*preparing for the merge

tostring id2, replace
*make id2 a string variable



////////////////////////////////////////////////
/////		PS3	merging and reshape	      /////
////////////////////////////////////////////// 


merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing08.dta?raw=true"
*merge eviction data with housing data 2008 

drop _merge


merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing09.dta?raw=true"
*merge eviction data with ousing data 2009

drop _merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing10.dta?raw=true"
*merge eviction data with housing data 2010 

drop _merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing11.dta?raw=true"
*merge eviction data with housing data 2011

drop _merge 

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing12.dta?raw=true"
*merge eviction data with housing data 2012 

drop _merge


merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing13.dta?raw=true"
*merge eviction data with housing data 2013 

drop _merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing14.dta?raw=true"
*merge eviction data with housing data 2014 

drop _merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing15.dta?raw=true"
*merge eviction data with housing data 2015 

drop _merge

merge m:1 id2 using "https://github.com/jmcneese19/Problem-sets/blob/master/housing16.dta?raw=true"
*merge eviction data with housing data 2016 

drop _merge

preserve 
*saves my data where it is so if I mess up I can come back (restore puts it back)

reshape j year 

 reshape wide pctafam, i(id3) j(year)

restore 
*go back to the original data
*______________________________________PS3 DONE_____________________________________________*





////////////////////////////////////////////////
/////		cleaning merged file	      /////
////////////////////////////////////////////// 

reshape j year 

drop in 1/1 

drop parentlocation 

drop pctrenteroccupied

drop rentburden

drop geodisplaylabel

drop hc01_vc21 
*mobile homes 

drop hc01_vc22
*boats etc 

drop hc01_vc26
*total housing years built 

drop hc01_vc40
*drop total housing units rooms

drop hc01_vc41
*drop 1 bed room

drop hc01_vc42
*drop 2 bed rooms 

drop hc01_vc43
*drop 3 bed rooms 

drop hc01_vc44
*drop 4 bed rooms

drop hc01_vc45
*drop 5 bed rooms

drop hc01_vc46
*drop 6 bed rooms

drop hc01_vc47
*drop 7 bed rooms 

drop hc01_vc48
*drop 8 bed rooms

drop hc01_vc49
*drop 9 bed rooms or more

drop hc01_vc50
* drop median rooms 

drop hc01_vc54
*total bed rooms 

drop hc01_vc74
*year moved in

drop hc01_vc75
*year moved in 

drop hc01_vc76
*year moved i 

drop hc01_vc77
*year moved in 

drop hc01_vc78
*year moved in

drop hc01_vc79
*year moved in 

drop hc01_vc80
*year moved in 

drop hc01_vc84
*vehicle

drop hc01_vc85
* vehicles 

drop hc01_vc86
* vehicles

drop hc01_vc87
*vehicles

drop hc01_vc88
*vehicles

drop hc01_vc92
*heating

drop hc01_vc93
*heating

drop hc01_vc94
*heating

drop hc01_vc95
*heating 

drop hc01_vc96
*heating

drop hc01_vc97
*heating

drop hc01_vc98
*heating

drop hc01_vc99
*heating

drop hc01_vc100
*heating

drop hc01_vc101
*heating

drop

ren id2 countyid 
la var countyid countycode

ren hc01_vc03 tothom
la var tothom "total homes"

ren hc01_vc04 totocchom
la var totocchom "total occupied homes"

ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc08 homvacrate
la var homvacrate "homeowner vacancy rate"

ren hc01_vc09 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits
la var totunits "total housing units" 

ren hc01_vc14 oneunidet
la var oneunidet "1 unit detatched" 

ren hc01_vc15 oneuniatt
la var oneuniatt "1 unit attatched"

ren hc01_vc16 twounits
la var twounits "2 units"

ren hc01_vc17 threorfouuni
la var threorfouuni "3 or 4 units" 

ren hc01_vc18 fivtoninuni
la var fivtoninuni "5 to 9 units" 

ren hc01_vc19 tentoninteeuni
la var tentoninteeuni "10 to 19 units"

ren hc01_vc20 twenormor
la var twenormor "20 or more units"

ren hc01_vc27 fourteenoraft
la var fourteenoraft "built in 2014 or after"

ren hc01_vc28 tentothirteen
la var tentothirteen "built in 2010 to 2013"

ren hc01_vc29 twothotoonine
la var twothotoonine "built 2000 to 2009"

ren hc01_vc30 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"

ren hc01_vc31 eigtoeignin
la var eigtoeignin "built 1980 to 1989"

ren hc01_vc32 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"

ren hc01_vc33 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"

ren hc01_vc34 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"

ren hc01_vc35 foutofounin
la var foutofounin "built in 1940 to 1949"

ren hc01_vc36 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc55 nobed
la var nobed "no bedrooms"

ren hc01_vc56 oneroom
la var oneroom "1 bedroom"

ren hc01_vc57 tworooms
la var tworooms "2 bedrooms" 

ren hc01_vc58 threrooms
la var threrooms "3 bedrooms"

ren hc01_vc59 fourooms
la var fourooms "4 bedrooms"

ren hc01_vc60 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc64 occhou
la var occhou "occupied housing units"

ren hc01_vc65 ownocc
la var ownocc "owner occupied housing units"

ren hc01_vc66 renocc
la var renocc "renter occupied housing units"

ren hc01_vc69 aveownocc
la var aveownocc "average household size of a owner occupied unit"

ren hc01_vc70 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"


//ren 
//la var 


//recode 



save evihoumer0816

*________________________________________________________________________________________

************************************Addtional code


/********************************************/
/* variable names,  labels, and value labels */
/********************************************/
insheet using https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.csv
d

/* there are many ways to label things... */
help label

/* let's focus on variable v4 */
d v4
sum v4
codebook v4, tab(100)
ta v4, mi
ta v4, nola mi


/* first we can rename it */
ren v4 gender

/* then let's put variable label on it */

la var gender "respondent's gender"
d

/* and now we can pu value labels [in 2 steps]*/
/* first, define value label */

la def gender 1"male"  2 "female"

la val gender gender



//----------------------------------------------------------------------------------
  
/* but wait, remember simplicity rule ? what a variable gender means? we want to have a meaningful */
/* variable, say female that would equal 1 for females and 0 for males  */

/* we will use a very handy command recode */

help recode
  
recode gender (1=0) (2=1), gen(female)

/* remember about accuracy! -- double check everything */

ta female gender, mi

/* we do not have to do this because variable female is self explanatory, but just for exercise */
la var female "female"
la def female 1 "female" 0 "male"
la val female female
codebook female, ta(100)

/* we can actually put value lables in just one step with recode */

drop female  
recode gender (1=0 "male") (2=1 "female"), gen(female)

/*********************/
/* more about labels */
/*********************/

/* we already have nicely labeled data, let's see what else we can do */   

use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear
 
d
sum
codebook, tab(100)

/* looks much better, right? */

/* but i do not like codebook command, much easier/faster is tab, but it does not show values-- i need */
/* to do it twice */ 

ta happy
ta happy, nola mi 
  
/* numlabel automatically adds numeric values to value labels , useful ! */
  
numlabel happy, add

ta happy

/* this looks great ! */

  
/*You can search labels, useful !*/  
lookfor income                
sum `r(varlist)'



/*********************/
/* labelling  using 'note' */
/*********************/
insheet using https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.csv,clear 
d
sum

help note
note: this is a subset of gss that  is unlabeled
note: get codebook from adam !
notes
note v2: this looks like age 
note v2: email gss and ask about teenagers 
notes

label data "gss subset for data mgmt class"
d


//------------------exercises---------------------- 


/* get the status variables */
lookfor status
lookfor prestige
lookfor wealth
lookfor income
lookfor education


