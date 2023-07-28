tw_request <- function(
  path,
  ...,
  sid = get_sid(),
  token = get_token(),
  method = "GET",
  parse = TRUE,
  base_url = base_url,
  .dry_run = FALSE
) {
  req <- httr2::request(
    base_url = "https://api.twilio.com/2010-04-01/"
  ) |>
    httr2::req_url_path_append(
      paste0(path, ".json")
    ) |>
    httr2::req_method(method) |>
    httr2::req_auth_basic(
      username = sid,
      password = token
    ) |>
    httr2::req_url_query(
      ...
    )

  if (.dry_run) {
    return(req)
  }

  res <- httr2::req_perform(req)

  if (parse) {
    res <- httr2::resp_body_json(
      res,
      check_type = TRUE,
      simplifyVector = TRUE
    )
  }

  return(res)
}