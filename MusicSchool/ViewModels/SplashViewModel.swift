//
//  SplashViewModel.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import Foundation
import Combine

class SplashViewModel: ObservableObject {
    @Published var isFinished: Bool = false
    private var cancellable: AnyCancellable?

    func startTimer() {
        cancellable = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.isFinished = true
                self?.cancellable?.cancel()
            }
    }
}

