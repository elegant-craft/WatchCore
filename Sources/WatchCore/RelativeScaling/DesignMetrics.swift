import Foundation
#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

public class Dm {
    
    public init() {}
    
    public var val: Double? = nil
    
    public func value(_ d: Double) -> Double {
        if val == nil {
            val = d
        }
        return val!
    }
    
    #if os(iOS)
    @MainActor
    #elseif os(watchOS)
    #endif
    public func m46(_ d: Double) -> Dm {
        let bounds = SystemInfo.screenBounds
        let width = bounds.width
        let height = bounds.height
        if width == 208.0 && height == 248.0 {
            val = d
        }
        return self
    }
}

enum LayoutDesign {
    static let baselineWidth: Double = 375
}
