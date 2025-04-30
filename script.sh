#!/bin/sh

# Get a token for accessing instance metadata
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
    -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Get instance metadata including the availability zone
AVAILABILITY_ZONE=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
    http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Instance Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h1>EC2 Instance Info</h1>
    <p><strong>Availability Zone:</strong> ${AVAILABILITY_ZONE}</p>
</body>
</html>
EOF

chmod 644 /usr/share/nginx/html/index.html

nginx -g 'daemon off;'
