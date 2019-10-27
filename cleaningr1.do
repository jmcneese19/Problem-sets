////////////////////////////////////////////////
/////     Prep files for merge	(*2016)   /////
//////////////////////////////////////////////
*Cleaning do file 
*tasked with cleaning, renaming, and relabeling housing data from 9 census years
*2008-2016


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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

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

cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\working\data //putting my self in my wokring folder to run my files 

save hou08cle.dta, replace
clear
