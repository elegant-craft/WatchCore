import Foundation
#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif

#if os(iOS)
@MainActor
#elseif os(watchOS)
#endif
private var currentScreenWidth: CGFloat {
    SystemInfo.screenBounds.width
}

#if os(iOS)
@MainActor
#elseif os(watchOS)
#endif
private var currentScreenHeight: CGFloat {
    SystemInfo.screenBounds.height
}

public extension Double {
    
    #if os(iOS)
    @MainActor
    #elseif os(watchOS)
    #endif
    var rWidth: Double {
        currentScreenWidth * (self / LayoutDesign.baselineWidth)
    }
    
    #if os(iOS)
    @MainActor
    #elseif os(watchOS)
    #endif
    var px: Double {
        let scale  = SystemInfo.screenScale
        return self / scale
    }
    
    #if os(iOS)
    @MainActor
    var watchScreen_rWidth: Double {
        (300) / 375 * currentScreenWidth * (self / LayoutDesign.baselineWidth)
    }
    #elseif os(watchOS)
    var watchScreen_rWidth: Double {
        currentScreenWidth * (self / LayoutDesign.baselineWidth)
    }
    #endif
}
