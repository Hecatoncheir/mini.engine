library server;

import 'package:mini_engine/server.dart';

MiniServer WsServer;

main(){
  MiniServer server = new MiniServer();
  WsServer = server.WsServer;

  server.makeMiniServerEngine();
}
