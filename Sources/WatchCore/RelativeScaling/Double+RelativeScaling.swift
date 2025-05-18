#if canImport(WatchKit)
import Foundation
import WatchKit

public var currentScreenWidth: CGFloat {
    WKInterfaceDevice.current().screenBounds.width
}
public var currentScreenHeight: CGFloat {
    WKInterfaceDevice.current().screenBounds.height
}

public extension Double {
    var rWidth: Double {
        currentScreenWidth * (self / LayoutDesign.baselineWidth)
    }
    
    var px: Double {
        let device = WKInterfaceDevice.current()
        let bounds = device.screenBounds
        let scale  = device.screenScale
        return self / scale
    }
}
#endif
