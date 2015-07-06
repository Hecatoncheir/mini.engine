library mini.client;

import 'dart:html';
import 'package:force/force_browser.dart';
import 'package:polymer/polymer.dart';

export 'package:polymer/init.dart';

class MiniClient {
  ForceClient WsClient;

  makeMiniClientEngine(){
    WsClient.connect();
  }

  MiniClient(){
    WsClient = new ForceClient();
  }

}