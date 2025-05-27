#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#endif
import SwiftUI

#if os(watchOS)
public class ApplicationDelegate: NSObject, WKApplicationDelegate {
    public func applicationDidFinishLaunching() {
        LogManager.lifecyle("[didFinishLaunching]")
        NotificationCenter.default.post(name: .applicationDidFinishLaunching, object: nil)
    }
    
    public func applicationDidEnterBackground() {
        LogManager.lifecyle("[didEnterBackground]")
        NotificationCenter.default.post(name: .appDidEnterBackground, object: nil)
    }
    
    public func applicationWillEnterForeground() {
        LogManager.lifecyle("[willEnterForeground]")
        NotificationCenter.default.post(name: .applicationWillEnterForeground, object: nil)
    }
}
#elseif os(iOS)
public class ApplicationDelegate: NSObject, UIApplicationDelegate {
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        LogManager.lifecyle("[didFinishLaunching]")
        NotificationCenter.default.post(name: .applicationDidFinishLaunching, object: nil)
        return true
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        LogManager.lifecyle("[didEnterBackground]")
        NotificationCenter.default.post(name: .appDidEnterBackground, object: nil)
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        LogManager.lifecyle("[willEnterForeground]")
        NotificationCenter.default.post(name: .applicationWillEnterForeground, object: nil)
    }
}
#endif

extension Notification.Name {
    public static let appDidEnterBackground = Notification.Name("appDidEnterBackground")
    public static let applicationDidFinishLaunching = Notification.Name("applicationDidFinishLaunching")
    public static let applicationWillEnterForeground = Notification.Name("applicationWillEnterForeground")
}

public protocol WatchApp: App {
    func lifeCycleRegister(_ app: any App)
    func applicationDidFinishLaunching()
    func appDidEnterBackground()
    func applicationWillEnterForeground()
}

extension WatchApp {
    public func lifeCycleRegister(_ app: any App) {
        NotificationCenter.default.addObserver(
            forName: .applicationDidFinishLaunching,
            object: nil,
            queue: .main
        ) { _ in
            if let lifecycle = app as? (any WatchApp) {
                Task { @MainActor in
                    lifecycle.applicationDidFinishLaunching()
                }
            }
        }
        NotificationCenter.default.addObserver(
            forName: .appDidEnterBackground,
            object: nil,
            queue: .main
        ) { _ in
            if let lifecycle = app as? (any WatchApp) {
                Task { @MainActor in
                    lifecycle.appDidEnterBackground()
                }
            }
        }
        NotificationCenter.default.addObserver(
            forName: .applicationWillEnterForeground,
            object: nil,
            queue: .main
        ) { _ in
            if let lifecycle = app as? (any WatchApp) {
                Task { @MainActor in
                    lifecycle.applicationWillEnterForeground()
                }
            }
        }
    }
}

