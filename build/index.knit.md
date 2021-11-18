---
title: "Visibility Dashboard"
output:
  html_document:
    css: "style.css"
    includes:
      before_body: "navbar.html"
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding, output_dir = "..") })
---







## Host Metrics {.tabset}

### Host Severity

<!--html_preserve--><div id="htmlwidget-ce82ee2c5f004dddbd34" style="width:100%;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-ce82ee2c5f004dddbd34">{"x":{"data":[{"x":[1634515200,1634774400,1637193600],"y":[81,51,103],"text":["date: 2021-10-18<br />Count:  81<br />Host Severity: low","date: 2021-10-21<br />Count:  51<br />Host Severity: low","date: 2021-11-18<br />Count: 103<br />Host Severity: low"],"type":"scatter","mode":"lines+markers","line":{"width":1.88976377952756,"color":"rgba(62,104,118,1)","dash":"solid"},"hoveron":"points","name":"low","legendgroup":"low","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(62,104,118,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(62,104,118,1)"}},"frame":null},{"x":[1634515200,1634774400,1637193600],"y":[9,159,4],"text":["date: 2021-10-18<br />Count:   9<br />Host Severity: medium","date: 2021-10-21<br />Count: 159<br />Host Severity: medium","date: 2021-11-18<br />Count:   4<br />Host Severity: medium"],"type":"scatter","mode":"lines+markers","line":{"width":1.88976377952756,"color":"rgba(255,177,49,1)","dash":"solid"},"hoveron":"points","name":"medium","legendgroup":"medium","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(255,177,49,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(255,177,49,1)"}},"frame":null},{"x":[1634515200,1634774400,1637193600],"y":[0,8,0],"text":["date: 2021-10-18<br />Count:   0<br />Host Severity: high","date: 2021-10-21<br />Count:   8<br />Host Severity: high","date: 2021-11-18<br />Count:   0<br />Host Severity: high"],"type":"scatter","mode":"lines+markers","line":{"width":1.88976377952756,"color":"rgba(255,89,30,1)","dash":"solid"},"hoveron":"points","name":"high","legendgroup":"high","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(255,89,30,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(255,89,30,1)"}},"frame":null},{"x":[1634515200,1634774400,1637193600],"y":[0,0,0],"text":["date: 2021-10-18<br />Count:   0<br />Host Severity: critical","date: 2021-10-21<br />Count:   0<br />Host Severity: critical","date: 2021-11-18<br />Count:   0<br />Host Severity: critical"],"type":"scatter","mode":"lines+markers","line":{"width":1.88976377952756,"color":"rgba(222,24,41,1)","dash":"solid"},"hoveron":"points","name":"critical","legendgroup":"critical","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","marker":{"autocolorscale":false,"color":"rgba(222,24,41,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(222,24,41,1)"}},"frame":null}],"layout":{"margin":{"t":26.2283105022831,"r":7.30593607305936,"b":40.1826484018265,"l":43.1050228310502},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1634381280,1637327520],"tickmode":"array","ticktext":["Oct 18","Oct 25","Nov 01","Nov 08","Nov 15"],"tickvals":[1634515200,1635120000,1635724800,1636329600,1636934400],"categoryorder":"array","categoryarray":["Oct 18","Oct 25","Nov 01","Nov 08","Nov 15"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"date","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-7.95,166.95],"tickmode":"array","ticktext":["0","50","100","150"],"tickvals":[0,50,100,150],"categoryorder":"array","categoryarray":["0","50","100","150"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"Count","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.96751968503937},"annotations":[{"text":"Host Severity","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"861bc02e1":{"x":{},"y":{},"colour":{},"type":"scatter"},"83219297e":{"x":{},"y":{},"colour":{}}},"cur_data":"861bc02e1","visdat":{"861bc02e1":["function (y) ","x"],"83219297e":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Workload Reduction {.tabset}

Here you can see the overall workload reduction Cognito has produced for you. Metrics are filterable for different time periods.




### This Month

<div style="height:90px;">

<div>
  <div id="w-label">Avg. Hosts with Detections</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Low Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Medium Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. High Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Critical Hosts</div>
</div>
<div>
  <div id="w-label"> <a id="stat"> 107 </a> </div>
  <div id="w-arrow"> ⟶ </div>
  <div id="w-label"> <a id="stat"> (103, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 4, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 0, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 0) </a> </div>
</div>

</div>

***

### Last Month

<div style="height:90px;">

<div>
  <div id="w-label">Avg. Hosts with Detections</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Low Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Medium Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. High Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Critical Hosts</div>
</div>
<div>
  <div id="w-label"> <a id="stat"> 154 </a> </div>
  <div id="w-arrow"> ⟶ </div>
  <div id="w-label"> <a id="stat"> (66, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 84, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 4, </a> </div>
  <div id="w-arrow" style="color:white;" > ⟶ </div>
  <div id="w-label"> <a id="stat"> 0) </a> </div>
</div>

</div>

***

### This Quarter

<div style="height:90px;">

<div>
  <div id="w-label">Avg. Hosts with Detections</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Low Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Medium Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. High Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Critical Hosts</div>
</div>
<div>
  <div id="w-label"> <a id="stat"> 138.3 </a> </div>
  <div id="w-arrow"> ⟶ </div>
  <div id="w-label"> <a id="stat"> (78.3, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 57.3, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> 2.7, </a> </div>
  <div id="w-arrow" style="color:white;" > ⟶ </div>
  <div id="w-label"> <a id="stat"> 0) </a> </div>
</div>

</div>

***

### Last Quarter

<div style="height:90px;">

<div>
  <div id="w-label">Avg. Hosts with Detections</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Low Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Medium Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. High Hosts</div>
  <div id="w-arrow"> ⠀⠀</div>
  <div id="w-label">Avg. Critical Hosts</div>
</div>
<div>
  <div id="w-label"> <a id="stat"> NaN </a> </div>
  <div id="w-arrow"> ⟶ </div>
  <div id="w-label"> <a id="stat"> (NaN, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> NaN, </a> </div>
  <div id="w-arrow" style="color:white;"> ⟶ </div>
  <div id="w-label"> <a id="stat"> NaN, </a> </div>
  <div id="w-arrow" style="color:white;" > ⟶ </div>
  <div id="w-label"> <a id="stat"> NaN) </a> </div>
</div>

</div>

***

## Data

Here you can see current metrics for hosts. If you'd like to look at how these values have changed historically, see the download section below.



## Download

Below you can download (a) current host metrics or (b) historical host metrics.

If you'd like to see the most recent metrics for hosts, click the `Download Current` button.

For the full data, i.e. how these metrics change over time, then check out `Download Historical`. This csv includes historical changes. For example: if host id #1 saw its severity at 100 on Jan 1, and then 99 on Jan 2, then `historical_hosts.csv` will show 2 rows for host id #1: 1/1 with a severity of 100 and 1/2 with 99.

<p>

<a id="button" download="current_hosts.csv" href="../data/current_hosts.csv">Download Current</a><a id="button" download="historical_hosts.csv" href="../logs/hosts.csv">Download Historical</a>

</p>
