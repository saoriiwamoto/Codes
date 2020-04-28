
clear all	

cd 	"{directory}"
use "data.dta"


* Creating global to use for the regression analysis
gl idelavars 	enumpct 	soemopct 	elitpct 	motorpct 	idelapct 	efpct 		atlpct 
gl hlevars 		nreadmats 	ntoytypes 	sum_hle 	sum_hla 	sum_neg
gl outcomevars 	$idelavars $hlevars
gl home 		childage female ///
				momage momliterate momed /// 
				dadage dadliterate daded /// 
				nchild ///
 				homelang_English homelang_French homelang_Swahili 
gl control 		bl_careatti6_agree bl_careatti7_agree 
gl blyvar ///
	bl_sum_hle 	 	bl_sum_hla 		bl_sum_neg /// 
	bl_enumpct 		bl_soemopct 	bl_elitpct 		bl_motorpct 	bl_efpct 	bl_atlpct   


* For IDELA
foreach name in enumpct 	soemopct 	elitpct 	motorpct 	idelapct {
	egen z`name' = std(`name')
	reg z`name' $blyvar $control $home treatment , cl(bl_schoolid) r
	eststo `name'
}

coefplot 	enumpct 	soemopct 	elitpct 	motorpct 	idelapct ///
			, keep(treatment) xline(0) ///
			plotlabels("Emergent Numeracy" "Socio-emotional" "Emergent Literacy" "Motor" "IDELA total") ///
			ytit("Treatment effect") ///
			ylab("") ///
			xtitle("Standard Deviation of the score") ///
			graphregion(color(white)) bgcolor(white) ///
			legend( ///
					pos(6) ring(3) r(1) size(3) ///
					region(lwidth(none) fc(white)) ///
					) 

graph export "figure.png", replace width(4000)


