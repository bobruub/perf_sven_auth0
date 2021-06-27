# perf_sven_auth0
perf_sven_auth0
## overview

auth0 Stub for MFA

## Supported Functions

| Function        | Triggered By           | Response Delay  |
| ------------- |:-------------:| -----:|
| Connectivity      | URL contains **showme** | 50 ms |
| default | no matches - returns 404 not found      |   50 ms |
|01_request_verification_email|/auth0/email||
|02_verify_verification_code|/auth0/verifycode||
