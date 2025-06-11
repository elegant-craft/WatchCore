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
    
    @ObservedObject var global: GlobelViewModel = Application.shared.globalViewModel
    
    public let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            self.content()
            ForEach(global.pages) { item in
                item.buildView()
            }
        }
    }
}

public struct Application {
    @MainActor
    public static let shared: Application = Application()
    public let globalViewModel: GlobelViewModel = GlobelViewModel()
    
    private init() {}
    
    @MainActor
    public func pushPage(view: some View) {
        Application.shared.globalViewModel.pages.append(.init { AnyView(view) })
    }
    
    @MainActor
    public func popPage() {
        if (!Application.shared.globalViewModel.pages.isEmpty) {
            Application.shared.globalViewModel.pages.removeLast()
        } else {
            print("homeView cant pop")
        }
    }
}
