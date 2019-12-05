*________________________________________________________________________________________*
/*HW6:dofile
Jazmyne McNeese 
Fall 2019
Version:15
Topic: evictions in NJ 
DUE NOV30th

Summary:
My research interest in this project is to explore the effect of structural 
inequality in the housing market. Literature states that new homes that are 
being built are bigger and therefore my expensive (Dwyer, 2007). Therefore, 
renter-occupied homes are decreasing in stock but increasing in demnd and 
provide a propensity for landlord to file for evictions due to increased demand
for affordable or smaller housing (Stein, 2019). This may lead to an increase in
new and more expensive housing construction could then lead to an increase in 
eviction filings and the overall eviction rate (Desmond, 2016). My variables 
include, year housing was built, eviction filings, eviction rate, poverty rate,
median home values, renter-occupied homes etc..I intend to use a series of 
regressions to explain the variation in eviction filings or evictions and rates.
Therefore the goal of this research is to examine the extente of eviction in 
NJ's counties given the variables of interest from eviction research

Variables:
Dependent Vairables - evictions, evictionrate, evictionfilings, evictionfilingsrates  
Independent Variables - race, median houshold income, renter occupied homes
Control Variables - poverty, 

Research Questions: 
1. What is the extent of evicitons in the state of new jersey (Explore data)
2. Evaluate the relationship between evictions, evictionfilings, eviction rates and eviciton filign rates 
3. What is the extent of Race as a significant predictor of evictions 
4. How do these findings effect home values in NJ counties  

//could add specific hypotheses!

Data Sets: 
1- Eviction Lab at princton University NJ county level data from 2008-2016
(https://data-downloads.evictionlab.org/)
2- U.S. Census Bureau, American Community Survey 1-Year Estimates (2008)
3- U.S. Census Bureau, American Community Survey 1-Year Estimates (2009)
4- U.S. Census Bureau, American Community Survey 1-Year Estimates (2010)
5- U.S. Census Bureau, American Community Survey 1-Year Estimates (2011)
6- U.S. Census Bureau, American Community Survey 1-Year Estimates (2012)
7- U.S. Census Bureau, American Community Survey 1-Year Estimates (2013)
8- U.S. Census Bureau, American Community Survey 1-Year Estimates (2014)
9- U.S. Census Bureau, American Community Survey 1-Year Estimates (2015)
10- U.S. Census Bureau, American Community Survey 1-Year Estimates (2016)
11- Police Traffic Stop Records from the U.S. state of New Jersey 2009–2016 (https://data.world/dataneer/tsopp-nj)
12- Salaries, jobs, and experience of teachers in New Jersey in 2016 (https://data.world/sheilnaik/nj-teacher-salaries-2016)

References:
1. Dwyer, Rachel E. (2007). “Expanding Homes and Increasing Inequalities: 
U.S. Housing Development and the Residential Segregation of the Affluent.” Social Problems 54(1):23–46.
2. Desmond, M. (2016). Evicted: Poverty and profit in the American city. Broadway Books.
3. Stein, S. (2019). Capital City: Gentrification and the Real Estate State. Verso Books.
*/
//----------------------------PROGRAM BEGINS-------------------------------------------
//----------------------------PROGRAM BEGINS-------------------------------------------
//----------------------------PROGRAM BEGINS-------------------------------------------

////////////////////////////////////////////////
/////			Stata Set Up              /////
////////////////////////////////////////////// 
set more off  											 
clear   												       
set matsize 800 										 
cap log close	 										 
set logtype text 	

ssc install outreg, replace		
ssc install outreg2, replace
ssc install dataex, replace							
////////////////////////////////////////////////
/////  Organzie files 				      /////
////////////////////////////////////////////// 
cd C:\Users\Jazmyne\Desktop\
cap mkdir   jazzdrive

global dir "C:\Users\Jazmyne\Desktop\jazzdrive" 					
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
cd $dir\data									 
//-------------------------2016-------------------------------------------------			
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing16.dta?raw=true"

ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni 
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 fourteenoraft								
ren hc01_vc28 tentothirteen
ren hc01_vc29 twothotoonine
ren hc01_vc30 ninetytoninnin
ren hc01_vc31 eigtoeignin
ren hc01_vc32 sevtosevnin
ren hc01_vc33 sixtosixnin
ren hc01_vc34 fiftofifnin
ren hc01_vc35 foutofounin
ren hc01_vc36 thirninorearlier

