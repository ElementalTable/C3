#' Create a C3 proxy object
#'
#' @param id name of the C3 widget
#' @param session valid session object
#'
#' @return C3 proxy object
#' @export
C3ChartProxy <- function(id, session = shiny::getDefaultReactiveDomain()){

  object        <- list( id = id, session = session )
  class(object) <- "C3ChartProxy"

  return(object)
}