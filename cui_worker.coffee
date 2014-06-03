LindaClient = require('linda').Client

socket = require('socket.io-client').connect('http://linda-job-queue-sample.herokuapp.com/')

linda = new LindaClient().connect(socket)
ts = linda.tuplespace('calc')

socket.on 'connect', ->
  console.log 'connect!!!'
  work()

work = ->
  ts.take {type: 'request'}, (err, tuple) ->
    result = eval tuple.data.query
    console.log "#{tuple.data.query} = #{result}"
    ts.write {type: 'result', result: result}
    work()

