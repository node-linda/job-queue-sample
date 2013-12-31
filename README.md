Linda Sample - Job-Queue
========================
Job-Queue sample of [Linda Socket.IO](https://github.com/shokai/linda-socket.io)

- https://github.com/shokai/linda-job-queue-sample
- [demo](http://linda-job-queue-sample.herokuapp.com)

## Install Dependencies

    % npm install

## Run

    % coffee server.coffee 3000

=> http://localhost:3000


## CUI job worker

    % coffee cui_worker.coffee


## Deploy on Heroku

    % heroku create
    % heroku labs:enable websockets
    % git push heroku master
    % heroku open
