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

//----------------------------2016----------------------------------------------
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

tabstat evictionrate povertyrate population rentburden, by(countyname)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max)
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long format
tabstat evictionrate povertyrate population rentburden, by(countyname) stat(mean sd min max) nototal long col(stat)
*lets explore other variables in table format		



regress evictions povertyrate

*for every one unit increase in the povert rate theres a 79.4 unit increase in evictions. Poverty and evictions are heavily correlated 


regress evictionfilings povertyrate
*for every one unit increase in poverty rate the evivtion filings will go up 1206.48 units. 

reg evictions rentburden
*for every one unit increase, see replace


outreg2 using evihoumer0816, replace sum(log) keep(povertyrate evictionfilings evictions rentburden
outreg2 using evihoumer0816, replace sum(log) keep(pctwhite pctafam pcthispanic pctamind pctasian pctnhpi pctmultiple pctother)

//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
