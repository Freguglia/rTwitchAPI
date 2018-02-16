#' Get Games
#' Gets game information by game ID or name.
#' @param id Game ID. At most 100 id values can be specified.
#' @param name Game name. The name must be an exact match. At most 100 name values can be specified.
#' @return A list with "data" and a "pagination" cursor.
#' @export

GetGames = function(id=NULL,
                   name=NULL){
  url = 'https://api.twitch.tv/helix/games'
  
  httr::GET(url,
            query = list(
              id = id,
              name=name)) %>% content
}