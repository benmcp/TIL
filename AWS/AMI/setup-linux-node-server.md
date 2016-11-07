# Setup Linux AMI node server for AWS

## Setup and instance

1. Log into [AWS console](https://console.aws.amazon.com) and go to EC2

2. For a simple quick start, select `Amazon Linux AMI`

3. Select whichever tier suits your needs, for this example I will be using the t2.nano (0.5 gb memory)

4. Select `Next: Configure Instance Details`

5. Leave as is and select `Next: Add Store`

6. Leave as is and select `Next: Tag Instance`

7. Leave as is and select `Next: Configure Security Group`

8. Configuring a Security Group

This is important, you will need to specify what type of traffic can reach your instance. Ideally you would require two types:

### ssh

This will allow you for ssh into the instance and make changes on the server. This provides unlimited access and it is advised to confine the source of this to only a collection of machines, i.e. your own personal machine/IP.

### http

To add http access, click `Add Rule` and select `HTTP` from the type drop down. for `source`, select `anywhere`. This will give anyone access to your website, which is what we want!

9. Click Review and Launch

This will bring you to the modal `Select an existing key pair or create a new key pair`. This creates a public and private key which is used to securely access your instance. If you don't already have key pair, select `Create a new key pair`, chose and name and click `Download Key Pair`

## Setup your private key and SSH in

1. Keep your private key file (.pem) safe. This is used to generate your keys to access your instance. If anyone has access to this, they too will be able to access your isntance!!

2. Depending on what machine you are using (windows/mac/linux) the next steps may be different.

For this example I will be explaining how to do this on a windows machine with putty.

3. Download `PuTTY Key Generator` and load the private key you just downloaded.

In `PuTTY Key Generator`, click `Load` and select your .pem key. This will request you to save your key as a ppk file. To do this, create a paraphrase/confirm and then click `Save private key`. Now you have a key that you can use to access your ec2 instance.

4. Remote access

If you haven't already, download the `PuTTY` SSH client and select `Connection > SSH > Auth > browse` and select your .ppk file that you just created.

Now, back on the aws site, select `view instance` to see your newly created instance.

Look for your `Public DNS` which will be something like `ec2-XXXXXXXX.compute.amazonaws.com` and copy this.

Now, back in `PuTTY` select `Session` and past your instances Public DNS into `Host Name (or IP address)`. Give your session a name in the `Saved Sessions` options and click save.

Now that we have all this set up and saved, click `Open` to SSH in!!

A new SSH window will pop up prompting you for a login. Type in `ec2-user` and then enter your passphrase.

## Installing Node

There are various methods to install node depending on what OS you are using (linux AMI, ubuntu, windows) etc.

Before we install node, we need to add the path where the modules should be installed to.

For `Linux AMI` paste the following (right click in the window for paste if you are using putty on windows) and hit enter for:

```
sudo su
vi /etc/sudoers
```
Move down the editor until you reach the line:
```
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
```
And add `:/usr/local/bin` at the end of the line.

Now let's install our packages:

```
sudo yum install nodejs npm --enablerepo=epel
```
Select yes to confirm the downloads. This will download `node` and `npm` (node package manager).

Install GCC++ and make
```
sudo yum install gcc-c++ make
```

For a sample application enter the following:

```
touch package.json
```
Then use `vi` to edit the newly created file:
```
vi package.json
```
Add the following code by pressing `i` to insert:

```
{
  "name": "sample",
  "version": "0.0.1",
  "dependencies": {
    "express": "^4.12.3"
  }
}
```
Press `Esc` and then type `:wq`, this saves and quits the current file.

Run `npm install` to install the above packages.

Now create your server:
```
touch server.js
```
Use `vi` again to add a basic server:
```
var express = require("express");
var app = express();

app.get("/",function(req,res){
  res.send("<h1>ec2 bro</h1>");
});

app.listen(80);

```
Now run the server!
```
node server
```
(if you get an `Error: listen EACCES`, make sure you `sudo su`)

Go to your public DNS `ec2-XXXXXXXX.compute.amazonaws.com` to check it out!!
