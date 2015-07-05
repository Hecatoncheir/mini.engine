import 'package:polymer/polymer.dart';

@CustomTag('mini-copyright')
class MiniCopyright extends PolymerElement {

  @published
  String year = '2015';

  MiniCopyright.created():super.created();
}