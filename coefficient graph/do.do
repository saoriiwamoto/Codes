
clear all	

cd 	"{directory}"
use "data.dta"

* Plot for the average score of IDELA when controlling for other variables (with CI bar)
gl idelavars 	enumpct 	soemopct 	elitpct 	motorpct 	idelapct 	efpct 		atlpct 
gl hlevars 		nreadmats 	ntoytypes 	sum_hle 	sum_hla 	sum_neg
gl outcomevars 	$idelavars $hlevars
gl home 		childage female ///
				momage momliterate momed /// tried momeduc_3 as well, no change
				dadage dadliterate daded /// tried dadeduc_3 as well, no change
				nchild ///
 				homelang_English homelang_French homelang_Swahili // Everyone speaks homelang_Kinyarwanda
* 				careatti6_agree	careatti7_agree //turn this on for long data model
gl control 		bl_careatti6_agree bl_careatti7_agree //(control for attrition) c.bl_motorpct c.bl_elitpct c.bl_atlpct c.bl_ntoytypes c.bl_sum_hla  already included 
gl blyvar ///
	bl_sum_hle 	 	bl_sum_hla 		bl_sum_neg /// bl_nreadmats omitted for colliniarity
	bl_enumpct 		bl_soemopct 	bl_elitpct 		bl_motorpct 	bl_efpct 	bl_atlpct   //bl_idelapct omitted for collinearity


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


