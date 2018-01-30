#' Base HTTP Client functionality
#'
#' \href{https://github.com/ropensci/seaaroundus/blob/682e7d8056e80160e14a25a3e94fbcffb650ed5c/R/helpers.R}{Pattern inspired by Scott Chamberlin at ROpenSci}
#'
#' \dontrun{
#' callapi(path, args, ...)
#' }
#'
#' \dontrun{
#' postapi(path, body, ...)
#' }

# get the base URL of the API
apibaseurl <- function() "http://www.fpc.org/"

# call API with GET and return data
callapi <- function(path, args = list(), ...) {
  conn <- crul::HttpClient$new(
    url = apibaseurl(),
    headers = list(`X-Request-Source` = "r"),
    opts = list(followredirects = TRUE, ...)
  )
  resp <- conn$get(path = path, query = args)
  resp$raise_for_status()
  resp$parse()
}

# call API with POST and return data
postapi <- function(path, body, ...) {
  conn <- crul::HttpClient$new(
    url = apibaseurl(),
    headers = list(`X-Request-Source` = "r"),
    opts = list(...)
  )
  resp <- conn$post(path = path, body = body)
  resp$raise_for_status()
  resp$parse
}
