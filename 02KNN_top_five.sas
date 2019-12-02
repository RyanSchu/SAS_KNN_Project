
proc import out = term_matrix file='E:\SAS project\questions_term_freq_matrix_strict.csv' dbms = 'csv' replace;
	getnames = no;
	datarow=2;
run;



data temp;
set term_matrix;
n=ranuni(8);
proc sort data=temp;
  by n;
  data training testing;
   set temp nobs=nobs;
   if _n_<=.7*nobs then output training;
   else output testing;
   run;
/*
proc contents data = testing;
run;
*/
proc discrim method = npar k = 5 testdata = testing testout= testing_res5 data = training crossvalidate;
title 'k=5 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;
proc discrim method = npar k = 10 testdata = testing testout= testing_res10 data = training crossvalidate;
title 'k=10 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 20 testdata = testing testout= testing_res20 data = training crossvalidate;
title 'k=20 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 30 testdata = testing testout= testing_res30 data = training crossvalidate;
title 'k=30 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 40 testdata = testing testout= testing_res40 data = training crossvalidate;
title 'k=40 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 50 testdata = testing testout= testing_res50 data = training crossvalidate;
title 'k=50 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 100 testdata = testing testout= testing_res100 data = training crossvalidate;
title 'k=100 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 150 testdata = testing testout= testing_res150 data = training crossvalidate;
title 'k=150 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;

proc discrim method = npar k = 200 testdata = testing testout= testing_res200 data = training crossvalidate;
title 'k=200 crossvalidate';
class VAR456;
var VAR1-VAR453;
run;
