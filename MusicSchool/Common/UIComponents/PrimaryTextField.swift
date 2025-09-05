//
//  PrimaryTextField.swift
//  MusicSchool
//
//  Created by Egorio on 05.09.2025.
//

import SwiftUI

struct PrimaryTextField: View {
    let placeholder: String
    let systemImageName: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .fontWeight(.regular)
            .padding(.leading, 36)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(AppColors.defaultTextColor, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(AppColors.backgroundColor)
                    )
            )
            .overlay(
                HStack {
                    Image(systemName: systemImageName)
                        .foregroundColor(AppColors.defaultTextColor)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    Spacer()
                }
            )
            .foregroundColor(AppColors.defaultTextColor)
            .autocapitalization(.none)
            .disableAutocorrection(true)
    }
}
