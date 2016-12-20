# Scaling by Two: Doubling and Halving


In this section we introduce three more glyph commands: zoom in, zoom out, and set scaleFactor to two. ScaleFactor is another global variable that we use in the whole geometron system.  It does exactly what it sounds like: sets the factor by which we scale up and down.  Unlike in many systems on computers, zooming up and down in scale is always done in discrete jumps, and there are several distinct ways this is done depending on the geometry we are working with.  For simple square geometry as well as triangular and a lot of other work, the factor of two is by far the most important.  

The glyph to denote the concept of factors of two is just two squares stacked on top of each other in the 