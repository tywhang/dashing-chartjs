class Dashing.Chartjs extends Dashing.Widget

  polarAreaChart: (id, {labels, colors, datasets}) ->
    data = @merge labels: labels, datasets: [@merge data: datasets, @colors(colors)]
    new Chart(document.getElementById(id).getContext("2d"), { type: 'polarArea', data: data })

  pieChart: (id, {labels, colors, datasets}) ->
    data = @merge labels: labels, datasets: [@merge data: datasets, @colors(colors)]
    new Chart(document.getElementById(id).getContext("2d"), { type: 'pie', data: data })

  doughnutChart: (id, {labels, colors, datasets}) ->
    data = @merge labels: labels, datasets: [@merge data: datasets, @colors(colors)]
    new Chart(document.getElementById(id).getContext("2d"), { type: 'doughnut', data: data })

  lineChart: (id, {labels, datasets}) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(@color(d.colorName), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'line', data: data })

  barChart: (id, {labels, datasets}) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(@color(d.colorName), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'bar', data: data })

  radarChart: (id, {labels, datasets}) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(@color(d.colorName), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'radar', data: data })

  merge: (xs...) =>
    if xs?.length > 0
      @tap {}, (m) -> m[k] = v for k, v of x for x in xs

  tap: (o, fn) -> fn(o); o

  colorCode: ->
    blue: "151, 187, 205"
    cyan:  "0, 255, 255"
    darkgray: "77, 83, 96"
    gray: "148, 159, 177"
    green: "70, 191, 189"
    lightgray: "220, 220, 220"
    magenta: "255, 0, 255"
    red: "247, 70, 74"
    yellow: "253, 180, 92"

  colors: (colorNames) ->
    backgroundColor: colorNames.map (colorName) => @backgroundColor(colorName)
    borderColor: colorNames.map (colorName) => @borderColor(colorName)
    borderWidth: colorNames.map (colorName) -> 1
    pointBackgroundColor: colorNames.map (colorName) => @pointBackgroundColor(colorName)
    pointBorderColor: colorNames.map (colorName) => @pointBorderColor(colorName)
    pointHoverBackgroundColor: colorNames.map (colorName) => @pointHoverBackgroundColor(colorName)
    pointHoverBorderColor: colorNames.map (colorName) => @pointHoverBorderColor(colorName)

  color: (colorName) ->
    backgroundColor: @backgroundColor(colorName)
    borderColor: @borderColor(colorName)
    borderWidth: 1
    pointBackgroundColor: @pointBackgroundColor(colorName)
    pointBorderColor: @pointBorderColor(colorName)
    pointHoverBackgroundColor: @pointHoverBackgroundColor()
    pointHoverBorderColor: @pointBackgroundColor(colorName)

  backgroundColor: (colorName) -> "rgba(#{ @colorCode()[colorName] }, 0.2)"
  borderColor: (colorName) -> "rgba(#{ @colorCode()[colorName] }, 1)"
  pointBackgroundColor: (colorName) -> "rgba(#{ @colorCode()[colorName] }, 1)"
  pointBorderColor: (colorName) -> "rgba(#{ @colorCode()[colorName] }, 1)"
  pointHoverBackgroundColor: -> "fff"
  pointHoverBorderColor: (colorName) -> "rgba(#{ @colorCode()[colorName] }, 0.8)"

  circleColor: (colorName) ->
    backgroundColor: "rgba(#{ @colorCode()[colorName] }, 0.2)"
    borderColor: "rgba(#{ @colorCode()[colorName] }, 1)"
    borderWidth: 1
    hoverBackgroundColor: "#fff"
    hoverBorderColor: "rgba(#{ @colorCode()['blue'] },0.8)"
