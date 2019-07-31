#' @export
#' @references https://dev.twitch.tv/docs/v5/reference/streams/#get-streams-summary
get_summary <- function(game = character(0)){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/kraken/streams/summary'
  
  o <- GET(url,
           query = query_list(
            game = game)) %>% content()
  
  return(o[1:2])
}