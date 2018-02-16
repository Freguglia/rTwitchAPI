#' Authenctication
#' Sets up your Client-ID.
#' @param clientID your client-ID
#' @export

twitchAuth = function(clientID){
  httr::add_headers('Client-ID' = clientID) %>% set_config()
}

#' Reset Authenctication
#' Forgets Client-ID.
#' @export

twitchAuthForget = function(clientID){
  httr::reset_config()
}