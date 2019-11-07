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

**Stage: 2 macros , 2 loops, 1 branching or if selse, outreg2 or estout, 300-3k lines 

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
global dir "C:\Users\Jazmyne\Desktop\" 					//TODO: adjust to the lab
di "$dir"
cd $dir
cap mkdir   $dir\jazzdrive
cd  `jazzdrive'
ls `jazzdrive'

capture mkdir "text"                 
capture mkdir "output"                 
capture mkdir "tmp"								              
capture mkdir "literature"                 
capture mkdir "data"
capture mkdir "dofiles"									                 

////////////////////////////////////////////////
/////     Prep files for merge	          /////
//////////////////////////////////////////////
*Cleaning do file 
*tasked with cleaning, renaming, and relabeling housing data from 9 census years
*2008-2016

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

//-------------------------2016-------------------------------------------------
						
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing16.dta?raw=true"

ren hc01_vc03 tothom										//number of homes
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc08 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc09 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc27 fourteenoraft								//year housing was built
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

ren hc01_vc55 nobed										// number of bed rooms
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

ren hc01_vc64 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc65 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc66 renocc
la var renocc "renter occupied housing units"
ren hc01_vc69 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc70 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

drop hc01_vc1*											//addtional uneeded data
drop hc01_vc2*
drop hc01_vc4*											//addtional uneeded data
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

save hou16cle.dta, replace
clear

//----------------------------2015----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing15.dta?raw=true"
															 
ren hc01_vc03 tothom										//number of homes
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc08 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc09 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc27 fourteenoraft								//year housing was built
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

ren hc01_vc55 nobed										// number of bed rooms
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

ren hc01_vc64 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc65 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc66 renocc
la var renocc "renter occupied housing units"
ren hc01_vc69 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc70 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc08 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc09 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc27 tenorafter								//year housing was built
la var tenorafter "built in 2010 or after"
ren hc01_vc28 twothotoonine
la var twothotoonine "built 2000 to 2009"
ren hc01_vc29 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_vc30 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_vc31 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_vc32 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_vc33 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_vc34 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_vc35 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc54 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_vc55 oneroom
la var oneroom "1 bedroom"
ren hc01_vc56 tworooms
la var tworooms "2 bedrooms" 
ren hc01_vc57 threrooms
la var threrooms "3 bedrooms"
ren hc01_vc58 fourooms
la var fourooms "4 bedrooms"
ren hc01_vc59 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc63 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc64 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc65 renocc
la var renocc "renter occupied housing units"
ren hc01_vc68 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc69 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc08 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc09 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc27 tenorafter								//year housing was built
la var tenorafter "built in 2010 or after"
ren hc01_vc28 twothotoonine
la var twothotoonine "built 2000 to 2009"
ren hc01_vc29 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_vc30 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_vc31 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_vc32 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_vc33 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_vc34 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_vc35 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc54 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_vc55 oneroom
la var oneroom "1 bedroom"
ren hc01_vc56 tworooms
la var tworooms "2 bedrooms" 
ren hc01_vc57 threrooms
la var threrooms "3 bedrooms"
ren hc01_vc58 fourooms
la var fourooms "4 bedrooms"
ren hc01_vc59 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc63 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc64 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc65 renocc
la var renocc "renter occupied housing units"
ren hc01_vc68 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc69 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc07 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc08 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc26 tenorafter								//year housing was built
la var tenorafter "built in 2010 or after"
ren hc01_vc27 twothotoonine
la var twothotoonine "built 2000 to 2009"
ren hc01_vc28 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_vc29 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_vc30 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_vc31 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_vc32 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_vc33 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_vc34 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc53 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_vc54 oneroom
la var oneroom "1 bedroom"
ren hc01_vc55 tworooms
la var tworooms "2 bedrooms" 
ren hc01_vc56 threrooms
la var threrooms "3 bedrooms"
ren hc01_vc57 fourooms
la var fourooms "4 bedrooms"
ren hc01_vc58 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc62 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc63 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc64 renocc
la var renocc "renter occupied housing units"
ren hc01_vc66 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc67 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc07 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc08 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc26 tenorafter								//year housing was built
la var tenorafter "built in 2010 or after"
ren hc01_vc27 twothotoonine
la var twothotoonine "built 2000 to 2009"
ren hc01_vc28 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_vc29 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_vc30 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_vc31 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_vc32 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_vc33 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_vc34 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc53 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_vc54 oneroom
la var oneroom "1 bedroom"
ren hc01_vc55 tworooms
la var tworooms "2 bedrooms" 
ren hc01_vc56 threrooms
la var threrooms "3 bedrooms"
ren hc01_vc57 fourooms
la var fourooms "4 bedrooms"
ren hc01_vc58 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc62 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc63 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc64 renocc
la var renocc "renter occupied housing units"
ren hc01_vc66 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc67 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_vc04 totocchom
la var totocchom "total occupied homes"
ren hc01_vc05 totvachom
la var totvachom "total vacant homes"

