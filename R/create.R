##' Create naver smtp credentials
##'
##' @param user A string specifying naver mail address
##' @param format A string value specifying credentials format key or file
##' @param overwrite A boolean value specifying overwrite or not
##' @export
create_naver_smtp_creds <- function(user, format = c("key", "file"), overwrite = FALSE) {
  if (!grepl("@naver.com$", user))
    stop("Not a naver mail format")
  format <- match.arg(format)
  if (format == "key") {
    if (keyring::keyring_is_locked())
      keyring::keyring_unlock()
    blastula::create_smtp_creds_key(
      id = "naver",
      user = user,
      host = "smtp.naver.com",
      port = 587,
      use_ssl = TRUE,
      overwrite = overwrite
    )
  } else {
    stop("A credential file is not supported for naver mail.")
  }
}

##' Create gmail smtp credentials
##'
##' @param user A string specifying gmail address
##' @param format A string value specifying credentials format key or file
##' @param overwrite A boolean value specifying overwrite or not only for key
##' @export
create_gmail_smtp_creds <- function(user, format = c("key", "file"), overwrite = FALSE) {
  if (!grepl("@gmail.com$", user))
    stop("Not a gmail format")
  format <- match.arg(format)
  if (format == "key") {
    if (keyring::keyring_is_locked())
      keyring::keyring_unlock()
    blastula::create_smtp_creds_key(
      id = "gmail",
      user = user,
      host = "smtp.gmail.com",
      port = 587,
      use_ssl = TRUE,
      overwrite = overwrite
    )
  } else {
    blastula::create_smtp_creds_file(
      file = "gmail_file",
      user = user,
      host = "smtp.gmail.com",
      port = 587,
      use_ssl = TRUE,
      provider = "gmail"
    )
  }
}

##' View credential keys
##'
##' @export
view_creds_keys <- blastula::view_credential_keys

##' Delete credential key
##'
##' @param id A string specifying id
##' @export
delete_creds_key <- function(id) blastula::delete_credential_key(id)

##' Delete all credential keys
##'
##' @export
delete_all_creds_keys <- blastula::delete_all_credential_keys
