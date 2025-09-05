//
//  AppState.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    enum CurrentScreen {
        case splash, auth, mainTab
    }

    @Published var currentScreen: CurrentScreen = .splash
    @Published var isLoggedIn: Bool = false
}

