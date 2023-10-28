//
//  LoginView.swift
//  Prepped
//
//  Created by Daniel Priestley on 17/10/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Image(systemName: "carrot.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    Text("Prepped")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                }
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(PreppedTextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(PreppedTextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.appPrimary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.login()
                    }
                } label: {
                    Text("Login")
                        .modifier(PreppedPrimaryButtonLabelModifier())
                }
                .padding(.bottom)
                .padding(.horizontal)
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.appPrimary)
                    .font(.footnote)
                }
                .padding(.bottom)
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginView()
}
