//
//  SplashView.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
         
            LottieView(name: "PreviewAnimation", multiplier: 0.7)
                .onAppear {
                    viewModel.startTimer()
                }
                .onReceive(viewModel.$isFinished) { finished in
                    if finished {
                        appState.currentScreen = appState.isLoggedIn ? .mainTab : .auth
                    }
                }
        }
    }
}