ren hc01_vc07 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_vc08 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_vc13 totunits										//number of units
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

ren hc01_vc26 tenorafter								//year housing was built
la var tenorafter "built in 2010 or after"
ren hc01_vc27 twothotoonine
la var twothotoonine "built 2000 to 2009"
ren hc01_vc28 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_vc29 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_vc30 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_vc31 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_vc32 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_vc33 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_vc34 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_vc53 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_vc54 oneroom
la var oneroom "1 bedroom"
ren hc01_vc55 tworooms
la var tworooms "2 bedrooms" 
ren hc01_vc56 threrooms
la var threrooms "3 bedrooms"
ren hc01_vc57 fourooms
la var fourooms "4 bedrooms"
ren hc01_vc58 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_vc62 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_vc63 ownocc
la var ownocc "owner occupied housing units"
ren hc01_vc64 renocc
la var renocc "renter occupied housing units"
ren hc01_vc66 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_vc67 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
la var tothom "total homes"
ren hc01_est_vc03 totocchom
la var totocchom "total occupied homes"
ren hc01_est_vc04 totvachom
la var totvachom "total vacant homes"

ren hc01_est_vc05 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_est_vc06 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_est_vc08 totunits										//number of units
la var totunits "total housing units" 
ren hc01_est_vc09 oneunidet
la var oneunidet "1 unit detatched" 
ren hc01_est_vc10 oneuniatt
la var oneuniatt "1 unit attatched"
ren hc01_est_vc11 twounits
la var twounits "2 units"
ren hc01_est_vc12 threorfouuni
la var threorfouuni "3 or 4 units" 
ren hc01_est_vc13 fivtoninuni
la var fivtoninuni "5 to 9 units" 
ren hc01_est_vc14 tentoninteeuni
la var tentoninteeuni "10 to 19 units"
ren hc01_est_vc15 twenormor
la var twenormor "20 or more units"

ren hc01_est_vc20 twothofiveorafter								//year housing was built
la var twothofiveorafter "built in 2005 or after"
ren hc01_est_vc21 twothotoofour
la var twothotoofour "built 2000 to 2004"
ren hc01_est_vc22 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_est_vc23 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_est_vc24 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_est_vc25 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_est_vc26 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_est_vc27 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_est_vc28 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_est_vc43 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_est_vc44 oneroom
la var oneroom "1 bedroom"
ren hc01_est_vc45 tworooms
la var tworooms "2 bedrooms" 
ren hc01_est_vc46 threrooms
la var threrooms "3 bedrooms"
ren hc01_est_vc47 fourooms
la var fourooms "4 bedrooms"
ren hc01_est_vc48 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_est_vc50 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_est_vc51 ownocc
la var ownocc "owner occupied housing units"
ren hc01_est_vc52 renocc
la var renocc "renter occupied housing units"
ren hc01_est_vc53 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_est_vc54 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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

