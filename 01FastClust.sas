proc import out=questiontagmatrix file='E:\SAS project\Quesion_tag_matrix_filtered_strict.csv' dbms="csv";
getnames = yes;
run;

proc transpose data = questiontagmatrix out= TquestionTagMatrix;
ID questionid;
run;

proc fastclus data= tquestiontagmatrix out= clust20 maxclusters=20;
run;

proc fastclus data= tquestiontagmatrix out= clust30 maxclusters=30;
run;

proc fastclus data= tquestiontagmatrix out= clust70 maxclusters=70;
run;

proc fastclus data= tquestiontagmatrix out= clust90 maxclusters=90;
run;
