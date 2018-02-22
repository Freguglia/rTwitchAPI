#' Get Clip
#' Gets information about clip.
#' @param id ID of the clip being queried. Limit 1.
#' @return A list with clip information.
#' @export

get_clip = function(id){
  
  if(!provided_client_id()){}
  
  url = 'https://api.twitch.tv/helix/clips'
  
  o <- httr::GET(url,query = list(
              id = id)) %>% content
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(max(o$data %>% length)<1) stop("No results for this query parameters.")
  o$data %>% transpose %>% simplify_all
}