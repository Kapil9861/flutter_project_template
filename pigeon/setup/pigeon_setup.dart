import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    dartOptions: DartOptions(),
    // cppOptions: CppOptions(namespace: 'pigeon_example'),
    // cppHeaderOut: 'windows/runner/messages.g.h',
    // cppSourceOut: 'windows/runner/messages.g.cpp',
    // gobjectHeaderOut: 'linux/messages.g.h',
    // gobjectSourceOut: 'linux/messages.g.cc',
    // gobjectOptions: GObjectOptions(),
    kotlinOut:
        'android/app/src/main/kotlin/com/example/pigeon_features/feature/Messages.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.example.pigeon_features.feature',
    ),
    // javaOut: 'android/app/src/main/java/io/flutter/plugins/Messages.java',
    // javaOptions: JavaOptions(),
    swiftOut: 'ios/Runner/Messages.g.swift',
    swiftOptions: SwiftOptions(),
    // objcHeaderOut: 'macos/Runner/messages.g.h',
    // objcSourceOut: 'macos/Runner/messages.g.m',
    // // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
    // objcOptions: ObjcOptions(prefix: 'PGN'),
    // copyrightHeader: 'pigeons/copyright.txt',
    dartPackageName: 'pigeon_',
  ),
)
@HostApi()
abstract class ConfigurePigeonApi {
  void ping();
}

@HostApi()
abstract class MessageFromNative {
  void greetUser(String username);
}

@FlutterApi()
abstract class FromFlutter {
  void isConnected(bool isConnected);
}