ren hc01_vc55 nobed										
ren hc01_vc56 oneroom
ren hc01_vc57 tworooms 
ren hc01_vc58 threrooms
ren hc01_vc59 fourooms
ren hc01_vc60 fivormore

ren hc01_vc64 occhou									
ren hc01_vc65 ownocc
ren hc01_vc66 renocc
ren hc01_vc69 aveownocc
ren hc01_vc70 averenoccu

drop hc01_vc1*											
drop hc01_vc2*
drop hc01_vc4*											
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou16cle.dta, replace
clear
//----------------------------2015----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing15.dta?raw=true"
															 
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 fourteenoraft								
ren hc01_vc28 tentothirteen
ren hc01_vc29 twothotoonine
ren hc01_vc30 ninetytoninnin
ren hc01_vc31 eigtoeignin
ren hc01_vc32 sevtosevnin
ren hc01_vc33 sixtosixnin
ren hc01_vc34 fiftofifnin
ren hc01_vc35 foutofounin
ren hc01_vc36 thirninorearlier 

ren hc01_vc55 nobed										
ren hc01_vc56 oneroom
ren hc01_vc57 tworooms 
ren hc01_vc58 threrooms
ren hc01_vc59 fourooms
ren hc01_vc60 fivormore 

ren hc01_vc64 occhou									
ren hc01_vc65 ownocc
ren hc01_vc66 renocc
ren hc01_vc69 aveownocc
ren hc01_vc70 averenoccu

drop hc01_vc1*									
drop hc01_vc2*
drop hc01_vc4*											
drop hc01_vc5*
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou15cle.dta, replace
clear
//----------------------------2014----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing14.dta?raw=true"
															 
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate								
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 tenorafter								
ren hc01_vc28 twothotoonine
ren hc01_vc29 ninetytoninnin
ren hc01_vc30 eigtoeignin
ren hc01_vc31 sevtosevnin
ren hc01_vc32 sixtosixnin
ren hc01_vc33 fiftofifnin
ren hc01_vc34 foutofounin
ren hc01_vc35 thirninorearlier 

ren hc01_vc54 nobed										
ren hc01_vc55 oneroom
ren hc01_vc56 tworooms 
ren hc01_vc57 threrooms
ren hc01_vc58 fourooms
ren hc01_vc59 fivormore 

ren hc01_vc63 occhou									
ren hc01_vc64 ownocc
ren hc01_vc65 renocc
ren hc01_vc68 aveownocc
ren hc01_vc69 averenoccu

drop hc01_vc1*											
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
															 
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc08 homvacrate									
ren hc01_vc09 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc27 tenorafter								
ren hc01_vc28 twothotoonine
ren hc01_vc29 ninetytoninnin
ren hc01_vc30 eigtoeignin
ren hc01_vc31 sevtosevnin
ren hc01_vc32 sixtosixnin
ren hc01_vc33 fiftofifnin
ren hc01_vc34 foutofounin
ren hc01_vc35 thirninorearlier 

ren hc01_vc54 nobed										
ren hc01_vc55 oneroom
ren hc01_vc56 tworooms
ren hc01_vc57 threrooms
ren hc01_vc58 fourooms
ren hc01_vc59 fivormore 

ren hc01_vc63 occhou									
ren hc01_vc64 ownocc
ren hc01_vc65 renocc
ren hc01_vc68 aveownocc
ren hc01_vc69 averenoccu

drop hc01_vc1*											
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
															  
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier 

ren hc01_vc53 nobed										
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms 
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore

ren hc01_vc62 occhou									
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											
drop hc01_vc2*
drop hc01_vc3*
drop hc01_vc4*
drop hc01_vc5*											
drop hc01_vc7*
drop hc01_vc8*
drop hc01_vc9*

des
save hou12cle.dta, replace
clear
//----------------------------2011----------------------------------------------
use "https://github.com/jmcneese19/Problem-sets/blob/master/housing11.dta?raw=true"
															  
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										 
ren hc01_vc14 oneunidet 
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni
ren hc01_vc18 fivtoninuni 
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier 

ren hc01_vc53 nobed										
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore 

ren hc01_vc62 occhou									
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											
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
															  
ren hc01_vc03 tothom										
ren hc01_vc04 totocchom
ren hc01_vc05 totvachom

ren hc01_vc07 homvacrate									
ren hc01_vc08 renvacrate

