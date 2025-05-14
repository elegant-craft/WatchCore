import Foundation

#if os(iOS)
import UIKit
public var currentScreenWidth: CGFloat {
    UIScreen.main.bounds.width
}
public var currentScreenHeight: CGFloat {
    UIScreen.main.bounds.height
}
#elseif os(watchOS)
import WatchKit
public var currentScreenWidth: CGFloat {
    WKInterfaceDevice.current().screenBounds.width
}
public var currentScreenHeight: CGFloat {
    WKInterfaceDevice.current().screenBounds.height
}
#endif

public extension Double {
    var rWidth: Double {
        currentScreenWidth * (self / LayoutDesign.baselineWidth)
    }
}
