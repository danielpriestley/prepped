//
//  AccountView.swift
//  Prepped
//
//  Created by Daniel Priestley on 20/10/2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Text("Account View")
            Button {
                AuthService.shared.signOut()
            } label: {
                Text("Log Out")
                    .foregroundStyle(.red)
            }
        }
        
    }
}

#Preview {
    AccountView()
}
