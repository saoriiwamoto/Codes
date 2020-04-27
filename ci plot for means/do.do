
clear all	

cd 	"{directory}"
use "data.dta"

*Raw score with CI
* ssc install ciplot // only for the first time
ciplot idelapct, by(treatment) ///
name(idela)

ciplot enumpct, by(treatment) ///
name(enumpct)

ciplot soemopct, by(treatment) ///
name(soemopct)

ciplot elitpct, by(treatment) ///
name(elitpct)

ciplot motorpct, by(treatment) ///
name(motorpct)

graph combine idela enumpct soemopct elitpct motorpct, ycommon xcommon r(1) com scheme(s1mono)

graph export "figure.png", as(png) name("Graph") replace