//----------------------------8----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing08.dta?raw=true"
															// unneded varibales 
ren hc01_est_vc02 tothom										//number of homes
la var tothom "total homes"
ren hc01_est_vc03 totocchom
la var totocchom "total occupied homes"
ren hc01_est_vc04 totvachom
la var totvachom "total vacant homes"

ren hc01_est_vc05 homvacrate									//vancancy
la var homvacrate "homeowner vacancy rate"
ren hc01_est_vc06 renvacrate
la var renvacrate "renter vacancy rate"

ren hc01_est_vc08 totunits										//number of units
la var totunits "total housing units" 
ren hc01_est_vc09 oneunidet
la var oneunidet "1 unit detatched" 
ren hc01_est_vc10 oneuniatt
la var oneuniatt "1 unit attatched"
ren hc01_est_vc11 twounits
la var twounits "2 units"
ren hc01_est_vc12 threorfouuni
la var threorfouuni "3 or 4 units" 
ren hc01_est_vc13 fivtoninuni
la var fivtoninuni "5 to 9 units" 
ren hc01_est_vc14 tentoninteeuni
la var tentoninteeuni "10 to 19 units"
ren hc01_est_vc15 twenormor
la var twenormor "20 or more units"

ren hc01_est_vc20 twothofiveorafter								//year housing was built
la var twothofiveorafter "built in 2005 or after"
ren hc01_est_vc21 twothotoofour
la var twothotoofour "built 2000 to 2004"
ren hc01_est_vc22 ninetytoninnin
la var ninetytoninnin "built 1990 to 1999"
ren hc01_est_vc23 eigtoeignin
la var eigtoeignin "built 1980 to 1989"
ren hc01_est_vc24 sevtosevnin
la var sevtosevnin "built in 1970 to 1979"
ren hc01_est_vc25 sixtosixnin
la var sixtosixnin "built in 1960 to 1969"
ren hc01_est_vc26 fiftofifnin
la var fiftofifnin "built in 1950 to 1959"
ren hc01_est_vc27 foutofounin
la var foutofounin "built in 1940 to 1949"
ren hc01_est_vc28 thirninorearlier
la var thirninorearlier "built in 1939 or earlier" 

ren hc01_est_vc43 nobed										// number of bed rooms
la var nobed "no bedrooms"
ren hc01_est_vc44 oneroom
la var oneroom "1 bedroom"
ren hc01_est_vc45 tworooms
la var tworooms "2 bedrooms" 
ren hc01_est_vc46 threrooms
la var threrooms "3 bedrooms"
ren hc01_est_vc47 fourooms
la var fourooms "4 bedrooms"
ren hc01_est_vc48 fivormore
la var fivormore "5 or more bedrooms" 

ren hc01_est_vc50 occhou									//housing occupancy
la var occhou "occupied housing units"
ren hc01_est_vc51 ownocc
la var ownocc "owner occupied housing units"
ren hc01_est_vc52 renocc
la var renocc "renter occupied housing units"
ren hc01_est_vc53 aveownocc
la var aveownocc "average household size of a owner occupied unit"
ren hc01_est_vc54 averenoccu
la var averenoccu "average houshold size of a renter occupied unit"

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
clear
									//listed on github

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
*all counties are in the state of new jersey 

destring, replace ignore("countyid""year""countyname""parentlocation""geoid") 
**make numeric charters numeric chartaters

cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\data
save evihoumer0816, replace
clear

////////////////////////////////////////////////
/////	 Graphs and Charts			      /////
////////////////////////////////////////////// 

use"https://github.com/jmcneese19/Problem-sets/blob/master/evihoumer0816.dta?raw=true", clear

graph set window fontface "Times New Roman"

