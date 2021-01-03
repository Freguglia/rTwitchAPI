#' Get Streams
#' Gets information about active streams.
#' @details  Streams are returned sorted by number of current viewers, in descending order. Across multiple pages of results, there may be duplicate or missing streams, as viewers join and leave streams.
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @param after Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @param before Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. (Do not use, not working due to API issue last checked on 27/12/2017
#' @param community_id Returns streams in a specified community ID. You can specify up to 100 IDs.
#' @param game_id Returns streams broadcasting a specified game ID. You can specify up to 100 IDs.
#' @param language 	Stream language. You can specify up to 100 languages.
#' @param type Stream type: "all", "live", "vodcast". Default: "all".
#' @param user_id Returns streams broadcast by one or more specified user IDs. You can specify up to 100 IDs.
#' @param user_login Returns streams broadcast by one or more specified user login names. You can specify up to 100 names.
#' @return A list with "data" (a data frame) and a "pagination" cursor.
#' @export
#' @references https://dev.twitch.tv/docs/api/reference/#get-streams
#' @details Because the query only returns up to 100 elements, you need to use the pagination parameters if you need more than 100 results. For example, if you want the first 150 streams, you need to query with \code{first=100} and call it again with \code{first=50} and \code{pagination=X}, where \code{X} is the pagination marker returned in the first call. 
get_streams <- function(first=20,
                        after=NULL,
                        before=NULL,
                        community_id=NULL,
                        game_id=NULL,
                        language=NULL,
                        type=NULL,
                        user_id=NULL,
                        user_login=NULL){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/streams'
  
  o <- GET(url,
           query = query_list(
             first=first,
             after=after,
             before=before,
             community_id=community_id,
             game_id=game_id,
             language=language,
             type=type,
             user_id=user_id,
             user_login=user_login)) %>% content()
  
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o$data <- o$data %>% transpose() %>% simplify_all() %>% dplyr::as_tibble()
  
  return(o)
}