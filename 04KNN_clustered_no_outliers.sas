proc import out = term_matrix file='E:\SAS project\Features_by_cluster_strict.csv' dbms = 'csv' replace;
	getnames = no;
	datarow=2;
run;

data term_filtered;
set term_matrix;
where VAR693 ^= "Clust29" and VAR693 ^= "Clust9";
run;

data temp;
set term_filtered;
n=ranuni(8);
proc sort data=temp;
  by n;
  data training testing;
   set temp nobs=nobs;
   if _n_<=.7*nobs then output training;
   else output testing;
   run;
/*proc contents data = testing;
run;*/

proc discrim method = npar k = 5 testdata = testing testout= testing_res5 data = training crossvalidate;
title 'K=5 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 10 testdata = testing testout= testing_res10 data = training crossvalidate;
title 'K=10 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 20 testdata = testing testout= testing_res20 data = training crossvalidate;
title 'K=20 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 30 testdata = testing testout= testing_res30 data = training crossvalidate;
title 'K=30 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 40 testdata = testing testout= testing_res40 data = training crossvalidate;
title 'K=40 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 50 testdata = testing testout= testing_res50 data = training crossvalidate;
title 'K=50 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 100 testdata = testing testout= testing_res25 data = training crossvalidate;
title 'K=100 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 150 testdata = testing testout= testing_res25 data = training crossvalidate;
title 'K=150 by cluster';
class VAR693;
var VAR1-VAR691;
run;

proc discrim method = npar k = 200 testdata = testing testout= testing_res25 data = training crossvalidate;
title 'K=200 by cluster';
class VAR693;
var VAR1-VAR691;
run;




