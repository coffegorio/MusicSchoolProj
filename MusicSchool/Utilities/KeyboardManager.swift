//
//  KeyboardManager.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI
import Combine

class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var isKeyboardVisible: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupKeyboardObservers()
    }
    
    private func setupKeyboardObservers() {
        // Уведомления о появлении клавиатуры
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { notification in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height
            }
            .sink { [weak self] height in
                withAnimation(.easeInOut(duration: 0.3)) {
                    self?.keyboardHeight = height
                    self?.isKeyboardVisible = true
                }
            }
            .store(in: &cancellables)
        
        // Уведомления о скрытии клавиатуры
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] _ in
                withAnimation(.easeInOut(duration: 0.3)) {
                    self?.keyboardHeight = 0
                    self?.isKeyboardVisible = false
                }
            }
            .store(in: &cancellables)
    }
    
    // Метод для скрытия клавиатуры
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: - View Extensions
extension View {
    // Скрытие клавиатуры при тапе вне текстовых полей
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    // Скрытие клавиатуры при свайпе вниз
    func hideKeyboardOnSwipe() -> some View {
        self.gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height > 50 {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
        )
    }
}
