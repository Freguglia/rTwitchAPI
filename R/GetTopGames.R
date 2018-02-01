#' Get Top Games
#' Gets games sorted by number of current viewers on Twitch, most popular first.
#' @param ClientID your clientID
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @param after Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @param before Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. (Do not use, not working due to API issue last checked on 27/12/2017
#' @export
GetTopGames = function(clientID,first=20,after=NULL,before=NULL){
  url = 'https://api.twitch.tv/helix/games/top'
  
  httr::GET(url,
      httr::add_headers('Client-ID'=clientID),
      query = list(
          first=first,
          after=after,
          before=before)) %>% content
}