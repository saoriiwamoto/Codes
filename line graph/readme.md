# Line plot graph

The graph is useful for visualizing the predicted mean difference in scores by age for two different groups 

## Code

For details, please refer to [do.do](https://github.com/saoriiwamoto/Codes/blob/master/line%20graph/do.do) for details 

### Code

Load dataset

```
cd "{directory}"
use "data.dta"
```

Create locally weighted regression graph

```
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
```

export graph

```
graph export "figure.png", as(png) replace
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/TBD) for details on our code of conduct, and the process for submitting pull requests to us.

## Graph example: 
![alt text](https://github.com/saoriiwamoto/Codes/blob/master/line%20graph/figure.png "line graph")

## Authors

* **Saori Iwamoto** - *Initial work* - [SCUS]

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

