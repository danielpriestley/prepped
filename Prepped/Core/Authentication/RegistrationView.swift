//
//  RegistrationView.swift
//  Prepped
//
//  Created by Daniel Priestley on 17/10/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
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
                    TextField("Email", text: $email)
                        .modifier(PreppedTextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    TextField("Name", text: $name)
                        .modifier(PreppedTextFieldModifier())
                        .autocorrectionDisabled()
                    TextField("Password", text: $password)
                        .modifier(PreppedTextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .modifier(PreppedPrimaryButtonLabelModifier())
                }
                .padding(.top, 4)
                .padding(.bottom)
                .padding(.horizontal)
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .font(.footnote)
                }
                .padding(.bottom)
                
            }
            .navigationBarBackButtonHidden()
        }
    }

#Preview {
    RegistrationView()
}
