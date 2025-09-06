//
//  ContentView.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @StateObject private var splashVM = SplashViewModel()
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var keyboardManager = KeyboardManager()

    var body: some View {
        ZStack {
            switch appState.currentScreen {
            case .splash:
                SplashView(viewModel: splashVM)
                    .environmentObject(appState)
//                    .transition(.move(edge: .leading))
            case .auth:
                AuthView(viewModel: authVM)
                    .environmentObject(appState)
                    .environmentObject(keyboardManager)
//                    .transition(.move(edge: .leading))
            case .mainTab:
                MainTabView()
                    .environmentObject(appState)
                    .environmentObject(keyboardManager)
//                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.4), value: appState.currentScreen)
    }
}