gr matrix evictionrate pct*, half
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph1.png, replace						
*the percentage of the renter occupied population for all counties 
*in the state of new jersey is decreasing where as the percenatge of 
*the renter occupied population for all the counties in the state of 
*New Jersey is increasing from 2008-2016  

gr hbar evictionrate povertyrate, over (year)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph4.png, replace
*from 2208 to 2016 the rate of evictiosn does decrease while poverty increases. 
*this is promising news yet it doesnt explain the racial difference in eviction rates

gr hbar evictionrate pctwhite, over(countyname) name(WEVI)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph2.png, replace
*The mean percenateg of white people in each county in new jersey over all is around
*30% or greater, yet the eviction rates are significantly less than 10 percent. 

gr hbar evictionrate pctafam, over (countyname) name(BEVI)
cd C:\Users\Jazmyne\Desktop\stata\datamanagement\working\output
gr export graph3.png, replace
*The mean percentage of black people in each county in New Jersey over all is aroung
*20% or less, yet the rates of evictions in most counties are higher than those of 
*the percenatge of evictions for whites

graph combine WEVI BEVI, col(1)
*look at the tables side by side 

tabstat evictionrate povertyrate population rentburden, by(countyname)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long format
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long col(stat)
*lets explore other variables in table format	

////////////////////////////////////////////////
/////	           Analysis		       	  /////
////////////////////////////////////////////// 

des 
* list variables  

sum
*summary of the data that gives mean, min, max, SD, obs, 

mvpatterns
* tells me what teh pappern of my missing values are, seems like my county name and year varriables are the only variable snot missing need to fix geoid and county id

number of evictions, eviction fillings, and eviction rate per county over time 
*what should myvraible of interest be?

*since we know that evictionsare decreaisng but the rates are spfici to certain counties and differ by race lets run some tests and see what variables should be in my models

reg evictions medianpropertyvalue
reg evictions mediangrossrent //small
reg evictions medianhouseholdincome //small
reg evictions occhou
reg evictions ownocc
reg evictions renocc //small
reg evictions renteroccupiedhouseholds //small
reg evictions totvachom
reg evictions homvacrate
reg evictions  renvacrate
reg evictionrate povertyrate
*property values, median gross rent,household income  seems to not have a significant effect or small ones that I can ignore for this analysis 

regress evictions povertyrate
*for every one unit increase in the povert rate theres a 79.4 unit increase in evictions. Poverty and evictions are heavily correlated 

regress evictionfilings povertyrate
*for every one unit increase in poverty rate the evivtion filings will go up 1206.48 units. 

reg evictions rentburden
*for every one unit increase in rentburden there is a 89.09 unit decrease in evictions, that is to say the more some one spends their money on rent evictions go down


*from thus assessent i will be runnning mhyeffect son eveition filings and evctions as my deoendt variables 


reg evictions povertyrate 


reg evictionfilings povertyrate



//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------





*shows you the data plotted on a graph 
scatter plot (var1) (var2) (var3) (var4)

*Shows the many scatter plots 
graph matrix (var1) (var2) (var3) (var 4)

*to see underlying data
tab (var), no label

*shows addtions to the variable lables
notes

*histogram
hist [var-name]

*detailed summary 
sum [var-name], detail 

*histogram based on frequency
histogram [var-name], freq


//Evalutate the data//

*correlation
corr

*table of 4 or 5 variables 
table 

*bar graph shows the mean 
bar graph

*Shows the latest regression that was run
regress

* perfoms a t test
test

*find the predicted outcome
predict (var1)hat

*provides a line graph
line

*list variable outcomes 
list (var1) (var2)

//Organize the data//

*format the data to adjust the decimal place f=2 g=stata chooses
format

*neater way to display the data 
tab stat

*1 horizantal barto show long labels 
hbar

*Note that Stata output will appear jumbled unless you use a fixed width font, 
such as Courier New. A font size of 9 will keep the lines from breaking.


estimates store model1

// model 2

