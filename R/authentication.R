#' Authentication
#' 
#' Sets up your Client-ID.
#' @param clientID your client-ID.
#' @references https://dev.twitch.tv/docs/authentication/
#' @details If, for some reason, you need to change what client-ID you're making calls with, use use \code{\link{twitch_auth_forget}} and then reuse this function to set the new client-ID. Check the link in references to understand what is a client-ID, how it works and how to get one.
#' @export

twitch_auth = function(client_id){
  httr::set_config(httr::add_headers('Client-ID' = client_id))
}

#' Reset Authenctication
#' 
#' Forgets Client-ID.
#' @details Use this to forget the client-ID previously set, then set your new client-ID with \code{\link{twitch_auth}}
#' @export

twitch_auth_forget = function(){
  httr::reset_config()
}