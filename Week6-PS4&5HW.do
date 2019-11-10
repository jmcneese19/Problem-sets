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

**Stage: 1 macros , 1 loops, 1 branching or if selse, 300-3k lines, t test ,
// heterskdacity, cross tabs, loc misery (group variables `misery'[instead of vairable names] 
//grec graph code

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
////////////////////////////////////////////////
/////  organzie files 				      /////
////////////////////////////////////////////// 
cd C:\Users\Jazmyne\Desktop\
cap mkdir   jazzdrive

global dir "C:\Users\Jazmyne\Desktop\jazzdrive" 					//TODO: adjust to the lab
di "$dir"
cd $dir

capture mkdir $dir\text                 
capture mkdir $dir\output                 
capture mkdir $dir\tmp								              
capture mkdir $dir\literature                 
capture mkdir $dir\data
capture mkdir $dir\dofiles	

cd  $dir
ls `jazzdrive' 
////////////////////////////////////////////////
/////     Prep files for merge	          /////
//////////////////////////////////////////////
*Cleaning do file 
*tasked with cleaning, renaming, and relabeling housing data from 9 census years
*2008-2016

cd $dir\data									 //putting my self in my wokring folder to run my files 
//-------------------------2016-------------------------------------------------			
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing16.dta?raw=true"

ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									//vancancy
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										//number of units
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni 
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 fourteenoraft								//year housing was built
ren hc01_vc28 tentothirteen
ren hc01_vc29 twothotoonine
ren hc01_vc30 ninetytoninnin
ren hc01_vc31 eigtoeignin
ren hc01_vc32 sevtosevnin
ren hc01_vc33 sixtosixnin
ren hc01_vc34 fiftofifnin
ren hc01_vc35 foutofounin
ren hc01_vc36 thirninorearlier

ren hc01_vc55 nobed										// number of bed rooms
ren hc01_vc56 oneroom
ren hc01_vc57 tworooms 
ren hc01_vc58 threrooms
ren hc01_vc59 fourooms
ren hc01_vc60 fivormore

ren hc01_vc64 occhou									//housing occupancy
ren hc01_vc65 ownocc
ren hc01_vc66 renocc
ren hc01_vc69 aveownocc
ren hc01_vc70 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc4*											//addtional uneeded data
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou16cle.dta, replace
clear
//----------------------------2015----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing15.dta?raw=true"
															 
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									//vancancy
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										//number of units 
ren hc01_vc14 oneunidet
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 fourteenoraft								//year housing was built
ren hc01_vc28 tentothirteen
ren hc01_vc29 twothotoonine
ren hc01_vc30 ninetytoninnin
ren hc01_vc31 eigtoeignin
ren hc01_vc32 sevtosevnin
ren hc01_vc33 sixtosixnin
ren hc01_vc34 fiftofifnin
ren hc01_vc35 foutofounin
ren hc01_vc36 thirninorearlier 

ren hc01_vc55 nobed										// number of bed rooms
ren hc01_vc56 oneroom
ren hc01_vc57 tworooms 
ren hc01_vc58 threrooms
ren hc01_vc59 fourooms
ren hc01_vc60 fivormore 

ren hc01_vc64 occhou									//housing occupancy
ren hc01_vc65 ownocc
ren hc01_vc66 renocc
ren hc01_vc69 aveownocc
ren hc01_vc70 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc4*											//addtional uneeded data
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou15cle.dta, replace
clear
//----------------------------2014----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing14.dta?raw=true"
															 
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									//vancancy
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										//number of units
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 tenorafter								//year housing was built
ren hc01_vc28 twothotoonine
ren hc01_vc29 ninetytoninnin
ren hc01_vc30 eigtoeignin
ren hc01_vc31 sevtosevnin
ren hc01_vc32 sixtosixnin
ren hc01_vc33 fiftofifnin
ren hc01_vc34 foutofounin
ren hc01_vc35 thirninorearlier 

ren hc01_vc54 nobed										// number of bed rooms
ren hc01_vc55 oneroom
ren hc01_vc56 tworooms 
ren hc01_vc57 threrooms
ren hc01_vc58 fourooms
ren hc01_vc59 fivormore 

ren hc01_vc63 occhou									//housing occupancy
ren hc01_vc64 ownocc
ren hc01_vc65 renocc
ren hc01_vc68 aveownocc
ren hc01_vc69 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou14cle.dta, replace
clear
//----------------------------2013----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing13.dta?raw=true"
															 
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									//vancancy
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										//number of units
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 tenorafter								//year housing was built
ren hc01_vc28 twothotoonine
ren hc01_vc29 ninetytoninnin
ren hc01_vc30 eigtoeignin
ren hc01_vc31 sevtosevnin
ren hc01_vc32 sixtosixnin
ren hc01_vc33 fiftofifnin
ren hc01_vc34 foutofounin
ren hc01_vc35 thirninorearlier 

ren hc01_vc54 nobed										// number of bed rooms
ren hc01_vc55 oneroom
ren hc01_vc56 tworooms
ren hc01_vc57 threrooms
ren hc01_vc58 fourooms
ren hc01_vc59 fivormore 

ren hc01_vc63 occhou									//housing occupancy
ren hc01_vc64 ownocc
ren hc01_vc65 renocc
ren hc01_vc68 aveownocc
ren hc01_vc69 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou13cle.dta, replace
clear
//----------------------------2012----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing12.dta?raw=true"
															  
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									//vancancy
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										//number of units 
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								//year housing was built
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier 

ren hc01_vc53 nobed										// number of bed rooms
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms 
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore

ren hc01_vc62 occhou									//housing occupancy
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*											//addtional uneeded data
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou12cle.dta, replace
clear
//----------------------------2011----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing11.dta?raw=true"
															// unneded varibales  
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									//vancancy
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										//number of units 
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni 
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								//year housing was built
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier 

ren hc01_vc53 nobed										// number of bed rooms
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore 

ren hc01_vc62 occhou									//housing occupancy
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou11cle.dta, replace
clear
//----------------------------2010----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing10.dta?raw=true"
															// unneded varibales  
ren hc01_vc03 tothom										//number of homes
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									//vancancy
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										//number of units 
ren hc01_vc14 oneunidet
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								//year housing was built
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier

ren hc01_vc53 nobed										// number of bed rooms
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms 
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore

ren hc01_vc62 occhou									//housing occupancy
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou10cle.dta, replace
clear
//----------------------------2009----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing09.dta?raw=true"
															// unneded varibales 
ren hc01_est_vc02 tothom										//number of homes
ren hc01_est_vc03 totocchom
ren hc01_est_vc04 totvachom

ren hc01_est_vc05 homvacrate									//vancancy
ren hc01_est_vc06 renvacrate

ren hc01_est_vc08 totunits										//number of units 
ren hc01_est_vc09 oneunidet
ren hc01_est_vc10 oneuniatt
ren hc01_est_vc11 twounits
ren hc01_est_vc12 threorfouuni
ren hc01_est_vc13 fivtoninuni 
ren hc01_est_vc14 tentoninteeuni
ren hc01_est_vc15 twenormor

ren hc01_est_vc20 twothofiveorafter								//year housing was built
ren hc01_est_vc21 twothotoofour
ren hc01_est_vc22 ninetytoninnin
ren hc01_est_vc23 eigtoeignin
ren hc01_est_vc24 sevtosevnin
ren hc01_est_vc25 sixtosixnin
ren hc01_est_vc26 fiftofifnin
ren hc01_est_vc27 foutofounin
ren hc01_est_vc28 thirninorearlier

ren hc01_est_vc43 nobed										// number of bed rooms
ren hc01_est_vc44 oneroom
ren hc01_est_vc45 tworooms
ren hc01_est_vc46 threrooms
ren hc01_est_vc47 fourooms
ren hc01_est_vc48 fivormore

ren hc01_est_vc50 occhou									//housing occupancy
ren hc01_est_vc51 ownocc
ren hc01_est_vc52 renocc
ren hc01_est_vc53 aveownocc
ren hc01_est_vc54 averenoccu

drop hc01_est_vc1*											//addtional uneeded data
drop hc01_est_vc3*
drop hc01_est_vc4*
drop hc01_est_vc5*
drop hc01_est_vc6*
drop hc01_est_vc7*
drop hc01_est_vc8*
drop hc01_est_vc9*

des
save hou09cle.dta, replace
clear
//----------------------------2008----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing08.dta?raw=true"
															// unneded varibales 
ren hc01_est_vc02 tothom										//number of homes
ren hc01_est_vc03 totocchom
ren hc01_est_vc04 totvachom

ren hc01_est_vc05 homvacrate									//vancancy
ren hc01_est_vc06 renvacrate

ren hc01_est_vc08 totunits										//number of units 
ren hc01_est_vc09 oneunidet
ren hc01_est_vc10 oneuniatt
ren hc01_est_vc11 twounits
ren hc01_est_vc12 threorfouuni 
ren hc01_est_vc13 fivtoninuni 
ren hc01_est_vc14 tentoninteeuni
ren hc01_est_vc15 twenormor

ren hc01_est_vc20 twothofiveorafter								//year housing was built
ren hc01_est_vc21 twothotoofour
ren hc01_est_vc22 ninetytoninnin
ren hc01_est_vc23 eigtoeignin
ren hc01_est_vc24 sevtosevnin
ren hc01_est_vc25 sixtosixnin
ren hc01_est_vc26 fiftofifnin
ren hc01_est_vc27 foutofounin
ren hc01_est_vc28 thirninorearlier 

ren hc01_est_vc43 nobed										// number of bed rooms
ren hc01_est_vc44 oneroom
ren hc01_est_vc45 tworooms 
ren hc01_est_vc46 threrooms
ren hc01_est_vc47 fourooms
ren hc01_est_vc48 fivormore 

ren hc01_est_vc50 occhou									//housing occupancy
ren hc01_est_vc51 ownocc
ren hc01_est_vc52 renocc
ren hc01_est_vc53 aveownocc
ren hc01_est_vc54 averenoccu

drop hc01_est_vc1*											//addtional uneeded data
drop hc01_est_vc3*
drop hc01_est_vc4*
drop hc01_est_vc5*
drop hc01_est_vc6*
drop hc01_est_vc7*
drop hc01_est_vc8*
drop hc01_est_vc9*

des
save hou08cle.dta, replace
clear															//listed on github
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

saveold "evicoucle", version(13) replace 				//save data as eviction, county level data cleaned 
clear
////////////////////////////////////////////////
/////					merged files      /////
////////////////////////////////////////////// 
cd $dir\data							

use "hou16cle.dta"
append using hou15cle.dta									//merge eviction data with housing data 2015
append using hou14cle.dta									//merge eviction data with housing data 2014
append using hou13cle.dta									//merge eviction data with housing data 2013
append using hou12cle.dta									//merge eviction data with housing data 2012
append using hou11cle.dta									//merge eviction data with housing data 2011
append using hou10cle.dta									//merge eviction data with housing data 2010
append using hou09cle.dta									//merge eviction data with housing data 2009
append using hou08cle.dta

merge m:1 id2 year using evicoucle							//merge eviction data with housing data 2008	

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
drop parentlocation  

la var tothom "total homes"
la var totocchom "total occupied homes"
la var totvachom "total vacant homes"

la var homvacrate "homeowner vacancy rate"
la var renvacrate "renter vacancy rate"

la var totunits "total housing units" 
la var oneunidet "1 unit detatched"
la var oneuniatt "1 unit attatched"
la var twounits "2 units"
la var threorfouuni "3 or 4 units" 
la var fivtoninuni "5 to 9 units"
la var tentoninteeuni "10 to 19 units"
la var twenormor "20 or more units"

la var fourteenoraft "built in 2014 or after"
la var tentothirteen "built in 2010 to 2013"
la var twothotoonine "built 2000 to 2009"
la var ninetytoninnin "built 1990 to 1999"
la var eigtoeignin "built 1980 to 1989"
la var sevtosevnin "built in 1970 to 1979"
la var sixtosixnin "built in 1960 to 1969"
la var fiftofifnin "built in 1950 to 1959"
la var foutofounin "built in 1940 to 1949"
la var thirninorearlier "built in 1939 or earlier" 

la var nobed "no bedrooms"
la var oneroom "1 bedroom"
la var tworooms "2 bedrooms"
la var threrooms "3 bedrooms"
la var fourooms "4 bedrooms"
la var fivormore "5 or more bedrooms" 

la var occhou "occupied housing units"
la var ownocc "owner occupied housing units"
la var renocc "renter occupied housing units"
la var aveownocc "average household size of a owner occupied unit"
la var averenoccu "average houshold size of a renter occupied unit"

destring, replace ignore("countyid""year""countyname""parentlocation""geoid") 
**make numeric charters numeric chartaters

save evihoumer0816, replace
clear
////////////////////////////////////////////////
/////	 Graphs and Charts			      /////
////////////////////////////////////////////// 
cd $dir\output

use"https://github.com/jmcneese19/Problem-sets/blob/master/evihoumer0816.dta?raw=true", clear

graph set window fontface "Times New Roman"

//line year tothom, by:(countyname)
gr hbar totuni evictions, over (countyname)
gr hbar year evictionfilings, over (countyname)
gr hbar year evictionrate, over (countyname)	
*these graphs allow me to assess the best dependt variable to use 

gr matrix evictionrate pct*, half
gr export graph1.png, replace						
*the percentage of the renter occupied population for all counties 
*in the state of new jersey is decreasing where as the percenatge of 
*the renter occupied population for all the counties in the state of 
*New Jersey is increasing from 2008-2016  

gr hbar evictionrate povertyrate, over (year)
gr export graph4.png, replace
*from 2208 to 2016 the rate of evictiosn does decrease while poverty increases. 
*this is promising news yet it doesnt explain the racial difference in eviction rates

gr hbar evictionrate pctwhite, over(countyname) name(WEVI)
gr export graph2.png, replace
*The mean percenateg of white people in each county in new jersey over all is around
*30% or greater, yet the eviction rates are significantly less than 10 percent. 

gr hbar evictionrate pctafam, over (countyname) name(BEVI)
gr export graph3.png, replace
*The mean percentage of black people in each county in New Jersey over all is aroung
*20% or less, yet the rates of evictions in most counties are higher than those of 
*the percenatge of evictions for whites

graph combine WEVI BEVI, col(1)
gr export graph4.png, replace
*look at the tables side by side 

scatter year evictions 
scatter year evictionfilings
scatter year evictionrate

plot povertyrate evictions
//NEED HELP
local `misfortune' evictionrate povertyrate population rentburden
di `misfortune'
tabstat `misfortune', by(countyname)
tabstat `misfortune', by(countyname) stat(mean sd min max)
tabstat `misfortune', by(countyname) stat(mean sd min max) nototal long format
tabstat `misfortune', by(countyname) stat(mean sd min max) nototal long col(stat)
*lets explore other variables in table format
////////////////////////////////////////////////
/////	           Analysis		       	  /////
////////////////////////////////////////////// 
des 												//list variables  
sum													//summary of the data that gives mean, min, max, SD, obs, 
mvpatterns											//tells me what teh pappern of my missing values are, seems like my county name 
													///and year varriables are the only variable snot missing need to fix geoid and county id

*since we know that evictionsare decreaisng but the rates are specific to certain counties and differ by race lets run some tests and see what variables should be in my models
reg evictions medianpropertyvalue
outreg
reg evictions mediangrossrent //small
outreg using evihoumer0816, merge
reg evictions medianhouseholdincome //small
outreg using evihoumer0816, merge
reg evictions occhou
outreg using evihoumer0816, merge
reg evictions ownocc
outreg using evihoumer0816, merge
reg evictions renocc //small
outreg using evihoumer0816, merge
reg evictions renteroccupiedhouseholds //small
outreg using evihoumer0816, merge
reg evictions totvachom
outreg using evihoumer0816, merge
reg evictions homvacrate
outreg using evihoumer0816, merge
reg evictions  renvacrate
outreg using evihoumer0816, merge
reg evictionrate povertyrate
outreg using evihoumer0816, merge
*property values, median gross rent,household income  seems to not have a significant effect or small ones that I can ignore for this analysis 

regress evictions povertyrate
*for every one unit increase in the povert rate theres a 79.4 unit increase in evictions. Poverty and evictions are heavily correlated 
regress evictionfilings povertyrate
*for every one unit increase in poverty rate the evivtion filings will go up 1206.48 units. 
reg evictions rentburden
*for every one unit increase in rentburden there is a 89.09 unit decrease in evictions, that is to say the more some one spends their money on rent evictions go down


*from this assessent I will be runnning my effects on eveition filings and evctions as my deoendt variables 
outreg2 using evihoumer0816, replace sum(log) keep(povertyrate evictionfilings evictions rentburden)
outreg2 using evihoumer0816, replace sum(log) keep(pctwhite pctafam pcthispanic pctamind pctasian pctnhpi pctmultiple pctother)


reg evictionfilings 										//lets assess the effect of the most significant variables (evicitonfillings)
estimates store filings 
reg evictionfilings pctwhite 
est store race 
reg evictionfilings pctwhite povertyrate 
est store poverty 
reg evictionfilings pctwhite povertyrate  medianpropertyvalue
est store propertyvalue
reg evictionfilings pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store income
esttab filings race poverty propertyvalue income, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictions 												//lets assess the effect of the most significant variables (evicitons)
estimates store evictions 
reg evictions pctwhite 
est store race 
reg evictions pctwhite povertyrate 
est store poverty 
reg evictions pctwhite povertyrate  medianpropertyvalue
est store propertyvalue
reg evictions pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store income
esttab evictions race poverty propertyvalue income, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictionfilings 										//lets assess the effect of the most significant variables (evicitonfillings)
estimates store filings 
reg evictionfilings pctwhite 
est store race 
reg evictionfilings pctwhite povertyrate 
est store poverty 
reg evictionfilings pctwhite povertyrate  medianpropertyvalue
est store propertyvalue
reg evictionfilings pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store income
esttab filings race poverty propertyvalue income, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictions 												//lets assess the effect of the most significant variables (evicitons)
estimates store evictions 
reg evictions pctwhite 
est store race 
reg evictions pctwhite povertyrate 
est store poverty 
reg evictions pctwhite povertyrate  medianpropertyvalue
est store propertyvalue
reg evictions pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store income
esttab evictions race poverty propertyvalue income, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")




////////////////////////////////////////////////
/////	        Macros and Loops    	  /////
//////////////////////////////////////////////


foreach var of varlist * {
di "the `var' is laballed as `:var lab `var' ' "
}

d
sum

levelsof evictions, loc(_evictions)
levelsof year, loc(_year)
//NEED HELP
foreach  in `_evictions'{
  foreach year in `_year'{
    qui sum price if evictions ==`evictions' & year == `year'
    di "the mean for`:var lab evictions'`: label evictions `evictions'' and `:var lab year' `: label origin `year'' is `r(mean)'"
  }
}

//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
