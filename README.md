
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

**Define your Client-ID and Client-Secret variable.**

In order to add your Client-ID and Client-Secret to your environment
file, you can use the function `edit_r_environ()` from the [`usethis`
package](https://usethis.r-lib.org/).

``` r
usethis::edit_r_environ()
```

This will open your .Renviron file in your text editor. Now, you can add
the following line to it:

``` r
TWITCH_CLIENT_ID=YOUR_CLIENT_ID
TWITCH_CLIENT_SECRET=YOUR_CLIENT_SECRET
```

Save the file and restart R for the changes to take effect.

## Example

``` r
library(rTwitchAPI)

# Setup authentication
twitch_auth()

# An example request to the streams endpoint
streams_live <- get_streams(first = 15, language = "en")
streams_live$data
#> # A tibble: 15 x 11
#>    id    user_id user_name game_id type  title viewer_count started_at language
#>    <chr> <chr>   <chr>     <chr>   <chr> <chr>        <int> <chr>      <chr>   
#>  1 1900~ 228592~ DreamHac~ 32399   live  "LIV~        60862 2020-06-0~ en      
#>  2 3857~ 7601562 Chess     743     live  "Che~        52289 2020-06-0~ en      
#>  3 3857~ 262614~ Asmongold 18122   live  "SHA~        39309 2020-06-0~ en      
#>  4 3857~ 504976~ PardonMy~ 271198  live  "DUG~        30313 2020-06-0~ en      
#>  5 3857~ 173375~ DrDisres~ 512710  live  "Gam~        30263 2020-06-0~ en      
#>  6 3857~ 231613~ LIRIK     516867  live  "HAL~        23891 2020-06-0~ en      
#>  7 3857~ 444455~ pokimane  27471   live  "cha~        21049 2020-06-0~ en      
#>  8 1903~ 198182~ MrSavage  33214   live  "Tri~        19693 2020-06-0~ en      
#>  9 3857~ 1423946 Gernader~ 497057  live  "New~        19236 2020-06-0~ en      
#> 10 3857~ 155648~ NICKMERCS 512710  live  "MFA~        17108 2020-06-0~ en      
#> 11 3857~ 520918~ Castro_1~ 32982   live  "tox~        16638 2020-06-0~ en      
#> 12 3857~ 106013~ Pestily   491931  live  "Dro~        16546 2020-06-0~ en      
#> 13 3857~ 269911~ Hiko      516575  live  "100~        16401 2020-06-0~ en      
#> 14 3857~ 297959~ nl_Kripp  138585  live  "NEW~        15389 2020-06-0~ en      
#> 15 3857~ 514960~ loltyler1 21779   live  "oh ~        15283 2020-06-0~ en      
#> # ... with 2 more variables: thumbnail_url <chr>, tag_ids <list>
```

## Contributions

If you find anything wrong in the package, have a suggestion, comment or
request, please file an issue. Pull requests are also welcome.
