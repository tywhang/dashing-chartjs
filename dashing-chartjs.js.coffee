class Dashing.Chartjs extends Dashing.Widget

  polarAreaChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'polarArea', data: data })

  pieChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'pie', data: data })

  doughnutChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'doughnut', data: data })

  lineChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this.color(d.colorName), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'line', data: data })

  barChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d"), { type: 'bar', data: data })

  radarChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this.color(d.colorName), label: d.label, data: d.data)
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

  color: (colorName) ->
    backgroundColor: "rgba(#{ @colorCode()[colorName] }, 0.2)"
    borderColor: "rgba(#{ @colorCode()[colorName] }, 1)"
    pointBackgroundColor: "rgba(#{ @colorCode()[colorName] }, 1)"
    pointStrokeColor: "#fff"
    pointHoverBackgroundColor: "#fff"
    pointHoverBorderColor: "rgba(#{ @colorCode()['blue'] },0.8)"

  circleColor: (colorName) ->
    color: "rgba(#{ @colorCode()[colorName] }, 1)"
    highlight: "rgba(#{ @colorCode()[colorName] }, 0.8)"
