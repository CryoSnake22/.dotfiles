# Plotly

**File:** `/Users/charlo/dev/Research/DiffusionExploration/README.md`

## Notes

Where Matplotlib has `plt.subplots()` in plotly we do

```python
import plotly.graph_object as go
from plotly.subplots import make_subplots

fig = make_subplots(1,2, subplot_titles=["title 1", "title 2"])
```

In order to plot things you do

```python
fig.add_trace(
	go.scatter(
		x=X,
		y=Y,
		line=dict(color="red", dash="dash"), # line styling
		showlegend = False, # wether to show the legend for this trace
		name = "name", # when you hover the path, what shows up
		opacity = 0.5,
	)
	1, # row number
	1, # col number
)
```

_Error Markers_

```python
fig.add_trace(
	go.scatter(
		mode = "markers", # by default everything is lines or lines+markers this just keeps points
		x=X,
		y=Y,
		error_y=dict(type="data", array=errors, visible = True), # the array must be of same dimension as y
		opacity=0.5,
	)
)
```
