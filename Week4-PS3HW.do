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
*_______________________________________________________________________________________*





////////////////////////////////////////////////
/////		cleaning merged file	      /////
////////////////////////////////////////////// 

reshape j year 

drop in 1/1 

drop parent location 

drop percentrenteroccuiped

drop rentburden

drop geodisplaylabel



save evihoumer0816, replace

*________________________________________________________________________________________


/****************/
/* Combine Data */
/****************/


***Merge


*match dads and moms; from www.ats.ucla.edu/stat/stata/modules/combine.htm
clear
input famid str10 dadName dadInc
2 "Jeb"  22000
1 "Marco"  30000
3 "Donald" 25000
4 "Ted"  100000
end
save dads, replace
list 

clear
input famid str10 momName momInc
1 "Angela"  15000
3 "Megyn"  50000
2 "Carly"  18000
5 "Hilary"  200000
end
save moms, replace
list 


use dads, clear //master
list 

merge 1:1 famid using moms //moms is using
l


*our favorite gss data (from slide)
use gss.dta, clear
gen id= _n
keep id region
save gss1.dta, replace /* (using)*/
use gss.dta, clear
gen id= _n
keep id inc /* (master)*/
merge 1:1 id using gss1.dta /* combine with (using)*/
tab _merge /*always think about the merging results*/

//and more examples below (from merge helpfile; all helpfiles have examples at the bottom)


*cars merging
webuse autosize, clear
list
webuse autoexpense,clear
list
//1:1 merge
webuse autosize
merge 1:1 make using http://www.stata-press.com/data/r14/autoexpense
list

//1:1 merge, requiring there to be only matches
// (The merge command intentionally causes an error message.)
webuse autosize, clear
merge 1:1 make using http://www.stata-press.com/data/r14/autoexpense, assert(match)
tab _merge
list

//1:1 merge, keeping only matches and squelching the _merge variable
//don't do it--we don't know what really happened
webuse autosize, clear
merge 1:1 make using http://www.stata-press.com/data/r14/autoexpense, keep(match) nogen
list


* m:1

webuse dollars, clear
list
webuse sforce,clear
list

//m:1 match merge with sforce in memory
merge m:1 region using http://www.stata-press.com/data/r14/dollars
list //note that sales and cost repeat themselves (are not unique) within regions
// and the are unique across regions; names are unique both ways
//it is important to be clear about this!

clear
input id age edu str2 state  //persons
1 23 12 TX
2 43 16 TX
3 82 10 CA
4 24 16 CA
5 34 18 CA
6 38 15 NY
end
l
save ppl, replace

clear
input str2 state pop criRat urbPct  //states
TX 26 508.2 75.4
CA 38 503.8 89.7
NY 19 401.8 82.7
AL 10 900   3.3
end
l

merge 1:m state using ppl
l

//OR could collapse multiple ppl per state to one state, take averages and merge 1:1

/*Append*/  
use gss.dta, clear
keep in 1/5
save gss1.dta, replace/* (using)*/
use gss.dta, clear
keep in 6/10
append using gss1.dta

/*Reshape*/
use gss.dta, clear
keep inc
ren inc inc1
gen inc2=2*inc1
gen id= _n
l id inc*, nola
reshape long inc, i(id) j(period)
l


//http://campus.lakeforest.edu/lemke/econ330/stata/lab3/index.html
use http://campus.lakeforest.edu/lemke/econ330/stata/lab3/wisconsin98data.dta,clear
keep in 1/10
keep name  name bamin* bamax* 
list name bamin* bamax* 
reshape long bamin bamax, i(name) j(year)
l

reshape wide bamin bamax, i(name) j(year)
l

//sometimes need to reshape twice
use http://www.ssc.wisc.edu/sscc/pubs/files/stata_prog/monthyear.dta, clear
d
reshape long incJan incFeb incMar incApr incMay incJun incJul incAug incSep incOct incNov incDec, i(id)j(yr)
gen id2=_n
reshape long inc, i(id2)j(mo)string
d

//-----------------SKIP THE FOLLOWING------------------



TODO: redo this exercise with something more real world--where 2 disctinct
datasets are merged not one that is fake--guess just input data like with dads
and moms above!!

//---------EXERCISE 1--------------


 load fresh gss.dta
for each of the following
 create id, a unique identifier for each observation; 
 save two datasets: one with id and region only, another with id and
 income only;  merge these two datasets
  create another two datasets: one with first 50
 observations, another  contains the rest observation;  append them
  create new variable: income\_in\_previous\_year which
 is 10\% smaller than respective income for this year;  reshape
 dataset to long format on income' hint: remember to have similar
 prefix on both, eg. `inc' and different suffix, eg. `1' and `2'


























  
*__________________________________________________________________
/*exercises--solutions*/




/*1*/

use gss.dta, clear
gen id= _n
keep id region
save gss1.dta, replace
use gss.dta, clear
gen id= _n
keep id inc
merge id using gss1.dta, sort
tab _merge

use gss.dta, clear
keep in 1/50
save gss1.dta, replace
use gss.dta, clear
keep in 51/l
append using gss1.dta
edit

use gss.dta, clear
gen inc1=inc
gen inc2=.9*inc
drop inc /*need to drop this one because we want to have only two inc
variables*/
gen id= _n
reshape long inc, i(id) j(period)

edit



*** an example of local macro... more later in programming class
local path "/some_drive/some_dir/"
//locals are like objects in object oriented programming like Python

