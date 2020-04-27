* Figure: Line plot for score 

		clear all	

		cd 		"{directory}"
		use 	"data.dta"

twoway (lowess overall age_m if treatment==0, color("blue") sort) (lowess overall age_m if treatment==1, color("red") sort) ///
, ///
ylabel(43(1)53) ///
xlabel() ///
xtitle("Age in months") ///
ytitle("CREDI raw score") ///
leg(order(1 "Comparison Group" 2 "Treatment Group")) ///
title("Age in month and CREDI raw score", justification(center)) ///
graphregion(color(white)) legend(region(lc(none) fc(none))) ///
ylab(,angle(0) nogrid) title(, justification(left) color(black) span pos(11)) subtitle(, justification(left) color(black))

graph export "figure.png", as(png) replace

* adding stata_code or modifying it
* additing even more edition before adding this back.


