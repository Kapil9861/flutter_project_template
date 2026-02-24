import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController = window?.rootViewController as! FlutterViewController
    SetupConfigurePigeonApi(binaryMessenger: flutterViewController.binaryMessenger,
                            api: MyPigeonApi())
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class MyPigeonApi: ConfigurePigeonApi {
    func ping() {
        print("Ping received from Flutter on iOS!")
    }

    func greetUser(username: String) {
        print("Greet received from Flutter on iOS! Username: \(username)")
    }
}
