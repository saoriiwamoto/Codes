# CI Plot for means, by treatment

The graph is useful in comparing the means of the two categorical groups. With confidence interval, the preciseness of the similarities are easier to understand.

## Code explanation

For details, please refer to [do.do](https://github.com/saoriiwamoto/Codes/blob/master/ci%20plot%20for%20means/do.do) for details 

### Code lines 

Load dataset

```
cd "{directory}"
use "data.dta"
```

Create ci plot for one of the outcomes and store the name of the graph

```
ciplot idelapct, by(treatment) ///
name(idela)
```

Repeat the process for each of the outcomes

```
ciplot enumpct, by(treatment) ///
name(enumpct)

ciplot soemopct, by(treatment) ///
name(soemopct)

ciplot elitpct, by(treatment) ///
name(elitpct)

ciplot motorpct, by(treatment) ///
name(motorpct)
```

combine graphs into one graph

```
graph combine idela enumpct soemopct elitpct motorpct, ycommon xcommon r(1) com scheme(s1mono)
```

export graph

```
graph export "figure.png", as(png) name("Graph") replace
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/TBD) for details on our code of conduct, and the process for submitting pull requests to us.

## Graph example: 
![alt text](https://github.com/saoriiwamoto/Codes/blob/master/ci%20plot%20for%20means/figure.png "CI plot of means")

## Authors

* **Saori Iwamoto** - *Initial work* - [SCUS]

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

