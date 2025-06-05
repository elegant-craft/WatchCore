import SwiftUI

public struct EButton<Content: View>: View {
    let action: () -> Void
    let content: (_ isPressed: Bool) -> Content

    @GestureState private var isPressed = false
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping (_ isPressed: Bool) -> Content
    ) {
        self.action = action
        self.content = content
    }

    public var body: some View {
        let gesture = DragGesture(minimumDistance: 0)
            .updating($isPressed) { _, state, _ in
                state = true
            }
            .onEnded { _ in
                action()
            }

        return content(isPressed)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
            .gesture(gesture)
    }
}
