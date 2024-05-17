# Create proxy subnet
```bash
gcloud compute networks subnets create subnet-proxy-tokyo \
    --purpose=REGIONAL_MANAGED_PROXY \
    --role=ACTIVE \
    --region=asia-northeast1 \
    --network=test-vpc \
    --range=192.168.0.0/23
```

# Import a policy
```yaml:policy.yaml
description: basic Secure Web Proxy policy
name: projects/kkuchima-sandbox/locations/asia-northeast1/gatewaySecurityPolicies/policy1
```

```bash
gcloud network-security gateway-security-policies import policy1 \
    --source=policy.yaml \
    --location=asia-northeast1
```

# Import a rule
```yaml:rule.yaml
name: projects/kkuchima-sandbox/locations/asia-northeast1/gatewaySecurityPolicies/policy1/rules/allow-httpbin
description: Allow httpbin.org
enabled: true
priority: 1
basicProfile: ALLOW
sessionMatcher: host() == 'httpbin.org'
```

```bash
gcloud network-security gateway-security-policies rules import allow-example-com \
    --source=rule.yaml \
    --location=asia-northeast1 \
    --gateway-security-policy=policy1
```

# Create a certificate
```bash
openssl req -x509 -newkey rsa:2048 \
  -keyout ~/key.pem \
  -out ~/cert.pem -days 365 \
  -subj '/CN=myswp.kkuchima.com' -nodes -addext \
  "subjectAltName=DNS:myswp.kkuchima.com"

gcloud certificate-manager certificates create myswp \
   --certificate-file=/Users/kuchima/cert.pem \
   --private-key-file=/Users/kuchima/key.pem \
   --location=asia-northeast1
```

# Create a gateway
```yaml:gateway.yaml
name: projects/kkuchima-sandbox/locations/asia-northeast1/gateways/swp1
type: SECURE_WEB_GATEWAY
addresses: ["10.200.100.111"]
ports: [443]
certificateUrls: ["projects/kkuchima-sandbox/locations/asia-northeast1/certificates/myswp"]
gatewaySecurityPolicy: projects/kkuchima-sandbox/locations/asia-northeast1/gatewaySecurityPolicies/policy1
network: projects/kkuchima-sandbox/global/networks/test-vpc
subnetwork: projects/kkuchima-sandbox/regions/asia-northeast1/subnetworks/subnet-tokyo
scope: samplescope
```

```bash
gcloud network-services gateways import swp1 \
    --source=gateway.yaml \
    --location=asia-northeast1
```

# Try access via SWP
```bash
$ curl -x https://10.200.100.111 https://zenn.dev --proxy-insecure
curl: (56) Received HTTP code 403 from proxy after CONNECT

curl -x https://10.200.100.111 http://httpbin.org/ip --proxy-insecure
{
  "origin": "34.84.124.86"
}
```

# ZeroSSL 証明書を信頼させる
```bash
gcloud certificate-manager certificates create myswp-zerossl \
   --certificate-file=/Users/kuchima/work/cloud-swp/certificate.crt \
   --private-key-file=/Users/kuchima/work/cloud-swp/private.key \
   --location=asia-northeast1
```

以下の手順で ca-bandles.crt を証明書ストアに追加し、CNを名前解決できるようにする
```bash
# cd /usr/share/ca-certificates
# mkdir mylocal
# cp somewhere/mylocal-root-cacert.crt mylocal/
# cp -p /etc/ca-certificates.conf /etc/ca-certificates.conf.bak
# echo "mylocal/mylocal-root-cacert.crt" >> /etc/ca-certificates.conf
# update-ca-certificates
# ls -l /etc/ssl/certs/ | grep mylocal-root-cacert

sudo vi /etc/hosts
```