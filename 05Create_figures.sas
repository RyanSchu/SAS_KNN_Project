/*Mean Error Rate varies with level of K Clustered Data Including Outliers*/

proc import out = total_error file= '/home/u41145483/sas project/KNN_cluster_total_error.xlsx' dbms = 'xlsx' replace;
run;

proc sort data = total_error;
by k;
run;

symbol1 interpol=join value=dot;
proc gplot data = total_error;
title 'Mean Error Rate varies with level of K';
title2 'Clustered Data Including Outliers';
plot totalse*k;
run;

proc import out = error_rate file = '/home/u41145483/sas project/KNN_cluster_se.xlsx' dbms = 'xlsx' replace;
getnames=yes;
run;


data error_rate_sq;
set error_rate;
sqk = k**2;
run;


ods graphics on;
proc glm data = error_rate_sq;
class k;
model se = k;
means k / bon snk;
run;



proc reg data = error_rate_sq;
model se = k;
run;
proc reg data = error_rate_sq;
model se = k sqk;
run;

proc ttest data = error_rate;
by k;
var se;
run;


/*Mean Error Rate varies with level of K Clustered Data Excluding Outliers*/

proc import out = total_error_NO file= '/home/u41145483/sas project/KNN_cluster_total_error_exclude_outliers.xlsx' dbms = 'xlsx' replace;
run;

proc sort data = total_error_NO;
by k;
run;

symbol1 interpol=join value=dot;
proc gplot data = total_error_NO;
title 'Mean Error Rate varies with level of K';
title2 'Clustered Data Excluding Outliers';
plot totalse*k;
run;


proc import out = error_rate_NO file = '/home/u41145483/sas project/KNN_cluster_se_exclude_outliers.xlsx' dbms = 'xlsx' replace;
getnames=yes;
run;

data error_rate_NO_sq;
set error_rate_NO;
sqk = k**2;
run;






proc reg data = error_rate_NO_sq;
model se = k;
run;
proc reg data = error_rate_NO_sq;
model se = k sqk;
run;

proc glm data = error_rate_NO;
class k;
model se = k;
means k / bon snk tukey;
run;

proc ttest data = error_rate_NO;
by k;
var se;
run;
/* top five two way anova*/

proc import out = error_rate_five file = '/home/u41145483/sas project/knn_top_5_se.xlsx' dbms = 'xlsx';
getnames = yes;
run;

data error_rate_five_sq;
set error_rate_five;
sqk = k**2;
run;

proc reg data = error_rate_five;
model error = k;
run;

proc reg data = error_rate_five_sq;
model error = k sqk;
run;

proc ttest data = error_rate_five;
by k;
var error;
run;

proc import out = clusters file='/home/u41145483/sas project/clusterIDDict.xlsx' dbms = 'xlsx';
getnames = yes;
run;

proc sgplot data = clusters;
histogram  cluster20 / scale=count;
run;

proc sgplot data = clusters;
histogram  cluster30 / scale=count;
run;

proc sgplot data = clusters;
histogram  cluster70 / scale=count;
run;

proc sgplot data = clusters;
histogram  cluster90 / scale=count;
run;
