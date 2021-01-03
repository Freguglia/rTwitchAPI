#' Get Games
#' Gets game information by game ID or name.
#' @param id Game ID. At most 100 id values can be specified.
#' @param name Game name. The name must be an exact match. At most 100 name values can be specified.
#' @return A data frame with information about the selected game ids/names.
#' @export
#' @references https://dev.twitch.tv/docs/api/reference/#get-games
get_games <- function(id=NULL,
                      name=NULL){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/games'
  
  o <- GET(url,
            query = query_list(
              id = id,
              name=name)) %>% content()
  
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o <- o$data %>% transpose() %>% simplify_all() %>% tibble::as_tibble()
  
  return(o)
}