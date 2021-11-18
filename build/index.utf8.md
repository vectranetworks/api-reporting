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

preserve7ab42aef02f6c3ce

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
