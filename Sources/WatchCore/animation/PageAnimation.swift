import SwiftUI

public struct PageAnimation<Content>: View where Content: View {
    
    @StateObject var global: GlobelViewModel = Application.shared.globalViewModel
    
    public let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        self.content()
            .transition(.popInOut)
            .zIndex(Double(Application.shared.globalViewModel.pages.count + 1))
            .frame(width: SystemInfo.watchScreenSize.width, height: SystemInfo.watchScreenSize.height)
            #if os(watchOS)
            .ignoresSafeArea()
            #endif
    }
}
