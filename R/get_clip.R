#' Get Clip
#' Gets information about clip.
#' @param clip_id ID of the clip being queried. Limit 1.
#' @return A list with clip information.
#' @export
#' @references https://dev.twitch.tv/docs/api/reference/#get-clip
#' @importFrom purrr simplify_all
#' @importFrom purrr transpose
#' @importFrom httr content
#' @importFrom httr GET
#' @importFrom magrittr %>%

get_clip <- function(clip_id){
  
  if(!provided_client_id()){}
  
  url <- 'https://api.twitch.tv/helix/clips'
  
  o <- GET(url,
           query = query_list(
             id = clip_id)) %>% content()
  
  if(!is.null(o$error) && o$error=="Unauthorized") stop(o$message)
  if(length(o$data)<1) stop("No results for this query parameters.")
  
  o$data %>% transpose() %>% simplify_all()
}