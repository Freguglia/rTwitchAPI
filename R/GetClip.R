#' Get Streams
#' Gets information about active streams.
#' @param id ID of the clip being queried. Limit 1.
#' @return A list with "data" and a "pagination" cursor.
#' @export

GetClip = function(id){
  url = 'https://api.twitch.tv/helix/clips'
  
  httr::GET(url,query = list(
              id = id)) %>% content
}