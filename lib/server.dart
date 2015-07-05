library mini.server;

import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:force/force_serverside.dart';

Force WsServer;

makeMiniServer(){
  var handlerWebSocket;
  var handlerStatic; 
  var handler;
  var shelfHandler;

  WsServer = new Force();

  forceHandle(webSocket){
    StreamSocket ss = new StreamSocket(webSocket);
    return WsServer.handle(ss);
  }

  handlerWebSocket = webSocketHandler(forceHandle);

  handlerStatic = createStaticHandler('build/web', defaultDocument: 'index.html');

  handler = new shelf.Cascade()
                .add(handlerStatic)
                .add(handlerWebSocket)
                .handler;

  shelfHandler = const shelf.Pipeline()
                  .addMiddleware(shelf.logRequests())
                  .addHandler(handler);

  io.serve(shelfHandler, 'localhost', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
  
}
