import SwiftUI

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

