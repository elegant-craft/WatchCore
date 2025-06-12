import SwiftUI

public struct PageAnimation<Content>: View where Content: View {
    
    @ObservedObject var global: GlobelViewModel = Application.shared.globalViewModel
    
    public let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        self.content()
            .transition(.popInOut)
            .zIndex(Double(Application.shared.globalViewModel.pages.count + 1))
    }
}
