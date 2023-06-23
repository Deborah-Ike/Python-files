* QUESTION 1;
proc format;
value gr 1 = '0 worms'
		 2 = '500 worms'
		 3 = '1000 worms'
		 4 = '4000 worms';
data measurement;
input group growth @@;
cards;
1 10.7 1 9.0  1 13.4 1 9.2
2 11.1 2 11.1 2 8.9  2 11.4
3 5.7  3 5.1  3 7.2  3 4.8
4 4.7  4 3.2  4 6.5  4 5.3
;
proc glm;
class group;
model growth=group;
means group / scheffe lines cldiff;
format group gr.;
title1 'use proc glm to test for the differences among three planting pots';
run;

* QUESTION 2;

proc format;
value gr 1 = 'No Deprivation'
		 2 = '18 Hours Deprivation'
		 3 = '24 Hours Deprivation'
		 4 = '48 Hours Deprivation'
		 ;
data sleep;
input group memory @@;
cards;
1 25 1 19 1 18 1 21 1 24 1 25 1 21
2 14 2 14 2 12 2 13 2 16 2 14 2 17
3 14 3 13 3 15 3 11 3 13
4 7  4 9  4 6  4 11 4 5  4 10
;

proc glm;
class group;
model memory = group;
means group/ scheffe lines cldiff;
format group gr.;
run;
 proc format; 
 value gr 1 = 'No Deprivation'
		 2 = '18 Hours Deprivation'
		 3 = '24 Hours Deprivation'
		 4 = '48 Hours Deprivation'
		 ;
data sleep;
input group memory @@;
x1a=0; x2a=0; x3a=0;
if group=1 then x1a=1;
if group=2 then x2a=1;
if group=3 then x3a=1;
if group=4 then do;
                x1a=-1;
				x2a=-1;
				x3a=-1;
end;
cards;
1 25 1 19 1 18 1 21 1 24 1 25 1 21
2 14 2 14 2 12 2 13 2 16 2 14 2 17
3 14 3 13 3 15 3 11 3 13
4 7  4 9  4 6  4 11 4 5  4 10
;
proc glm;
model memory = x1a x2a x3a;
title2 'use proc glm to find model parameters no class statement';
run;
