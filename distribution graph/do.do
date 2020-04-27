* Figure: Bar plot of two variables over each other

		clear all	

		cd 		"{direcotry}"
		use 	"data.dta"


* CREDI z-score distribution, by treatment (Baseline)
	gen zero = 0

* Getting density points by treatment (x = the points at which the density is estimated, and d= the density estimate.)

	qui kdensity z_overall if treatment==1 , gen(x1 d1)
	qui kdensity z_overall if treatment==0 , gen(x2 d2) 

*Getting the location value for the mean line
	sum z_overall if treatment ==1, meanonly 
	local meant = `r(mean)' 
	sum z_overall if treatment ==0, meanonly
	local meanc = `r(mean)' 

	
* Use range plot with area shading (rarea takes the value of the highest, the lowest, and x axis value)

	twoway 		rarea d1 zero x1, color(gray%40) ///
			||  rarea d2 zero x2, color(orange%40)	 ///
			, ///
				ytit("Probability of frequency", size(small) ) ///
				xtit("z-score", size(small) ) ///
				ylab(, labsize(small) nogrid) ///
				xlab(, labsize(small) format(%5.0f) nogrid) 	///
				xli(`meant', lpa(dash) lcolor(black%40)) ///
				xli(`meanc', lpa(dash) lcolor(red%40)) ///
				legend(label(1 "Treatment") label(2 "Comparison")) /// or you can choose legend(off) if unnecessary.
				graphregion(color(white)) ///
				title("Probability distribution of overall CREDi z-score: By treatment status (Baseline)", size(3)) 

graph export "figure.png", as(png) name("Graph") replace

