# navergmail

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/navergmail)](https://CRAN.R-project.org/package=navergmail) [![R-CMD-check](https://github.com/seokhoonj/navergmail/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/seokhoonj/navergmail/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Prerequisite

1.  Naver

-   네이버메일 \> 환경설정 \> POP3/SMTP, IMAP/SMTP 사용함 설정 (반드시 앱 비밀번호 생성 전 설정)
-   프로필 수정 \> 보안설정 \> 2단계 인증 \> 애플리케이션 비밀번호 생성
-   비밀번호 생성 후 `create_naver_smtp_creds("*****@naver.com")`함수 실행
-   비밀번호 입력

2.  Gmail

-   Google Account \> Security \> 2-Step Verification \> Generate App Password
-   Run `create_gmail_smtp_creds("*****@gmail.com")` after generating app password
-   Enter password

## Installation

``` r
# install dev version
devtools::install_github("seokhoonj/navergmail")
```

## Examples

### Naver

``` r
library(navergmail)

# 네이버 메일 크리덴셜 생성 (Prerequisite 참조)
create_naver_smtp_creds("*****@naver.com")

# 네이버 메일 보내기
naver_send(msg = "Hello, world", to = "*****@gmail.com")

# 파일 첨부
naver_send(msg = "FYI", to = "*****@naver.com", attach = c("...", "..."))
```

### Gmail

``` r
library(navergmail)

# generate gmail credentials (refer to Prerequisite)
create_gmail_smtp_creds("*****@gmail.com")

# send gmail
gmail_send(msg = "Hello, world", to = "*****@naver.com")

# attach files
naver_send(msg = "FYI", to = "*****@naver.com", attach = c("...", "..."))
```

### Delete credentials

``` r
# delete each credentials 
delete_creds_key(id = "*****@naver.com") 
delete_creds_key(id = "*****@gmail.com")

# delete all credentials
delete_all_creds_keys()
```
