#!/bin/bash
#
# USAGE: sh ./ocspcli.sh host [port]
#
# A OCSP client that verifies a site's certificate using OCSP via openssl
#
if [ $# -ne 1 -a $# -ne 2 ]; then
  echo "Usage: $0 host [port]"
  echo "Example:"
  echo "  $0 example.com"
  echo "  $0 example.com 443"
  echo ""
  exit 1
fi

HOST=$1
PORT=${2:-"443"}	# default port to 443

CERT_FILE="certificate-$HOST.pem"
ISSUER_CERT_FILE="issuer_certificate-$HOST.pem"

# Get leaf certificate
echo -n | openssl s_client -connect $HOST:$PORT -servername $HOST 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > "$CERT_FILE"

# Get issuer certificate
echo -n | openssl s_client -connect $HOST:$PORT -servername -servername -showcerts 2>&1 |
	sed -ne '/-----BEGIN/,/-----END/p' |
	perl -0777 -pe 's/.*?-{5}END\sCERTIFICATE-{5}\n//s' > "$ISSUER_CERT_FILE"

OCSP_URL=`openssl x509 -noout -ocsp_uri -in "$CERT_FILE"`
OCSP_HOST=`echo $OCSP_URL | awk -F/ '{print $3}'`

# Send a query to an OCSP responder with URL $OCSP_URL save the response to a file, print it out in text form, and verify the response:
openssl ocsp -issuer "$ISSUER_CERT_FILE" \
	-cert "$CERT_FILE" \
	-url $OCSP_URL \
	-header "HOST" $OCSP_HOST \
	-VAfile "$ISSUER_CERT_FILE" \
	-resp_text \
	-respout resp.der
