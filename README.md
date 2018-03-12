# DocNet

Analysis on a network-model of a group of doctors (nodes) and their social/professional interactions (edges) over a period of time in 4 cities in the US. We attempt to use a varitety of methods from network theory to come to conclusions about how this group performed and behaved and run some very interesting simulations.

<a href="https://imgur.com/Z87W5VU"><img src="https://i.imgur.com/Z87W5VU.png" title="source: imgur.com"/></a>

## Summary of abilities ##

- Demonstrates basic modelling of systems by networks for Data Science
- Covers the implementation of community detection, centrality analyis and compnent/cluster detection in r
- Shows how to use such methods to draw conclusions from a network
- Demonstrates how to simulate the spread of information as a disease spreading through a network

## Requirements and Installation ##

The entire project is done in R, can be found <a href="https://www.r-project.org/about.html">here.</a>

Its best to use RStudio in my opinion as an IDE for R, it simply makes most tasks pretty easy and is the most popular IDE for R to the best of my knowledge. Available <a href="https://www.rstudio.com/">here.</a>

And to generate the HTML files from the RMD, you'll need the Knitr library, documentation available <a href="https://cran.r-project.org/web/packages/knitr/index.html">here.</a> 
Now the method I used to make use of the external R files relies on the ```source()``` function. If you really dont want to use this, then you can achieve the same thing via the ```read_chunk()``` function. If you want to knit the files this way, you may have to make small changes to the 5 .R files included. Simply add:

- ```@knitr InfectedBetweennessNodes```
- ```@knitr InfectedJournalReaders``` 
- ```@knitr InfectedRandomNodes``` 
- ```@knitr SimulateEpidemic``` 
- ```@knitr CompSize-NodeRemoval```

to the top of each file respectively. It should be fine to work then, and if not, refer to <a href="http://zevross.com/blog/2014/07/09/making-use-of-external-r-code-in-knitr-and-r-markdown/">this</a> site for information on how to use external .R files with knitr. 

## Usage ## 

### EDA ###

### Community detection ###

### Giant Component Analysis ###

<a href="https://imgur.com/cAroCly"><img src="https://i.imgur.com/cAroCly.png" title="source: imgur.com"/></a>

### Centrality and distruption ###

<a href="https://imgur.com/6kRUo4W"><img src="https://i.imgur.com/6kRUo4W.png" title="source: imgur.com"/></a>

<a href="https://imgur.com/mCum2bq"><img src="https://i.imgur.com/mCum2bq.png" title="source: imgur.com"/></a>

### Simulating information spread ###

<a href="https://imgur.com/8V6IBAD"><img src="https://i.imgur.com/8V6IBAD.png" title="source: imgur.com"/></a>

### Conclusions ###

<a href="https://imgur.com/LBoPQDb"><img src="https://i.imgur.com/LBoPQDb.png" title="source: imgur.com"/></a>

## Contribution ## 

Feel free to use the results or code for your own investigations, and if you want to make improvements or corrections then don't hesitate to let me know! Network theory and its applications are relatively new in mathematics so there is a lot to be done!

## Credits ##

Dr. C. Colijn - Data-set and coursework idea itself was given to us as part of the M34A50 module at Imperial College London, lectured by Dr. Colijn.

## License ##

MIT license, feel free to use and develop for your own investigations!

