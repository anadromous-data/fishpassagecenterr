#' Get daily adult count data returned as a dataframe
#'
#' @export
#' @param species (character) filter results by only one species.
#' Defaults to NULL, which will return all species
#' @param location (character) filter results by only one location
#' Defaults to NULL, which will return all locations
#'
#'

daily_adult_counts <- function(species=NULL, location=NULL) {

  # create url path
  path <- paste("rss/rssAdultCounts.aspx")

  # call API
  data <- callapi(path)

  # parse XML response
  parsed_response <- if (XML::isXMLString(data)) {
    stop('Error from the Server')
  }
  else {
    return(XML::xmlParse(data))
  }
}