regress gpa male se malese work study

estimates store model2


//model 3

gen workse = work * se

gen studyse = study * se

regress gpa male se malese work study workse studyse

estimates store model3

// pretty table 

. esttab model1 model2 model3



/**********/
/* macros */
/**********/
  
local x 1
display `x'

local x 2+2
display `x'
display "`x'"

local x adam
di "`x'"

global x stata
di "$x"

di "`x' likes $x"


loc dir "c:\files" //TODO: adjust to the lab
cap mkdir   `dir'
cd  `dir'
ls `dir'
 
use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear

d
sum

ta marital,gen(M)
ta region, gen(R)
d
reg happy         educ M2 M3 M4 M5  R2 R3 R4
reg happy     inc educ M2 M3 M4 M5  R2 R3 R4
reg happy age inc educ M2 M3 M4 M5  R2 R3 R4

//you will probably run lots of resressions so you may as well save some typing and clicking
loc c M2 M3 M4 M5  R2 R3 R4

reg happy         educ `c'
reg happy     inc educ `c'
reg happy age inc educ `c'

//you can combine things, too [just an example, not very practical]
loc c M2 M3 M4 M5  R2 R3 R4

reg happy age inc educ `c'
loc c2 age inc educ

reg happy `c' `c2'

loc c3 `c' `c2'

reg happy `c3'


//list macros
macro l

//drop macros
macro drop
macro drop _all


/*********/
/* loops */
/*********/
//we will mostly use foreach there is a bunch of different foreach see "help foreach", essp the exampples at the end
  
foreach color in red blue green {
display "`color'"
}


sysuse auto, clear
foreach yvar in mpg price displacement {
reg `yvar' foreign weight
}


use http://www.ssc.wisc.edu/sscc/pubs/files/stata_prog/months.dta,clear
d
gen hadIncJan=(incJan>0) if incJan<.
ta hadIncJan incJan  //messy
ta  incJan hadIncJan //neat


drop hadIncJan

foreach month in Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec {
gen hadInc`month'=(inc`month'>0) if inc`month'<.
}

d
sum

sysuse auto,clear
d
foreach oldname of varlist * {
local newname=upper("`oldname'")
rename `oldname' `newname'
}
d


forvalues i=1/5 {
display `i'
}

forvalues i=1/5 {
display `i'
di " some more math"
display `i'^`i'
}

use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear

codebook marital
levelsof marital, loc(marital)
di "`marital'"


//a nested loop--nested loops are cool!
forval i=1/3 {
forval j=1/3 {
display "`i',`j'"
}
}


levelsof happy
local happy "`r(levels)'"

levelsof region, loc(region)
levelsof marital, loc(marital)
foreach m in `marital' {
       foreach r in `region' {
              sum inc if marital == `m' & region == "`r'"
       }
}


levelsof region, loc(region)
levelsof marital, loc(marital)
foreach m in `marital' {
       foreach r in `region' {
             di "************************************"
             di "this is marital `m'  and region `r'"  
             sum inc if marital == `m' & region == "`r'"
       }
}
  

levelsof region, loc(region)
levelsof marital, loc(marital)  
foreach lev in `marital'{
reg happy inc if marital==`lev'
}

*//that looked nice but we do not know which regression is which...; we use extended macro, more  about them later
levelsof region, loc(region)
levelsof marital, loc(marital)
foreach lev in `marital'{
di "*************************************"
di "***this is `:label marital `lev''***"
reg happy inc if marital==`lev'
}


use http://www.ssc.wisc.edu/sscc/pubs/files/stata_prog/monthyear.dta
d
forval year=1990/2010 {
foreach month in Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec {
gen hadInc`month'`year'=(inc`month'`year'>0) if inc`month'`year'<.
}
}
d


use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear
codebook marital
levelsof marital, loc(m)
di "`m'"
ls
foreach lev in `m'{
  preserve
  keep if marital==`lev'
