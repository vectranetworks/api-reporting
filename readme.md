## Guide

Pre-requisites: Install [docker](https://docs.docker.com/get-docker/) and [git](https://git-scm.com/download/linux) on the server.

#### Clone Repo

To clone the repo on the server, run the following command:

`
git clone https://github.com/vectranetworks/api-reporting.git
`

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