# Overlapping bar graph by category

The graph is useful in showing the distribution of similar categorical variable (e.g. education status of mother vs father) by two groups, such as treatment/comparison.

## Code explanation

For details, please refer to [do.do](https://github.com/saoriiwamoto/Codes/blob/master/bar%20graph/side_by_side_overlapping_bar/do.do) for details 

### Code lines 

Load dataset

```
cd "{directory}"
use "data.dta"
```

Using categorical variables, create a bar graph by treatment status to place side by side. (Graph 1)

```
tw (hist momeduc_highest if treatment==1, freq lcolor(gs12) fcolor(gs12)) (hist momeduc_highest if treat==0, freq fcolor(orange%40) lcolor(orange%40)), legend(off) ytitle("Frequency") xtitle("Gray: Treatment, Orange: Control") ///
	title(Mother's education) xlab(1(1)4 , nogrid notick labsize(small) ) graphregion(color(white)) bgcolor(white) ylab(0(10)70) ///
	name(momed)
```

Using categorical variables, create a bar graph by treatment status to place side by side. (Graph 2)

```
tw (hist dadeduc_highest if treat==1, freq lcolor(gs12) fcolor(gs12)) (hist dadeduc_highest if treat==0, freq fcolor(orange%40) lcolor(orange%40)), legend(off) xtitle("Gray: Treatment, Orange: Control") ytitle("") ///
	title(Father's education) xlab(1(1)4 , nogrid notick labsize(small) ) graphregion(color(white)) bgcolor(white) ylab(0(10)70) ///
	name(daded) //
```

combine graphs into one graph

```
graph combine momed daded, ycommon xcommon com scheme(s1mono)
```

export graph

```
graph export "figure.png", replace
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/TBD) for details on our code of conduct, and the process for submitting pull requests to us.

## Graph example: 
![alt text](https://github.com/saoriiwamoto/Codes/blob/master/bar%20graph/side_by_side_overlapping_bar/figure.png "overlapping side-by-side bar graph")

## Authors

* **Saori Iwamoto** - *Initial work* - [SCUS]

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

