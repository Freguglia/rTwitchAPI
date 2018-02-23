#' Get Users
#' Gets information about one or more specified Twitch users. Users are identified by optional user IDs and/or login name. If neither a user ID nor a login name is specified, the user is looked up by Bearer token.
#' @param user_id User ID. Multiple user IDs can be specified. Limit: 100.
#' @param user_login User login name. Multiple login names can be specified. Limit: 100.
#' @return A list with clip information.
#' @export

get_users = function(user_id=NULL,
                     user_login=NULL){
  
  if(!provided_client_id()){}
  
  url = 'https://api.twitch.tv/helix/users'
  
  o <- httr::content(
    httr::GET(url,query = query_list(
      id = user_id,
      login = user_login)))
  if(!is.null(o$error)) stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  dplyr::tbl_df(purrr::simplify_all(purrr::transpose(o$data)))
}