//
//  TyleApp.swift
//  Tyle
//
//  Created by Vitoria Garcia on 8/1/25.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct TyleApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                SplashView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .login: LoginView()
                        case .signup: SignupView()
                        case .tab: TyleTabView()
                        case .welcome: WelcomeView()
                        case .profile(let userId): ProfileView(vm: .init(username: userId))
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
