# SNS deetz

## Simple setup

* Go to SNS
* Click `Create Topic`, topic name 'sample' and click create
* Click `Create Subscription`, you can choose anything, but lets select `email` and put your email address as the endpoint.
* Go to your email inbox and confirm the subscription
* If you refresh, it will be subscribed
* Go back to `Topics`, select the `sample` topic and click `Publish to Topic`
* Create a subject and message body and click publish
* You have now sent a message!

## What is SNS

* It is a `pub-sub` service
* Publishes messages via topics
* Can be used for `fan outs` or `alert` notifications

### Publishers

You can publsh from CLI, HTTP, SDK or other AWS services. You can create policies which control which topics publishers can write to.

### Topics

Channels used to send messages

### Subscribers

Endpoints subscribed to toptics. i.e. Mobile Apps/Web servers/email/AWS Lambda

### Access Control Policies

Amazon uses default denies. An explicit deny overrides a gernal allow.

### SQS quiues

* Go to `SQS` in the serices tab
* Create a new Queue and name it `sample-queue-one`, chose `standard` and click `Quick-Create Queue`
* Do the same for another queue but call it `sample-queue-two`
* In the main `SQS` section, select both queues, click `queue action` and select `Subscribe Topic`
* Chose the topic we alredy created, click `Subscribe`
* Go to SNS -> Subscriptions and you will be able to see these protocols are subscribed

### SNS - Push Notification Services

We can use external push notification services to push messages across to mobile applications

Mobile push notifications
* Apple Push Notification service
* Google Cloud Messaging for Android

SNS Push Notification Setup Process
* SNS needs a device token to send notifications to the mobile endpoints
* General method
1. Request credentials from mobile platform
2. Request a token from mobile platform
3. Create a platform application object
4. Create a platform endpoint object
5. Publish a message to the mobile endpoint

