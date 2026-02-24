import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let messenger = controller.binaryMessenger

        // 1. Initialize the Global Bridge
        PigeonBridge.shared.initialize(messenger: messenger)

        // 2. Setup Listeners (Flutter -> Native)
        ConfigurePigeonApiSetup.setUp(binaryMessenger: messenger, api: MyConfigurePigeonApiImpl())
        MessageFromNativeSetup.setUp(binaryMessenger: messenger, api: MyMessageFromNativeImpl())

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class MyConfigurePigeonApiImpl: ConfigurePigeonApi {
    func ping() throws {
        print("Ping received from Flutter!")
        // Use the global bridge
        PigeonBridge.shared.sendConnectionStatus(isConnected: true)
    }
}

class MyMessageFromNativeImpl: MessageFromNative {
    func greetUser(username: String) throws {
        print("Greeting user: \(username)")
        // Use the global bridge
        PigeonBridge.shared.sendConnectionStatus(isConnected: true)
    }
}
