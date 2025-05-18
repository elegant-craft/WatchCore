#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

public struct SystemInfo {
    #if os(iOS)
    @MainActor
    #elseif os(watchOS)
    #endif
    public static var screenBounds: CGRect {
        #if os(iOS)
        let result = UIScreen.main.bounds
        #elseif os(watchOS)
        let result = WKInterfaceDevice.current().screenBounds
        #endif
        return result
    }
    
    #if os(iOS)
    @MainActor
    #elseif os(watchOS)
    #endif
    public static var screenScale: Double {
        #if os(iOS)
        let result = UIScreen.main.scale
        #elseif os(watchOS)
        let result = WKInterfaceDevice.current().screenScale
        #endif
        return result
    }
}