display "`path'"


//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------

/***************************/
/* my usual stata commands */
/***************************/
clear                                  
capture set maxvar 10000
version 10                             
set more off                           


/*********************************/
/* Working Hours in Europe vs US */
/*********************************/

*TODO:
*E.G. many additional vars commented out that can be used in the future  
* double check everything with "assert"

loc d="~/desk/papers/gss_town_AND_politics/"        //the root directory, or the parent directory

/**********************************************************/
/* below is a directory structure for a simple project... */
/**********************************************************/
capture mkdir "`d'tex"                 
capture mkdir "`d'out"                 
capture mkdir "`d'out/tmp"
//capture mkdir "`d'res"             
capture mkdir "`d'lit"                 
capture mkdir "`d'dat"
//capture mkdir "`d'dat/base"                
capture mkdir "`d'scr"

cd "`d'"



//------------------------------data_mgmt----------------------------------------

use "`d'dat/gss.dta", clear

........

save "`d'dat/gss2.dta", clear

  
//------------------------------END data_mgmt------------------------------------



//------------------------------sum_sts----------------------------------------
  
//------------------------------END sum_sts------------------------------------



//------------------------------regressions----------------------------------------
  
//------------------------------END regressions------------------------------------


//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------  


//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
  
/*****************************/
/* many dofiles              */
/*****************************/

  
/* this is a masterdofile */
do `d' data_mgmt.do
do `d' data_anal.do
do `d' produce_res.do

//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------  

  
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------

       


/*********************************************************************************************************/
/* this is a complicated project so we have a root directory soemwhere that is common for many projects  */
/*********************************************************************************************************/

loc g="~/desk/papers/root/"  // g is general or generic as opposed to d for project specific dir


capture mkdir "`g'do"
capture mkdir "`g'data"
capture mkdir "`g'data/gss"


/**********************************************************/
/* below is a directory structure for a simple project... */
/**********************************************************/

loc d="~/desk/papers/gss_town_AND_politics/"

capture mkdir "`d'tex"                 
capture mkdir "`d'out"                 
capture mkdir "`d'out/tmp"
//capture mkdir "`d'res"             
capture mkdir "`d'lit"                 
capture mkdir "`d'dat"
//capture mkdir "`d'dat/base"                
capture mkdir "`d'scr"

cd "`d'"


/***************************/
/* my usual stata commands */
/***************************/
clear                                  
set mem 500m                           
capture set maxvar 10000
version 10                             
set more off                           



//------------------------------data_mgmt----------------------------------------
do `g'do/aok_programs.do
do `g'do/gss_data_mgmt.do
//------------------------------END data_mgmt------------------------------------
  

//------------------------------sum_sts----------------------------------------
use "`g'data/gss/gss.dta", clear   //grabbing data from root directory, because that data has many children

........

save "`d'dat/gss2.dta", clear
//------------------------------END sum_sts------------------------------------


//------------------------------regressions----------------------------------------
  
//------------------------------END regressions------------------------------------


//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------
//------------------------------end of dofile------------------------------------  

  
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
//------------------------------begin dofile------------------------------------
  
/****************************/
/* /\********************\/ */
/* /\* naming, labeling *\/ */
/* /\********************\/ */
/****************************/   


loc d="~/desk/papers/gss_town_AND_politics/"        

/**********************************************************/
/* below is a directory structure for a simple project... */
/**********************************************************/
capture mkdir "`d'tex"                 
capture mkdir "`d'out"                 
capture mkdir "`d'out/tmp"
//capture mkdir "`d'res"             
capture mkdir "`d'lit"                 
capture mkdir "`d'dat"
//capture mkdir "`d'dat/base"                
capture mkdir "`d'scr"

cd "`d'"


/***************************/
/* my usual stata commands */
/***************************/
clear                                  
capture set maxvar 10000
version 10                             
set more off                           
cd "`d'"


/***************************************************/
/* workaround for installing user-written commands */
/***************************************************/ 

sysdir  
help sysdir

mkdir ~/Desktop/junk/
adopath + ~/Desktop/junk/
adopath - ~/Desktop/junk/

/* this one is more "invasive", remember to set it back...   */
//sysdir set PLUS ~/Desktop/junk/  
//sysdir set PLUS ~/ado/plus

  



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



//----
  
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


//--1--
/* get csv data
insheet using https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.csv,clear  
and generate a new variable "happy" that will be based on var
v6 which is coded as
1. very happy
2. pretty happy
3. not too happy
the new var 'happy' should be coded 1 if person is either 'very' or 
'pretty' happy and 0 otherwhise


//--2--

get 1972 gss data
http://gss.norc.org/documents/stata/1972_stata.zip
and find all status variables and save them as csv

*/
















//------------------exercise solutions---------------------- 


/*****/
/* 1 */
/*****/
insheet using https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.csv,clear 
recode v6 (1/2=1 "very/pretty happy") (3=0 "miserable"), gen(happy)
la var happy "general happiness"

/* double check */
ta happy v6, mi


/*****/
/* 2 */
/*****/

copy http://gss.norc.org/documents/stata/1972_stata.zip 1972_stata.zip
unzipfile  1972_stata.zip
use GSS1972.DTA,clear


/* get the status variables */
lookfor status
lookfor prestige
lookfor wealth
lookfor income
lookfor education

/* summarize them to see how many missing obs */
sum ....

/* keep the ones you need */
keep ...

outsheet using mygss.csv, comma replace

