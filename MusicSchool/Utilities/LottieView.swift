//
//  LottieView.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI
import Lottie
import UIKit

struct LottieView: UIViewRepresentable {
    let name: String
    let multiplier: CGFloat

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()

        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