ren hc01_vc13 totunits										
ren hc01_vc14 oneunidet
ren hc01_vc15 oneuniatt
ren hc01_vc16 twounits
ren hc01_vc17 threorfouuni 
ren hc01_vc18 fivtoninuni
ren hc01_vc19 tentoninteeuni
ren hc01_vc20 twenormor

ren hc01_vc26 tenorafter								
ren hc01_vc27 twothotoonine
ren hc01_vc28 ninetytoninnin
ren hc01_vc29 eigtoeignin
ren hc01_vc30 sevtosevnin
ren hc01_vc31 sixtosixnin
ren hc01_vc32 fiftofifnin
ren hc01_vc33 foutofounin
ren hc01_vc34 thirninorearlier

ren hc01_vc53 nobed										
ren hc01_vc54 oneroom
ren hc01_vc55 tworooms 
ren hc01_vc56 threrooms
ren hc01_vc57 fourooms
ren hc01_vc58 fivormore

ren hc01_vc62 occhou									
ren hc01_vc63 ownocc
ren hc01_vc64 renocc
ren hc01_vc66 aveownocc
ren hc01_vc67 averenoccu

drop hc01_vc1*											
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
															 
ren hc01_est_vc02 tothom										
ren hc01_est_vc03 totocchom
ren hc01_est_vc04 totvachom

ren hc01_est_vc05 homvacrate									
ren hc01_est_vc06 renvacrate

ren hc01_est_vc08 totunits										 
ren hc01_est_vc09 oneunidet
ren hc01_est_vc10 oneuniatt
ren hc01_est_vc11 twounits
ren hc01_est_vc12 threorfouuni
ren hc01_est_vc13 fivtoninuni 
ren hc01_est_vc14 tentoninteeuni
ren hc01_est_vc15 twenormor

ren hc01_est_vc20 twothofiveorafter								
ren hc01_est_vc21 twothotoofour
ren hc01_est_vc22 ninetytoninnin
ren hc01_est_vc23 eigtoeignin
ren hc01_est_vc24 sevtosevnin
ren hc01_est_vc25 sixtosixnin
ren hc01_est_vc26 fiftofifnin
ren hc01_est_vc27 foutofounin
ren hc01_est_vc28 thirninorearlier

ren hc01_est_vc43 nobed										
ren hc01_est_vc44 oneroom
ren hc01_est_vc45 tworooms
ren hc01_est_vc46 threrooms
ren hc01_est_vc47 fourooms
ren hc01_est_vc48 fivormore

ren hc01_est_vc50 occhou									
ren hc01_est_vc51 ownocc
ren hc01_est_vc52 renocc
ren hc01_est_vc53 aveownocc
ren hc01_est_vc54 averenoccu

drop hc01_est_vc1*											
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
															 
ren hc01_est_vc02 tothom										
ren hc01_est_vc03 totocchom
ren hc01_est_vc04 totvachom

ren hc01_est_vc05 homvacrate									
ren hc01_est_vc06 renvacrate

ren hc01_est_vc08 totunits										
ren hc01_est_vc09 oneunidet
ren hc01_est_vc10 oneuniatt
ren hc01_est_vc11 twounits
ren hc01_est_vc12 threorfouuni 
ren hc01_est_vc13 fivtoninuni 
ren hc01_est_vc14 tentoninteeuni
ren hc01_est_vc15 twenormor

ren hc01_est_vc20 twothofiveorafter								
ren hc01_est_vc21 twothotoofour
ren hc01_est_vc22 ninetytoninnin
ren hc01_est_vc23 eigtoeignin
ren hc01_est_vc24 sevtosevnin
ren hc01_est_vc25 sixtosixnin
ren hc01_est_vc26 fiftofifnin
ren hc01_est_vc27 foutofounin
ren hc01_est_vc28 thirninorearlier 

ren hc01_est_vc43 nobed										
ren hc01_est_vc44 oneroom
ren hc01_est_vc45 tworooms 
ren hc01_est_vc46 threrooms
ren hc01_est_vc47 fourooms
ren hc01_est_vc48 fivormore 

ren hc01_est_vc50 occhou									
ren hc01_est_vc51 ownocc
ren hc01_est_vc52 renocc
ren hc01_est_vc53 aveownocc
ren hc01_est_vc54 averenoccu

drop hc01_est_vc1*											
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
														
drop subbed												
drop imputed											
drop lowflag											
keep in 10/198											 
rename GEOID id2										
tostring id2, replace									

