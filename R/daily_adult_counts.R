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

  # parse an XML response
  parsed_response <- if (XML::isXMLString(data) == FALSE) {
    stop('Error from the Server')
  }
  else {
    (XML::xmlParse(data))
  }

  # convert XML response to a dataframe
  nodeset <- XML::xpathApply(XML::xmlRoot(parsed_response), "//item")

  # Dam name f(x)

  for (i in 1:length(nodeset)) {
    if(i==1) {

    }
  }
}

# Dam name f(x)
extract_dam_name <- function(str) {
  trimws(gsub("\\(?[0-9,.]+\\)?.*", '', str))
}
