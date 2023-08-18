##' Send from naver mail
##'
##' \preformatted{
##' ## Example
##' msg <- "For your infomation."
##' naver_send(msg = msg, to = "email_address")
##' }
##'
##' @param msg A text message
##' @param to A string vector specifying email address
##' @param from A string vector specifying email address
##' @param subject A string value specifying an email subject
##' @param cc A string vector specifying email address
##' @param bcc A string vector specifying email address
##' @param attach A string vector specifying attachment file paths
##' @param creds A credentials
##' @param format A string value specifying credentials format key or file
##' @param verbose A boolean value verbose output from the internal curl send_mail() call be printed or not
##' @export
naver_send <- function(msg = "FYI", to, from, subject = NULL, cc = NULL, bcc = NULL, attach,
                       creds = NULL, format = c("key", "file"), verbose = FALSE) {
  format <- match.arg(format)
  if (missing(creds)) {
    if (format == "key") {
      creds <- blastula::creds_key(id = "naver")
    } else {
      stop("A credential file is not supported for naver mail.")
    }
  }
  if (!missing(from)) {
    if (!grepl("@naver.com$", from))
      stop("Not a naver mail format")
  } else {
    if (format == "key") {
      from <- blastula::creds_key(id = "naver")$user
    } else {
      stop("A credential file is not supported for naver mail.")
    }
  }
  if (missing(subject))
    if (!missing(attach))
      subject <- paste(basename(attach), collapse = ", ")
  msg <- gsub("^\n", "", msg)
  msg <- gsub("\n", "<br>", msg)
  date_time <- blastula::add_readable_time()
  email <- blastula::compose_email(
    body = blastula::md(paste0("<html>", msg, "</html>")),
    footer = blastula::md(date_time)
  )
  if (!missing(attach))
    for (i in seq_along(attach))
      email <- blastula::add_attachment(email, file = attach[i])
  blastula::smtp_send(
      email = email,
      to = to,
      from = from,
      subject = subject,
      cc = cc,
      bcc = bcc,
      credentials = creds,
      verbose = verbose
  ) # for subject encoding errors (like Korean)
}

##' Send from gmail
##'
##' \preformatted{
##' ## Example
##' msg <- "For your infomation."
##' gmail_send(msg = msg, to = "email_address")
##' }
##'
##' @param msg A text message
##' @param to A string vector specifying email address
##' @param from A string vector specifying email address
##' @param subject A string value specifying an email subject
##' @param cc A string vector specifying email address
##' @param bcc A string vector specifying email address
##' @param attach A string vector specifying attachment file paths
##' @param creds A credentials
##' @param format A string value specifying credentials format key or file
##' @param verbose A boolean value verbose output from the internal curl send_mail() call be printed or not
##' @export
gmail_send <- function(msg = "FYI", to, from, subject = NULL, cc = NULL, bcc = NULL, attach,
                       creds = NULL, format = c("key", "file"), verbose = FALSE) {
  format <- match.arg(format)
  if (missing(creds)) {
    if (format == "key") {
      creds <- blastula::creds_key(id = "gmail")
    } else {
      creds <- blastula::creds_file(file = "gmail_file")
    }
  }
  if (!missing(from)) {
    if (!grepl("@gmail.com$", from))
      stop("Not a gmail format")
  } else {
    if (format == "key") {
      from <- blastula::creds_key(id = "gmail")$user
    } else {
      from <- blastula::creds_file(file = "gmail_file")$user
    }
  }
  if (missing(subject))
    if (!missing(attach))
      subject <- paste(basename(attach), collapse = ", ")
  msg <- gsub("^\n", "", msg)
  msg <- gsub("\n", "<br>", msg)
  date_time <- blastula::add_readable_time()
  email <- blastula::compose_email(
    body = blastula::md(paste0("<html>", gsub("\n", "<br>", msg), "</html>")),
    footer = blastula::md(date_time)
  )
  if (!missing(attach))
    for (i in seq_along(attach))
      email <- blastula::add_attachment(email, file = attach[i])
  suppressWarnings(
    blastula::smtp_send(
      email = email,
      to = to,
      from = from,
      subject = subject,
      cc = cc,
      bcc = bcc,
      credentials = creds,
      verbose = verbose
    )
  ) # for subject encoding errors (like Korean)
}

