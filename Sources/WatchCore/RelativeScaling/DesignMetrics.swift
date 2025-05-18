#if canImport(WatchKit)
import Foundation
import WatchKit

public class Dm {
    
    public init() {}
    
    public var val: Double? = nil
    
    public func value(_ d: Double) -> Double {
        if val == nil {
            val = d
        }
        return val!
    }
    
    public func m46(_ d: Double) -> Dm {
        let device = WKInterfaceDevice.current()
        let bounds = device.screenBounds
        let width = bounds.width
        let height = bounds.height
        if width == 208.0 && height == 248.0 {
            val = d
        }
        return self
    }
}

enum LayoutDesign {
    static let baselineWidth: Double = 416
}
#endif
