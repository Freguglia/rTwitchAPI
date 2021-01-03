#' Get Top Games
#' Gets games sorted by number of current viewers on Twitch, most popular first.
#' @return A list with with "data" and a "pagination" cursor.
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @param after Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @param before Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. (Do not use, not working due to API issue last checked on 27/12/2017)
#' @export
#' @details If you need information about how pagination works, see the details of \link{get_streams}.
#' @references https://dev.twitch.tv/docs/api/reference/#get-top-games
get_top_games <- function(first=20,
                          after=NULL,
                          before=NULL){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/games/top'
  
  o <- GET(url,
              query = list(
                first=first,
                after=after,
                before=before)) %>% content()
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o$data <- o$data %>% transpose() %>% simplify_all() %>% tibble::as_tibble()
  
  return(o)
}