saveold "evicoucle", version(13) replace 				
clear
////////////////////////////////////////////////
/////		Adding more datasets          /////
////////////////////////////////////////////// 
*POLICE STOPS IN NJ*
use "https://github.com/jmcneese19/Problem-sets/blob/master/polsto916s.dta?raw=true"
rename county_fips id2
rename id caseid
gen year = year(stop_date)
tostring id2, replace
saveold "polsto916s", version(13) replace
clear 

*TEACHER SALARIES IN NJ*
use "https://github.com/jmcneese19/Problem-sets/blob/master/teasal16s.dta?raw=true"
gen countyname = county + " " + "County"
rename countyname name
collapse (median)salary, by(name) cw
saveold "teasal16s", version(13) replace
clear
////////////////////////////////////////////////
/////					Merge Files       /////
////////////////////////////////////////////// 
cd $dir\data							

use "hou16cle.dta"
append using hou15cle.dta									
append using hou14cle.dta									
append using hou13cle.dta									
append using hou12cle.dta									
append using hou11cle.dta									
append using hou10cle.dta									
append using hou09cle.dta									
append using hou08cle.dta

merge 1:1 id2 year using evicoucle // wont merge fully has state data my focus is county
drop _merge
merge 1:m id2 year using polsto916s	// wont merge fuly ots only from 2009-2011
drop _merge
merge m:1 name using teasal16s // wont fully merge only has 2016 year on 10,000 obs
drop _merge
						
////////////////////////////////////////////////
/////  labeling and cleaning master file  /////
////////////////////////////////////////////// 
keep in 10/198
ren id2 countyid 
la var countyid countycode
ren name countyname 
generate str id = substr(countyname , 1, strlen(countyname) - 6)

drop geodisplaylabel 
drop tenorafter twothofiveorafter twothotoofour				
drop parentlocation  
drop countyname

ren id countyname
la var countyname countyname

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
save evihoumer0816, replace
clear
////////////////////////////////////////////////
/////	     Question 1	Analysis          /////
////////////////////////////////////////////// 
cd $dir\output
use"https://github.com/jmcneese19/Problem-sets/blob/master/evihoumer0816.dta?raw=true", clear

des 												  
sum													
mvpatterns

local macro_trial evictionrate povertyrate population rentburden
levelsof countyid
levelsof countyid, local(levels)
foreach l of local levels {
display `l'
summarize `macro_trial' if countyid==`l'
}     		
								
reg evictions medianpropertyvalue
outreg using evihoumer0816, replace
reg evictions mediangrossrent
outreg using evihoumer0816, merge
reg evictions medianhouseholdincome 
outreg using evihoumer0816, merge
reg evictions occhou
outreg using evihoumer0816, merge
reg evictions ownocc
outreg using evihoumer0816, merge
reg evictions renocc 
outreg using evihoumer0816, merge
reg evictions renteroccupiedhouseholds 
outreg using evihoumer0816, merge
reg evictions totvachom
outreg using evihoumer0816, merge
reg evictionrate homvacrate
outreg using evihoumer0816, merge
reg evictionrate  renvacrate
outreg using evihoumer0816, merge
reg evictionrate povertyrate
outreg using evihoumer0816, merge

regress evictions povertyrate
outreg using evihoumer0816, replace
regress evictionfilings povertyrate
outreg using evihoumer0816, merge
reg evictions rentburden
outreg using evihoumer0816, merge

outreg2 using evihoumer0816, replace sum(log) keep(povertyrate rentburden) 									
outreg2 using evihoumer0816, replace sum(log) keep(evictionfilingrate evictionfilings evictions evictionrate)	
outreg2 using evihoumer0816, replace sum(log) keep(pctwhite pctafam pcthispanic pctamind pctasian pctnhpi pctmultiple pctother)

/*Desomnds book reviews poverty and economic explortation in teh housing market. 
The stories of those who fall victim to the substandard system do so because 
they are paying majoirty thier income on rent. Thereofre,I would expect to see 
significant relationships between variables like evictions, poverty and rentbrden.
After an assessment of the data I did find relationships amoung a few variables.
It is no suprise that for every one unit increase in the povertyrate 
theres a 79.4 unit increase in evictions. Likewise,for every one unit increase
In poverty rate the eviction filings will go up 1206.48 times. This mens that 
being in poverty incrreases your risk for having an eviction. Moreover, 
paying more of your income towards rent has shown to decrease evenictions. These
findings are un sustainable for the state of new jersey, and calls to question
how we value housing in the state.*/
////////////////////////////////////////////////
/////			 Question 2  Analysis	  /////
////////////////////////////////////////////// 		
graph set window fontface "Times New Roman"
replace totuni=totuni/1000

