import SwiftUI

extension AnyTransition {
    static var popIn: AnyTransition {
        .scale(scale: 0.8).combined(with: .opacity)
    }
    static var popOut: AnyTransition {
        .scale(scale: 0.9).combined(with: .opacity)
    }
    static var popInOut: AnyTransition {
        .asymmetric(
            insertion: .popIn,
            removal: .popOut
        )
    }
}
