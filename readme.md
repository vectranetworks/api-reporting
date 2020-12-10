## Guide

Pre-requisites: Install [docker](https://docs.docker.com/get-docker/) and [git](https://git-scm.com/download/linux) on the server.

#### Clone Repo

`vectranetworks` requires all its Github users to have 2FA turned on. This means that you have to clone this repo either via SSH or HTTPS with a token.

We recommend you use SSH. Add an SSH key to your github account (see [this guide](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) for help), then run the following command:

```
git clone git@github.com/vectranetworks/api-reporting.git
```

If you'd like to use HTTPS and an Access Token instead, follow [this guide](https://github.blog/2013-09-03-two-factor-authentication/#how-does-it-work-for-command-line-git).

Now, cd into the directory.

```
cd vectra-api/
```

At this point you can choose to edit `config.yaml`, which controls the site's refresh frequency and the goals that are shown in different charts. These values can also be updated at any point while the app is running; new config values will propogate upon the next refresh.

#### Build docker image
```
docker build -t app .
```

#### Run app
```
docker run -it -p 4321:4321 -v $(pwd):/home/app app
```

You will be prompted to enter your DNS name (found in Cognito Settings) and API token (found in My Profile).

The app is now up and running! 

If at any point we release updates to the source code, all you have to do is run `git pull`. None of your historical data or logs will be deleted in this process.