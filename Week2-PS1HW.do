
*HW1:dofile
*Jazmyne McNeese 
*Fall 2019
*Version:15
*Topic:Loading data, descriptives, saving
*Why: I have a working paper for this data set,although it is missing a time variable(date schools switched)
*----------------------------

//nice preamble! and i like 'why'--lets talk more about data


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

//use "https://github.com/jmcneese19/Problem-sets/blob/master/final_data.dta?raw=true, clear load from git hub

use "https://docs.google.com/uc?id=1mLpl7OMdCKMteSvUbrGLaTMc_cCYLb3D&export=download", clear
*cd C:\Users\Jazmyne\Desktop\Stata\Datamanagement\data *myfiles
*go to the folder with the data
*Navagating directories 
*PWD - where am I
*cd - change directory 
*ls - list all contents in directors
*mkdir - make a directory 
*rmdir - remove directory 
*dir - show what files you have
 
use final_data,clear
*load data in to stata
 
des
*descirptive stats for all
**specs 
* 4,197 obervations 
*24 variables 
*most variables are percenatges

list
*list of all variables 

sum
*summary stats
**specs
* this is school distorct level data for the state of oklahoma
*some communities are 100% white and 100% indian

save, replace
*save data set

export excel using sch, replace

export delimited using sch, replace

export dbase using sch, replace

//save [filename], replace *save as dta

//outsheet using [filename], replace *save as csv


//---------------------------data mgmt notes ----------------------------------------------

//Note that Stata output will appear jumbled unless you use a fixed width font, 
//such as Courier New. A font size of 9 will keep the lines from breaking.

//note stata can download files
*copy https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta ./
  
//for delimited format use insheet/outsheet*/                            
*insheet using gss.csv, clear
*outsheet using mydata.csv, replace comma nolabel

//you can load data from url*/ 
*use https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.dta, clear    
*insheet using https://sites.google.com/site/adamokuliczkozaryn/datman-1/gss.csv, clear
