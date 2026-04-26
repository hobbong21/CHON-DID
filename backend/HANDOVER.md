# Backend Handover Notes

## Safe repository state

- Real credentials and tokens must not be committed.
- Use environment variables for shared environments.
- Use `src/main/resources/application-local.properties` for local-only testing if needed.

## Local testing

1. Copy `src/main/resources/application-local.properties.example` to `src/main/resources/application-local.properties`.
2. Fill in local credentials and paths.
3. Run with `SPRING_PROFILES_ACTIVE=local` if you create a local profile file, or export the required environment variables before starting the app.

## Secrets to rotate

- Database credentials
- Mail credentials
- RSA private/public key pair if still in use
- DID access token
- Encryption key

## Infrastructure dependencies

- MariaDB database
- Writable image storage folder
- DID issuer service
- SMTP service
