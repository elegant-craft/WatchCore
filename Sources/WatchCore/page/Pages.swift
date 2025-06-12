import SwiftUI
import Combine

public struct Pages: Identifiable {
    public let id = UUID()
    public let buildView: () -> AnyView
    
    public init(buildView: @escaping () -> AnyView) {
        self.buildView = buildView
    }
}

public class GlobelViewModel: ObservableObject {
    @Published public var pages: [Pages] = []
}

public struct PageView<Content>: View where Content: View {
    
    @StateObject var global: GlobelViewModel = Application.shared.globalViewModel
    
    public let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            ForEach(global.pages) { item in
                item.buildView()
            }
        }
        .onAppear {
            if global.pages.isEmpty {
                Application.shared.pushPage(
                    view: PageAnimation(content: { self.content() })
                )
            }
        }
    }
}
