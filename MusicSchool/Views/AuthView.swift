//
//  AuthView.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            AppColors.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                LottieView(name: "AuthViewAnimation", multiplier: 1)
                    .frame(width: 300, height: 300)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Добро пожаловать!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(AppColors.defaultTextColor)
                    
                    Text("Вы попали в приложение для учеников музыкальной школы! Вам необходимо ввести свой ключ доступа, чтобы продолжить!")
                        .font(.title3)
                        .foregroundStyle(AppColors.defaultTextColor)
                    
                    PrimaryTextField(
                        placeholder: "Введите ваш ключ доступа",
                        systemImageName: "lock.fill",
                        text: $viewModel.enterKeyTextFieldValue
                    )

                    PrimaryButton(
                        title: "Вперед!",
                        isDisabled: viewModel.enterKeyTextFieldValue.isEmpty
                    ) {
    
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}

