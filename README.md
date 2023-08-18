# navergmail

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/navergmail)](https://CRAN.R-project.org/package=navergmail)
[![R-CMD-check](https://github.com/seokhoonj/navergmail/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/seokhoonj/navergmail/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Prerequisite

1.  Naver mail

-   프로필 수정 \> 보안설정 \> 2단계 인증 \> 애플리케이션 비밀번호 생성
-   비밀번호 생성 후 `create_naver_smtp_creds("*user_naver_mail_address*")`함수 실행
-   비밀번호 입력

2.  Gmail

-   Google Account \> Security \> 2-Step Verification \> Generate App Password
-   Run `create_gmail_smtp_creds("*user_gmail_address*")` after generating app password
-   Enter password

## Installation

``` r
# install dev version
devtools::install_github("seokhoonj/navergmail")
```

## Examples

``` r
library(navergmail)

# create_naver_smtp_creds("_user_naver_mail_address_")
naver_send(msg = "FYI", to = "*user_naver_mail_address*")

# create_gmail_smtp_creds("_user_gmail_address")
gmail_send(msg = "FYI", to = "*user_gmail_address*")
```
