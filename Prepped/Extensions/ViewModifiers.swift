//
//  ViewModifiers.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI

// Authentication Text Fields
struct PreppedTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct PreppedPrimaryButtonLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.buttonText)
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(.button)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct PreppedSecondaryButtonLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.buttonText)
            .frame(maxWidth: .infinity, minHeight: 44)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
