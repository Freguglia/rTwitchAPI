#' Get Streams
#' Gets information about active streams.
#' @details  For multiple query entries, use one string with comma-separated entries. Example: language="pt-br,en-us". Streams are returned sorted by number of current viewers, in descending order. Across multiple pages of results, there may be duplicate or missing streams, as viewers join and leave streams.
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @param after Cursor for forward pagination: tells the server where to start fetching the next set of results, in a multi-page response.
#' @param before Cursor for backward pagination: tells the server where to start fetching the next set of results, in a multi-page response. (Do not use, not working due to API issue last checked on 27/12/2017
#' @param community_id Returns streams in a specified community ID. You can specify up to 100 IDs.
#' @param game_id Returns streams broadcasting a specified game ID. You can specify up to 100 IDs.
#' @param language 	Stream language. You can specify up to 100 languages.
#' @param type Stream type: "all", "live", "vodcast". Default: "all".
#' @param user_id Returns streams broadcast by one or more specified user IDs. You can specify up to 100 IDs.
#' @param user_login Returns streams broadcast by one or more specified user login names. You can specify up to 100 names.
#' @param dataOnly If TRUE, removes pagination element.
#' @return A list with "data" and a "pagination" cursor.
#' @export
GetStreams = function(first=20,
                      after=NULL,
                      before=NULL,
                      community_id=NULL,
                      game_id=NULL,
                      language=NULL,
                      type=NULL,
                      user_id=NULL,
                      user_login=NULL){
  
  url = 'https://api.twitch.tv/helix/streams'
  
  httr::GET(url,query = list(
              first=first,
              after=after,
              before=before,
              community_id=community_id,
              game_id=game_id,
              language=language,
              type=type,
              user_id=user_id,
              user_login=user_login)) %>% content
}