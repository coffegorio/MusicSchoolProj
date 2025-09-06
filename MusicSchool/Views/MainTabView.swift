//
//  MainTabView.swift
//  MusicSchool
//
//  Created by Egorio on 03.09.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        ZStack {
            
            AppColors.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text("Привет! Вы попали в приложение")
            }
            .padding(20)
            
        }
        
    }
}
