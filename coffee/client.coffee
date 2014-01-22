print = (msg) ->
  $('#log').prepend $('<p>').text(msg)

socket = io.connect("#{location.protocol}//#{location.host}")
linda = new Linda().connect(socket)
ts = linda.tuplespace("calc")

socket.on 'connect', ->
  print "connect!!"
  ts.watch {type: 'result'}, (err, tuple) ->
    print "> #{tuple.data.result} (from:#{tuple.from})"

jQuery ->
  $('#btn_request').click (e)->
    query = $('#query').val()
    ts.write {type: 'request', query: query}