gr hbar totuni evictions, over (countyname)
gr hbar totuni evictionfilings, over (countyname) 

gr hbar povertyrate evictionrate, over (countyname)
gr hbar povertyrate evictionfilingrate, over (countyname) 	

gr matrix evictionrate pct*, half
gr export graph1.png, replace						

gr hbar evictionrate povertyrate, over(year, sort(povertyrate))
gr export graph4.png, replace
gr hbar evictionfilingrate povertyrate, over(year, sort(povertyrate))
gr export graph4.png, replace

pwcorr eviction*
gr matrix eviction*, half 

scatter povertyrate evictions
scatter povertyrate evictionfilings
scatter renvacrate evictions
scatter renvacrate evictionfilings
scatter homvacrate evictions
scatter homvacrate evictionfilings

local misfortune evictionrate povertyrate rentburden totvachom
di `misfortune'
tabstat `misfortune', by(countyname) stat(mean sd min max) nototal long col(stat)

/* What we find when we assess that graphs and charts is that the mean number of
evitions exceeds tha mean total number of houing units in most counties, 
accounting for the fact that tototal housign units have been sclaed by 1000.
what this tells us is that evictions far exceed total housing stiock. And because
this variabke does not separate rental units from mortaged homes. The graph is 
alarming, signially a possible overuse of evictions in our state. As can be seen
by the eviciton fillings graph, the numbers beocme even more stark. Glouster, 
Camden and mercer counties have the highest eiction rates where as, Exssex, 
Cumberland, and Mercer coutniesh ave the highest eviction filings rates. Even 
though evictionrate shave decreased from 2008 - 2016, New jersey counties 
still have soem work to do. However, when we look at evenciton filign rates we 
we the complete opposite outcomes. evcitions filling have drastically increased
from 2008-2016. This coul be explianed by both desmoind and stens work regaring 
the use of evictions as a safe haven for homeowners. */
////////////////////////////////////////////////
/////	      Question 3 Analysis	      /////
////////////////////////////////////////////// 
gr matrix evictionrate pctwhite pctrenteroccupied, half
gr matrix evictionrate pctafam pctrenteroccupied, half
gr matrix evictionrate pctasian pctrenteroccupied, half
gr matrix evictionrate pcthispanic pctrenteroccupied, half

gr hbar evictionrate pctwhite, over(countyname) name(WHEV, replace)
gr export graph2.png, replace
gr hbar evictionrate pctafam, over (countyname) name(BLEV, replace)
gr export graph3.png, replace
graph combine WHEV BLEV, col(1) imargin(0 0 0 0) graphregion(margin(l=22 r=22))
gr export graph4.png, replace

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
est tab eviction*, b(%9.2f) star							

