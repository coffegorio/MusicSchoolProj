//
//  PrimaryButton.swift
//  MusicSchool
//
//  Created by Egorio on 05.09.2025.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(AppColors.defaultTextColor)
                )
                .foregroundColor(AppColors.backgroundColor)
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.8 : 1)
    }
}
