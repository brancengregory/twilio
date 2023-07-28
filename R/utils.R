get_sid <- function() {
  sid <- Sys.getenv("TWILIO_SID")
  if (identical(sid, "")) {
    stop("Please set environmental variable TWILIO_SID.")
  }

  return(sid)
}

get_token <- function() {
  token <- Sys.getenv("TWILIO_TOKEN")
  if (identical(token, "")) {
    stop("Please set environmental variable TWILIO_TOKEN.")
  }

  return(token)
}

get_messaging_service_sid <- function() {
  messaging_service_sid <- Sys.getenv("TWILIO_MESSAGING_SERVICE_SID")
  if (identical(messaging_service_sid, "")) {
    stop("Please set environmental variable TWILIO_MESSAGING_SERVICE_SID.")
  }

  return(messaging_service_sid)
}
