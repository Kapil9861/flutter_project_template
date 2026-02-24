import Foundation
import Flutter

class PigeonBridge {
    static let shared = PigeonBridge()
    private var api: FromFlutter? = nil

    private init() {}

    func initialize(messenger: FlutterBinaryMessenger) {
        api = FromFlutter(binaryMessenger: messenger)
    }

    func sendConnectionStatus(isConnected: Bool) {
        guard let api = api else {
            print("PigeonBridge: API not initialized!")
            return
        }

        // Updated parameter label to match your generated code
        api.isConnected(isConnected: isConnected) { result in
            switch result {
            case .success:
                print("PigeonBridge: Successfully notified Flutter: \(isConnected)")
            case .failure(let error):
                print("PigeonBridge: Failed to notify Flutter: \(error.localizedDescription)")
            }
        }
    }
}
