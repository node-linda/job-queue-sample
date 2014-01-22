(function() {
  var linda, print, socket, ts;

  print = function(msg) {
    return $('#log').prepend($('<p>').text(msg));
  };

  socket = io.connect("" + location.protocol + "//" + location.host);

  linda = new Linda().connect(socket);

  ts = linda.tuplespace("calc");

  socket.on('connect', function() {
    print("connect!!");
    return ts.watch({
      type: 'result'
    }, function(err, tuple) {
      return print("> " + tuple.data.result + " (from:" + tuple.from + ")");
    });
  });

  jQuery(function() {
    return $('#btn_request').click(function(e) {
      var query;
      query = $('#query').val();
      return ts.write({
        type: 'request',
        query: query
      });
    });
  });

}).call(this);
