#' Authentication
#' 
#' Sets up your Client-ID or forgets it.
#' @name authentication
#' @param client_id your client-ID.
#' @param client_secret your client-secret.
#' @references https://dev.twitch.tv/docs/authentication/
#' @details If, for some reason, you need to change what client-ID you're making calls with, use use \code{\link{twitch_auth_forget}} and then reuse this function to set the new client-ID. Check the link in references to understand what is a client-ID, how it works and how to get one.
#' @export
twitch_auth = function(){
  
  client_id <- Sys.getenv("TWITCH_CLIENT_ID")
  client_secret <- Sys.getenv("TWITCH_CLIENT_SECRET")
  
  if (client_id == "" | client_secret == ""){
    stop("Please add TWITCH_CLIENT_ID and TWITCH_CLIENT_SECRET to your environment variables (see documentation for reference).")
  }
  
  o <- httr::POST("https://id.twitch.tv/oauth2/token", 
            query = query_list(client_id=client_id, 
                               client_secret = client_secret,
                               grant_type="client_credentials")) %>% content()
  
  httr::set_config(httr::add_headers('Client-ID' = client_id, Authorization=glue::glue("Bearer {o$access_token}")))
}

#' @rdname authentication
#' @export
twitch_auth_forget = function(){
  httr::reset_config()
}