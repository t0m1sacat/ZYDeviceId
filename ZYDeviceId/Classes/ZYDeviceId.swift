import UIKit
import KeychainAccess

open class ZYDeviceId {
    public static let shared = ZYDeviceId()
    private var deviceId: String = ""
    private let deviceIdKey = Bundle.main.bundleIdentifier ?? "com.device" + ".deviceId"

    private init() {

    }

    open func currentID() -> String {
        if (deviceId == "") {
            deviceId = fetchCachedId()
        }
        if (deviceId == "") {
            deviceId = generatorUUID();
        }
        cacheId(id: deviceId)
        return deviceId;
    }

    private func fetchCachedId() -> String {
        var id = UserDefaults.standard.string(forKey: deviceIdKey)
        if (id == nil) {
            id = Keychain(service: deviceIdKey)[deviceIdKey]
        }
        return id ?? "";
    }


    private func cacheId(id: String) {
        Keychain(service: deviceIdKey)[deviceIdKey] = id;
        UserDefaults.standard.setValue(id, forKey: deviceIdKey)
        UserDefaults.standard.synchronize()
    }


    func generatorUUID() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "");
    }
}

