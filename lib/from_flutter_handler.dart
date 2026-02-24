import 'dart:developer';

import 'package:template/src/messages.g.dart';

// Import your generated pigeon file

// 1. Create a class that implements the generated interface
class MyFromFlutterHandler extends FromFlutter {
  @override
  void isConnected(bool isConnectedArg) {
    log("Received from Native! Is Connected: $isConnectedArg");
  }
}