foreach dv of varlist evictionrate*{
reg `dv' pctwhite 
est store `dv'_r 
reg `dv' pctwhite povertyrate 
est store `dv'_po 
reg `dv' pctwhite povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionrate*, b(%9.2f) star 						

foreach dv of varlist evictionfilings*{
reg `dv' pctwhite 
est store `dv'_r 
reg `dv' pctwhite povertyrate 
est store `dv'_po 
reg `dv' pctwhite povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionfilings*, b(%9.2f) star							

foreach dv of varlist evictionfilingrate*{
reg `dv' pctwhite 
est store `dv'_r 
reg `dv' pctwhite povertyrate 
est store `dv'_po 
reg `dv' pctwhite povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctwhite povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionfilingrate*, b(%9.2f) star							


foreach dv of varlist eviction*{
reg `dv' pctafam 
est store `dv'_r 
reg `dv' pctafam povertyrate 
est store `dv'_po 
reg `dv' pctafam povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctafam povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab eviction*, b(%9.2f) star							

foreach dv of varlist evictionrate*{
reg `dv' pctafam 
est store `dv'_r 
reg `dv' pctafam povertyrate 
est store `dv'_po 
reg `dv' pctafam povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctafam povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionrate*, b(%9.2f) 

foreach dv of varlist evictionfilings*{
reg `dv' pctafam 
est store `dv'_r 
reg `dv' pctafam povertyrate 
est store `dv'_po 
reg `dv' pctafam povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctafam povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionfilings*, b(%9.2f) star							

foreach dv of varlist evictionfilingrate*{
reg `dv' pctafam 
est store `dv'_r 
reg `dv' pctafam povertyrate 
est store `dv'_po 
reg `dv' pctafam povertyrate  medianpropertyvalue
est store `dv'_pr
reg `dv' pctafam povertyrate  medianpropertyvalue medianhouseholdincome
est store `dv'_pp
}
est tab evictionfilingrate*, b(%9.2f) star	

levelsof countyid , loc(_countyid)
levelsof year, loc(_year)
foreach ev in `_countyid'{
  foreach year in `_year'{
    qui sum pctafam  if countyid ==`ev' & year == `year'
    di "the mean for`:var lab countyid'`: label countyid `ev'' and `:var lab year' `: label origin `year'' is `r(mean)'"
  }
}

/* Being white decreases evictons and decreases the amoutn of renter occupied 
homes. Howeverbeing anything other thanwhite has teh complete opposite effects. 
Still, being african american the eviction rates and percentage of renter occupied
home slopes increase much much faster. Just as Desmond, Stein  and Dwyers work
suggest, racial segregation is correlated with raial segregation. addressing 
both are critical to sustainable change in the housing market. Though the rates 
seem to be more significantly correlated, with an increase in speficic racial 
profiles of the population. Black and white racial groups are complete polar 
opposites with hsipanic populations not far behind. Race is a significant
predictor of evicitions and eviciton filing rates. However, house hold income 
has been shown to be a mitigating factor. */ 						
////////////////////////////////////////////////
/////	      Question 4 Analysis	      /////
//////////////////////////////////////////////
reg evictionfilings 										
estimates store filings 
reg evictionfilings medianpropertyvalue 
est store value 
reg evictionfilings medianpropertyvalue povertyrate 
est store poverty 
reg evictionfilings medianpropertyvalue povertyrate medianhouseholdincome
est store income
reg evictionfilings medianpropertyvalue povertyrate  medianhouseholdincome rentburden
est store burden
esttab filings value poverty income burden, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictionfilingrate 										
estimates store filingr 
reg evictionfilingrate medianpropertyvalue 
est store value 
reg evictionfilingrate medianpropertyvalue povertyrate 
est store poverty 
reg evictionfilingrate medianpropertyvalue povertyrate medianhouseholdincome
est store income
reg evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
est store burden
esttab filingr value poverty income burden, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictions 										
estimates store evictions 
reg evictions medianpropertyvalue 
est store value 
reg evictions medianpropertyvalue povertyrate 
est store poverty 
reg evictions medianpropertyvalue povertyrate medianhouseholdincome
est store income
reg evictions medianpropertyvalue povertyrate  medianhouseholdincome rentburden
est store burden
esttab evictions value poverty income burden, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

reg evictionrate 										
estimates store evictr 
reg evictionrate medianpropertyvalue 
est store value
reg evictionrate medianpropertyvalue povertyrate 
est store poverty 
reg evictionrate medianpropertyvalue povertyrate medianhouseholdincome
est store income
reg evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
est store burden
esttab evictr value poverty income burden, order(_cons) stat(r2 F N) mtitle label varw(25) title("Table 1: OLS Models")

*All*
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
sum `housing'
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
reg `housing'

*Gloucester*
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34015
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34015

*Camden*
local housing evictionfilingrate medianpropertyvalue povertyrate medianhouseholdincome rentburden
summarize `housing' if countyid==34007
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34007

*Essex*
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34013
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34013

*Cumberland*
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34011
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34011

*Mercer*
local housing evictionfilingrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34021
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34021

*All*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
sum `housing'
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
reg `housing'

*Gloucester*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34015
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34015

*Camden*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34007
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34007

*Essex*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34013
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34013

*Cumberland*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34011
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34011

*Mercer*
local housing evictionrate medianpropertyvalue povertyrate  medianhouseholdincome rentburden
summarize `housing' if countyid==34021
local housing evictionfilingrate medianpropertyvalue medianhouseholdincome 
reg `housing' if countyid==34021 

/*After assessing all of the housing data, we find that propoerty vale and 
median household income do impact the rate of evictions, however when we assess
thos eimpacts in the counties that suffer the most, we find no significant values.
These findings point to the the work of afrmetioned scholars that the state
of evictions over all is  structural issue and one that has gone under the radar 
in our conversations around housing, relatte, and racial inequality. What is 
even more concerning is the impact that these issues have on communties of color
with a possible ressesion on the horizon. Future research should investigate the
current housing market through a qualitative study on those who live in these
hardest hit counties in new jersey. *\
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
//----------------------------PROGRAM ENDS---------------------------------------------
