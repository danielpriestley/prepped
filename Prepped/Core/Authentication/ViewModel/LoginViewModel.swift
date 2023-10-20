//
//  LoginViewModel.swift
//  Prepped
//
//  Created by Daniel Priestley on 20/10/2023.
//

import Foundation

@Observable class LoginViewModel {
    var email = ""
    var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
