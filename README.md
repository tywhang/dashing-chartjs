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
#### Let's create a simple line chart!

##### 1. Add your html
###### widgets/example/example.html
`<canvas id="myChart" width="400" height="300"></canvas>`

##### 2. Call the lineChart function and pass in parameters
###### widgets/example/example.coffee
```
class Dashing.Charts extends Dashing.Chartjs
  ready: ->
    @lineChart 'myChart' # The ID of your html element
      ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5"] # Horizontal labels
      [
        label: 'Number of pushups' # Text displayed when hovered
        colorName: 'blue' # Color of data
        data: [10, 39, 20, 49, 87] # Vertical points
      ]
```

##### 3. Awe at your beautiful chart
<div><img src="http://i.imgur.com/VJDvbwV.png" width="400"></div>

#### Displaying multiple data in one chart is a breeze too!
```
@lineChart 'myChart' # Horizontal labels
  ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5"]
  [{
      # First data points
      label: 'Number of pushups'
      colorName: 'blue'
      data: [10, 39, 20, 49, 87]
    }, {
      # Second data points
      label: 'Number of pullups'
      colorName: 'red'
      data: [3, 2, 10, 12, 20]
    }
  ]
```
<div><img src="http://i.imgur.com/mWlAndA.png" width="400"></div>


## Usage

