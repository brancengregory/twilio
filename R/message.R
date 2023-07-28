new_tw_message <- function(
  body = NULL,
  num_segments = NULL,
  direction = NULL,
  from = NULL,
  to = NULL,
  date_updated = NULL,
  price = NULL,
  error_message = NULL,
  uri = NULL,
  account_sid = NULL,
  num_media = NULL,
  status = NULL,
  messaging_service_sid = NULL,
  sid = NULL,
  date_sent = NULL,
  date_created = NULL,
  error_code = NULL,
  price_unit = NULL,
  api_version = NULL,
  subresource_uris = NULL,
  ...
) {
  structure(
    list(
      body = body,
      numSegments = num_segments,
      direction = direction,
      from = from,
      to = to,
      dateUpdated = date_updated,
      price = price,
      errorMessage = error_message,
      uri = uri,
      accountSid = account_sid,
      numMedia = num_media,
      status = status,
      messagingServiceSid = messaging_service_sid,
      sid = sid,
      dateSent = date_sent,
      dateCreated = date_created,
      errorCode = error_code,
      priceUnit = price_unit,
      apiVersion = api_version,
      subresourceUris = subresource_uris
    ),
    class = "tw_message"
  )
}

#' @export
tw_message <- function(...) {
  new_tw_message(...)
}

#' @export
print.tw_message <- function(x, ...) {
  cat(
    "From: ", x$from, "\n",
    "To: ", x$to, "\n",
    "Body: ", x$body, "\n",
    "Status: ", x$status, sep = ""
  )

  invisible(x)
}


tw_send <- function(obj, ..., sid = get_sid(), token = get_token()) {
  UseMethod("tw_send")
}

#' @export
tw_send.tw_message <- function(
  obj,
  ...,
  sid = get_sid(),
  token = get_token(),
  .dry_run = FALSE
) {
  res <- tw_request(
    path = paste0("Accounts/", sid, "/Messages"),
    method = "POST",
    Body = obj$body,
    To = obj$to,
    From = obj$from,
    .dry_run = .dry_run
  )

  return(res)
}