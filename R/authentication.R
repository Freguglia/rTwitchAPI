#' Authenctication
#' Sets up your Client-ID.
#' @param clientID your client-ID
#' @export

twitch_auth = function(client_id){
  httr::add_headers('Client-ID' = client_id) %>% httr::set_config()
}

#' Reset Authenctication
#' Forgets Client-ID.
#' @export

twitch_auth_forget = function(){
  httr::reset_config()
}