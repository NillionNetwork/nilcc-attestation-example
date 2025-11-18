# Attestation Verification

This repo and script is to help you attest and compute your measurement hash. 

This is recommended for developers that want to ensure the attestation for themselves.

## Local Measurement Hash Computation
### Repo Structure
- `scripts/local-measurement-hash.sh`: script to compute measurement hash for nilcc verifier
- `docker-compose.yaml`: sample docker compose

### Usage

```
cd scripts
chmod +x local-measurement-hash.sh
./local-measurement-hash.sh
```

Expected output should be something like:
`9e22...b84f4`

## Running the Embed Badge Workflow

1. Add the following files to your repo
- `.github/workflows/verify-measurement.yml`
- `scripts/update-verification.sh`

2. Edit the `scripts/update-verification.sh` with your `allowedDomains` for the website where you want to display the badge.

3. Try running the script locally and then push to main

```
cd scripts
chmod +x update-verification.sh
./update-verification.sh
```

4. Push to `main`

5. Now tag your versions through git to trigger the GitHub Actions workflow:

```
git tag v0.1.1
git push origin v0.1.1
```

6. It will run the GitHub Action and generate a PR by the GitHub Actions bot. Then merge it and use that verification-measurement-hash.json in the URL input to get the JSX / React code. 

