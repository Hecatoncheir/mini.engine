library mini.client;

import 'dart:html';
import 'package:force/force_browser.dart';
import 'package:polymer/polymer.dart';

export 'package:polymer/init.dart';

MiniClient WsClient;

class MiniClient {
  ForceClient WsClient;

  makeMiniClientEngine(){
    WsClient.connect();
  }

  MiniClient(){
    WsClient = new ForceClient();
  }

}

@whenPolymerReady
void onReady(){
  MiniClient miniClient = new MiniClient();
  WsClient = miniClient.WsClient;

  miniClient.makeMiniClientEngine();
}