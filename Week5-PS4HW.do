//need way mor code, at very least 400 lines! put everything together from earlier as well;;;use more graphs
*________________________________________________________________________________________*

**HW4:dofile
**Jazmyne McNeese 
**Fall 2019
**Version:15
**Topic: eviction data
**DUE OCT 31st

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

**Stage: learning graphics 

**Data Sets 
// 1- Eviction Lab at princton University NJ county level data from 2008-2016
///(https://data-downloads.evictionlab.org/)

// 2- U.S. Census Bureau, American Community Survey 1-Year Estimates 
		////2008
			////2009
				////2010
					////2011
						////2012
							////2013
								////2014
									////2015
										////2016
// 3- https://www.njsp.org/ucr/uniform-crime-reports.shtml (will add crime reporting data later if needed)


//have plenty of graphs! likewise use lavishly outreg2 and/or estout

//----------------------------PROGRAM BEGINS-------------------------------------------
//----------------------------PROGRAM BEGINS-------------------------------------------
//----------------------------PROGRAM BEGINS-------------------------------------------

////////////////////////////////////////////////
/////			Stata Set Up              /////
////////////////////////////////////////////// 

set more off  											 //make stata run everything
clear   												 //good to start with a clean slate      
set matsize 800 										 //sets your maximum matrix size at 800 instead of 400(the default)
cap log close	 										 //closes the log if it was open 
set logtype text 										 //log your stats session in text
cd C:\Users\Jazmyne\Desktop\							 //putting my self in my wokring folder to run my files 
mkdir jazzdrive

////////////////////////////////////////////////
/////  organzie files 				      /////
////////////////////////////////////////////// 

cd jazzdrive

capture mkdir "`d'text"                 
capture mkdir "`d'output"                 
capture mkdir "`d'tmp"								              
capture mkdir "`d'literature"                 
capture mkdir "`d'data"
capture mkdir "`d'dofiles"									                 

////////////////////////////////////////////////
/////    Prep files for merge (2008-2016) /////
//////////////////////////////////////////////

cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\dofiles
run cleaningr1.do										//listed on github


////////////////////////////////////////////////
///// Memory Data Loading and Cleaning    /////
////////////////////////////////////////////// 

use "https://github.com/jmcneese19/Problem-sets/blob/master/eviction%20sub.dta?raw=true", clear 
														//load eviction from git hub
drop subbed												//all zeros dont need it
drop imputed											//all zeros dont need it
drop lowflag											//there no meta data to explain what lowflag means
keep in 10/198											//Keeping the county level variables 
rename GEOID id2										//preparing for the merge
tostring id2, replace									//make id2 a string variable

cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\data
save "`d'data", replace 
saveold "evicoucle", version(13) replace 				//save data as eviction, county level data cleaned 

////////////////////////////////////////////////
/////					merged files      /////
////////////////////////////////////////////// 

cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\data

merge m:1 id2 year using hou16cle.dta						//merge eviction data with housing data 2016 
append using hou15cle.dta									//merge eviction data with housing data 2015
append using hou14cle.dta									//merge eviction data with housing data 2014
append using hou13cle.dta									//merge eviction data with housing data 2013
append using hou12cle.dta									//merge eviction data with housing data 2012
append using hou11cle.dta									//merge eviction data with housing data 2011
append using hou10cle.dta									//merge eviction data with housing data 2010
append using hou09cle.dta									//merge eviction data with housing data 2009
append using hou08cle.dta									//merge eviction data with housing data 2008
														
**"https://github.com/jmcneese19/Problem-sets/blob/master/housing08.dta?raw=true"

////////////////////////////////////////////////
/////			cleaning master  file	  /////
////////////////////////////////////////////// 

ren id2 countyid 
la var countyid countycode

ren name countyname 
la var countyname countyname

drop geodisplaylabel 

drop _merge

drop tenorafter twothofiveorafter twothotoofour				//already captured in later years

cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\data
save evihoumer0816, replace

////////////////////////////////////////////////
/////	 Graphs and Charts			      /////
////////////////////////////////////////////// 

gr matrix evictionrate pct*, half
//here and elsewhere, dont use paths throught! only once at begining
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph1.png, replace						
*the percentage of the renter occupied population for all counties 
*in the state of new jersey is decreasing where as the percenatge of 
*the renter occupied population for all the counties in the state of 
*New Jersey is increasing from 2008-2016  

gr hbar evictionrate pctwhite, over (countyname)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph2.png, replace
*The mean percenateg of white people in each county in new jersey over all is around
*30% or greater, yet the eviction rates are significantly less than 10 percent. 

gr hbar evictionrate (median) pctafam, over (countyname)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph3.png, replace
*The mean percentage of black people in each county in New Jersey over all is aroung
*20% or less, yet the rates of evictions in most counties are higher than those of 
*the percenatge of evictions for whites

gr hbar evictionrate povertyrate, over (year)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph4.png, replace
*from 2208 to 2016 the rate of evictiosn does decrease while poverty increases. 
*this is promising news yet it doesnt explain the racial difference in eviction rates

//this can be made into macro and/or loop--again if sth repeats should be made into macro/loop
tabstat evictionrate povertyrate population rentburden, by(countyname)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long format
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long col(stat)
*lets explore other variables in table format		

//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
