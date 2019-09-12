
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rTwitchAPI

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Freguglia/rTwitchAPI.svg?branch=master)](https://travis-ci.org/Freguglia/rTwitchAPI)
<!-- badges: end -->

`rTwitchAPI` allows you to make calls to the
[API](https://dev.twitch.tv/docs/api/reference/) of the popular
streaming website [twitch.tv](twitch.tv) with simple R functions,
allowing users to interact with the API even without great understaing
of REST APIs and http. Since R is primarily used for statistical
analysis, currently, the package only provides access to endpoints that
return data, for example, [`GET
https://api.twitch.tv/helix/streams`](https://dev.twitch.tv/docs/api/reference/#get-streams).
Users who might need other functionalities are very likely to also need
integration with tools from other programming languages and/or have
enough background to directly implement the call with
[`httr`](https://github.com/r-lib/httr).

In summary, `rTwitchAPI` removes the burden of writing the calls to
specific endpoints and proccess results, making code cleaner, simpler
and more accessible. It is just an interface to access the API and is in
no way related to Twitch or the Twitch API. As stated in the [official
documentation](https://dev.twitch.tv/docs/), by using it, you agree to
[Twitch Developer Services
Agreement](https://www.twitch.tv/p/legal/developer-agreement/).

## Installation

<!---You can install the released version of rTwitchAPI from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rTwitchAPI")
```-->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Freguglia/rTwitchAPI")
```

## Authentication

As most API’s, Twitch API requires authentication for some types of
calls, in the form of a **Client-ID** and/or an **Oauth token**. You can
setup your Client-ID with the `twitch_auth()` function. For more
information access on Client-ID and how to register your app, read [this
link](https://dev.twitch.tv/dashboard/apps/create).

## Example

``` r
library(rTwitchAPI)
# Reading the Client-ID from a file for the example, but you can assign directly
# my_client_id <- "YOUR_CLIENT_ID"
my_client_id <- readChar("~/.twitch_auth", 30)

# Setup authentication
twitch_auth(my_client_id)

# An example request to the streams endpoint
streams_live <- get_streams(first = 15, language = "en")
streams_live$data
#> # A tibble: 15 x 11
#>    id    user_id user_name game_id type  title viewer_count started_at
#>    <chr> <chr>   <chr>     <chr>   <chr> <chr>        <int> <chr>     
#>  1 3563… 262614… Asmongold 18122   live  ONYX…        77381 2019-09-1…
#>  2 3563… 173375… DrDisres… 512710  live  Mode…        33365 2019-09-1…
#>  3 3563… 266102… CohhCarn… 491318  live  Bord…        21189 2019-09-1…
#>  4 3563… 710929… xQcOW     509658  live  xqcT…        19432 2019-09-1…
#>  5 3563… 725508… ROSHTEIN  498566  live  "🔥 G…        17731 2019-09-1…
#>  6 3563… 409728… AdmiralB… 491318  live  I lo…        17299 2019-09-1…
#>  7 3563… 155648… NICKMERCS 33214   live  2v2 …        16333 2019-09-1…
#>  8 3563… 444246… NickEh30  33214   live  Frid…        13876 2019-09-1…
#>  9 3563… 367690… TimTheTa… 18122   live  hey …        13570 2019-09-1…
#> 10 3563… 10406   Karma     512710  live  The …        11134 2019-09-1…
#> 11 3563… 609784… dogdog    513143  live  Dona…        10572 2019-09-1…
#> 12 3563… 444455… pokimane  509658  live  we a…         9846 2019-09-1…
#> 13 3563… 121203… Yassuo    21779   live  "Rai…         9527 2019-09-1…
#> 14 3563… 360292… Riot Gam… 21779   live  EU M…         8916 2019-09-1…
#> 15 3563… 250094… LexVeldh… 488190  live  "$52…         7909 2019-09-1…
#> # … with 3 more variables: language <chr>, thumbnail_url <chr>,
#> #   tag_ids <list>
```

## Contributions

If you find anything wrong in the package, have a suggestion, comment or
request, please file an issue. Pull requests are also welcome.
