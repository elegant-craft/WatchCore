import SwiftUI

public struct EButton<Content>: View where Content: View {
    let action: () -> Void
    public let content: (_ isPressed: Bool) -> Content
    
    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping (_ isPressed: Bool) -> Content) {
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            EmptyView()
        }
        .buttonStyle(EButtonButtonStyle(content: { isPressed in
            self.content(isPressed)
        }))
    }
}

public struct EButtonButtonStyle<Content>: ButtonStyle where Content: View {
    
    public let content: (_ isPressed: Bool) -> Content
    
    public init(@ViewBuilder content: @escaping (_ isPressed: Bool) -> Content) {
        self.content = content
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        self.content(configuration.isPressed)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}
