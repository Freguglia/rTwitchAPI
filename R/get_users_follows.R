#' Get Users Follows
#' @param to_id User ID. The request returns information about users who are following the to_id user.
#' @param from_id User ID. The request returns information about users who are being followed by the from_id user.
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @param after Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @param before Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @return A list with clip information.
#' @export
#' @references https://dev.twitch.tv/docs/api/reference/#get-users-follows

get_users_follows = function(from_id=NULL,
                     to_id=NULL,
                     first = 20,
                     after = NULL,
                     before = NULL){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/users/follows'
  
  o <- GET(url,query = query_list(
      to_id = to_id,
      from_id = from_id,
      first = first,
      after = after,
      before = before)) %>% content()
  
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o$data <- o$data %>% transpose() %>% simplify_all() %>% tibble::as_tibble()
  
  return(o)
}