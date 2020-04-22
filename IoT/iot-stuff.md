# Random gists

Check if certificates can connnect AWS IoT Endpoint
```
openssl s_client \
    -connect xxxxxxx-ats.iot.us-east-1.amazonaws.com:8443 \
    -CAfile AmazonRootCA1.pem \
    -cert iot-device.pem \
    -key iot-device.key
```
