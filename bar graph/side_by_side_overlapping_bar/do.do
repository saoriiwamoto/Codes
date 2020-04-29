* Figure: Side-by-side bar plots of two variables over each other

clear all

cd 		"{directory}"
use 	"data.dta"


* Using categorical variables, create a bar graph by treatment status to place side by side.
* Graph 1
tw (hist momed_highest if treatment==1, freq lcolor(gs12) fcolor(gs12)) (hist momed_highest if treat==0, freq fcolor(orange%40) lcolor(orange%40)), legend(off) ytitle("Frequency") xtitle("Gray: Treatment, Orange: Control") ///
	title(Mother's education) xlab(1(1)4 , nogrid notick labsize(small) ) graphregion(color(white)) bgcolor(white) ylab(0(10)70) ///
	name(momed)

* Graph 2
tw (hist daded_highest if treat==1, freq lcolor(gs12) fcolor(gs12)) (hist daded_highest if treat==0, freq fcolor(orange%40) lcolor(orange%40)), legend(off) xtitle("Gray: Treatment, Orange: Control") ytitle("") ///
	title(Father's education) xlab(1(1)4 , nogrid notick labsize(small) ) graphregion(color(white)) bgcolor(white) ylab(0(10)70) ///
	name(daded) // 

* Placing the graphs side by side
graph combine momed daded, ycommon xcommon com scheme(s1mono)

* Export graph
graph export "figure.png", replace


