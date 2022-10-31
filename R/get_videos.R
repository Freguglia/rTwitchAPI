#' Get Videos
#' Gets video information by video ID, user ID or game ID
#' @param video_id Returns streams broadcast by one or more specified video IDs. You can specify up to 100 IDs.
#' @param user_id Returns streams broadcast by one or more specified user IDs. You can specify up to 100 IDs.
#' @param game_id Returns streams broadcasting a specified game ID. You can specify up to 100 IDs.
#' @param first Maximum number of objects to return. Maximum: 100. Default: 20.
#' @return A data frame with information about the selected video ids/names.
#' @export
#' @references https://dev.twitch.tv/docs/api/reference#get-videos
#' @importFrom purrr compact
get_videos <- function(video_id=NULL,
                       user_id=NULL,
                       game_id=NULL,
                       first=20){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/videos'
  
  o <- GET(url,
           query = query_list(
             video_id = video_id,
             user_id = user_id,
             game_id = game_id,
             first=2)) %>% content()
  
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o <- o$data %>% transpose() %>% simplify_all() %>% 
    # remove NULL vectors
    compact() %>% 
    dplyr::as_tibble()
  
  return(o)
}
