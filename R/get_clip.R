#' Get Clip
#' Gets information about clip.
#' @param clip_id ID of the clip being queried. Limit 1.
#' @return A list with clip information.
#' @export

get_clip = function(clip_id){
  
  if(!provided_client_id()){}
  
  url = 'https://api.twitch.tv/helix/clips'
  
  o <- httr::content(httr::GET(url,query = query_list(
              id = clip_id)))
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  purrr::simplify_all(purrr::transpose(o$data))
}