save mar`lev',  replace
  restore
}
ls mar*


//a useful trick to grab the contents of directory...
local datafiles1: dir . files "*.dta"
local datafiles2: dir . files "mar*.dta"
di `"`datafiles1'"'
di `"`datafiles2'"'

clear all
foreach file of local datafiles2 {
count
append  using `file'
}

d
sum
count

//note that above we use compound double quotes because  file names are already in quotes (to allow blanks)
display "Hamlet said "To be, or not to be.""

/* The solution is what Stata calls compound double quotes. When Stata sees `" (left single quote followed by a double quote) it treats what follows as a string until it sees "' (double quote followed by a right single quote). Thus: */

display `" Hamlet said "To be, or not to be." "'


//can also fromat macro...
sysuse auto,clear
reg mpg weight   //run a reg
local r2: display %5.4f e(r2)  //pull out useful info and format it
twoway (lfitci mpg weight) (scatter mpg weight), note(R-squared=`r2')  //stick it into a graph


// a very useful command ds
sysuse auto,clear
ds, not(type string) 
sum `r(varlist)'
         
/*************/
/* branching */
/*************/
/*
         if year==1960 {
           code for handling observations from 1960
         }
         else {
           code for handling observations from other years
         }
         
*/

use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear
d         
sum

confirm numeric variable happy
confirm numeric variable region
help confirm  //like assert, useful...

         foreach var of varlist *{
           capture confirm numeric variable `var'
           if _rc==0 {
             sum `var', meanonly
             replace `var'=`var'-r(mean)
           } 
           else display as error "`var' is not a numeric variable and cannot be demeaned."
         }
sum

/**************************/
/* more examples          */
/**************************/
use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear
       
forvalues m = 1/5 {
       qui sum inc if  marital == `m' &  sex== 1
       di "mean male income for marital status `m' is: " r(mean)
}

forvalues m = 1/5 {
       qui sum inc if  marital == `m' &  sex== 1
       di "mean male income for `:label marital `m'' is: " r(mean)
}
         
        
local i 1
while `i'<=5 {
display `i++'
}

local i=1
while `i'<=5 {
       display "loop number " `i'
       local i=`i'+1
}

//local ++i /* same result as local i=`i'+1 */         
         
forval i=1/5 {
display `i'
}

//use or not use equal sign with macros; usualy don't you can have then 67k of characters in macro,
if you use only 80 , but you need to have equal sign if you do an operations

loc i 10
loc j 10 +`i'
di "`j'"

loc i 10
loc j = 10 +`i'
di "`j'"

// can also have scalars... and matrices -- more later         
scalar root2=sqrt(2)
display root2

//using results of stata commands
http://www.stata.com/support/faqs/stat/mi_combine.html
http://www.ats.ucla.edu/stat/stata/faq/returned_results.htm         

ta mar happy
help tabulate twoway

ta mar happy
return list         

reg happy inc
ereturn list

reg happy age inc
mat l e(b)        
loc age=_b[age]
di `age'        


/this is a way to be productive with code
//easy to adjust for a project
d p* mp* h* d*
foreach v of varlist p* mp* h* d*{
hist `v', percent saving (`v'.gph,replace) by(foreign)
}

local df: dir . files "*.gph"
graph combine `df'


import excel "https://docs.google.com/uc?id=1QfvuTHE1kzyF4ju39jq0oxlO6NFhVB-V&export=download", clear 
d
ta B

//say you just need name for merging
foreach c in "Atlantic" "Bergen" "Burlington" "Camden" "Cape May" "Cumberland" "Essex" "Gloucester" "Hudson" "Hunterdon" "Mercer" "Middlesex" "Monmouth" "Morris" "Ocean" "Passaic" "Salem" "Somerset" "Sussex" "Union" "Warren" {
replace B = "`c'"  if B == "`c' County, NJ"
} 

ta B
