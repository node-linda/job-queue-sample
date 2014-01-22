Linda Sample - Job-Queue
========================
Job-Queue sample of [Linda Socket.IO](https://github.com/node-linda/linda-socket.io)

- https://github.com/node-linda/linda-job-queue-sample
- [demo](http://linda-job-queue-sample.herokuapp.com)

## Install Dependencies

    % npm install


## Run

    % npm start

=> http://localhost:3000


## Development

    % npm install grunt-cli
    % grunt

=> watch coffee-script and build javascript


    % DEBUG=linda* PORT=5000 npm start

=> start http://localhost:5000 with linda logs


## CUI job worker

    % coffee cui_worker.coffee


## Deploy on Heroku

    % heroku create
    % heroku labs:enable websockets
    % git push heroku master
    % heroku open

show logs on heroku

    % heroku config:set 'DEBUG=*'
    % heroku logs --tail
