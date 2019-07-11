# rTwitchAPI
A Twitch API wrapper for R language.

## Introduction
rTwitchAPI allows you to make calls to the API of the popular streaming website twitch.tv with very simple R functions. It uses [httr](https://cran.r-project.org/web/packages/httr/index.html) to make requests and packages like [dplyr](https://cran.r-project.org/web/packages/tidyverse/index.html) and [purrr](https://cran.r-project.org/web/packages/purrr/index.html) are used to process responses into comprehensive R data frame structures. Currently, only functions to collect data are implemented.

## Authentication
As most API's, Twitch API requires authentication for some types of calls, in the form of a **Client-ID** and/or an **Oauth token**. Use the `twitch_auth()` function to set your Client-ID. For more information access [this link](https://dev.twitch.tv/dashboard/apps/create) and see the function documentation. At the moment, none of the implemented functions require an Oauth token.

## Usage

Examples to be added.

## Contributing

This package is still under construction and functionalities are still being implemented. If you have any suggestions, found a bug or have any kind of question, feel free to file an issue.
