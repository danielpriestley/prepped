//
//  RegistrationViewModel.swift
//  Prepped
//
//  Created by Daniel Priestley on 19/10/2023.
//

import Foundation

@Observable class RegistrationViewModel {
    var email = ""
    var password = ""
    var name = ""
    
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            name: name
        )
    }
}
