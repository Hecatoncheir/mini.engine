library mini.client;

import 'dart:html';
import 'package:force/force_browser.dart';

ForceClient WsClient;

makeMiniClient(){
  WsClient = new ForceClient();
  WsClient.connect();
}