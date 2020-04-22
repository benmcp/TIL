# Random gists

Check if certificates can connnect AWS IoT Endpoint
```
openssl s_client \
    -connect xxxxxxx-ats.iot.us-east-1.amazonaws.com:8443 \
    -CAfile AmazonRootCA1.pem \
    -cert iot-device.pem \
    -key iot-device.key
```

Publish event for AWS IoT using mosquitto_pub
```
mosquitto_pub \
    --cafile keys/AmazonRootCA1.pem \
    --cert keys/SAMPLE_CERT.pem \
    --key keys/SAMPLE.private.key \
    -t TOPIC_MESSAGE \
    -m hi \
    -h XXXXXXX-ats.iot.us-east-1.amazonaws.com \
    -p 8883 \
    -i CLIENT_ID \
    -d
```
