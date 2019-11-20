C3StackedAreaChart <- function(dataset, colors, types = NULL, groups = NULL, subchart = FALSE, axis_type = "timeseries", categories = NULL, width = NULL, height = NULL) {

  if(is.null(types)){
    types         <- list()
    types[groups] <-"bar"
  }

  # forward options using x
  x = list(
    dataset = dataset,
    colors  = colors,
    groups  = groups,
    subchart = subchart,
    axis_type = axis_type,
    categories = categories,
    types   = types
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'C3AreaChart',
    x,
    width = width,
    height = height,
    package = 'C3'
  )
}

#' Shiny bindings for C3StackedAreaChart
#'
#' Output and render functions for using C3StackedAreaChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a C3StackedAreaChart
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name C3StackedAreaChart-shiny
#'
#' @export
C3StackedAreaChartOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'C3StackedAreaChart', width, height, package = 'C3')
}

#' @rdname C3StackedAreaChart-shiny
#' @export
renderC3StackedAreaChart <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, C3StackedAreaChartOutput, env, quoted = TRUE)
}


#' Zooms an existing C3Chart from shiny
#'
#' @param chartProxy
#' @param minX date start
#' @param maxX date end
#' @return C3 proxy object
#' @export
zoomChart <- function(chartProxy, minX, maxX){
  Data <- list(id = chartProxy$id,minX = minX, maxX = maxX)

  chartProxy$session$sendCustomMessage("zoomChart", Data)

  return(chartProxy)
}

#' Sets the colors of an existing C3 chart
#'
#' @param chartProxy C3 chart proxy object
#' @param colors named list with colors for the data series in the chart
#' @return C3 proxy object
#' @export
setColors <- function(chartProxy,colors){
  Data <- list(id = chartProxy$id,colors = colors)

  chartProxy$session$sendCustomMessage("setColors", Data)

  return(chartProxy)
}



#' Set chart groups
#'
#' @param chartProxy C3 chart proxy object
#' @param groups vector containing groups used to stack the chart
#' @return C3 proxy object
#' @export
setGroups <- function(chartProxy, groups){
  Data <- list(id = chartProxy$id, groups = groups)

  chartProxy$session$sendCustomMessage("setGroups", Data)

  return(chartProxy)
}


#' Set chart types
#'
#' @param chartProxy C3 chart proxy object
#' @param message list containing data series types
#' @return C3 proxy object
#' @export
setTypes <- function(chartProxy, info){
  Data <- list(id = chartProxy$id, info = info)

  chartProxy$session$sendCustomMessage("setTypes", Data)

  return(chartProxy)
}


#' Set all chart types simulaneously
#'
#' @param chartProxy C3 chart proxy object
#' @param message list containing data series type
#' @return C3 proxy object
#' @export
transformTo <- function(chartProxy, type){
  Data <- list(id = chartProxy$id, type = type)

  chartProxy$session$sendCustomMessage("transformTo", Data)

  return(chartProxy)
}