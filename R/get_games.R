#' Get Games
#' Gets game information by game ID or name.
#' @param id Game ID. At most 100 id values can be specified.
#' @param name Game name. The name must be an exact match. At most 100 name values can be specified.
#' @return A list with "data" and a "pagination" cursor.
#' @export
get_games <- function(id=NULL,
                      name=NULL){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/games'
  
  o <- httr::GET(url,
            query = query_list(
              id = id,
              name=name)) %>% 
    content
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(max(o$data %>% length)<1) stop("No results for this query parameters.")
  o <- o$data %>% transpose %>% simplify_all %>% tbl_df
  return(o)
}