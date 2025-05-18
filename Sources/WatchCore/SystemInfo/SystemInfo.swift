#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

public struct SystemInfo {
    @MainActor
    public static var screenBounds: CGRect {
        #if os(iOS)
        let result = UIScreen.main.bounds
        #elseif os(watchOS)
        let result = WKInterfaceDevice.current().screenBounds
        #endif
        return result
    }
}
