# dashing-chartjs

###### An easy interface to use all of chartjs.org's charts.

Inspired by my own pain and suffering of trying to add a simple chart to [dashing](http://dashing.io)

## Installation
##### 1. Import Chartjs library
In `dashboards/layout.erb`, add this script tag:

`<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>`

before this script tag:

`<script type="text/javascript" src="/assets/application.js"></script>`

##### 2. Import Dashing.Chartjs Widget

Copy and paste the contents of [this file](https://raw.githubusercontent.com/tywhang/dashing-chartjs/master/dashing-chartjs.js.coffee) into: `assets/javascripts/dashing-chartjs.coffee`

Then in `assets/javascripts/application.coffee`, add `#= require dashing-chartjs` right after `#= require dashing.js` so it looks like this:

```
# dashing.js is located in the dashing framework
# It includes jquery & batman for you.
#= require dashing.js
#= require dashing-chartjs
```

##### 3. Create a your widget!
Simply inherit from `Dashing.Chartjs` (instead of Dashing.Widget)

```
class Dashing.MyCharts extends Dashing.Chartjs
```

Now you have access to all the functions!!!

## Example
###### Let's create a simple line chart!

##### 1. Add your html

<img src="http://i.imgur.com/VJDvbwV.png" width="400">



## Usage

