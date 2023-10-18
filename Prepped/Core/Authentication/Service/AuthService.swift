//
//  AuthService.swift
//  Prepped
//
//  Created by Daniel Priestley on 19/10/2023.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Debug: Created user \(result.user.uid)")
        } catch {
            print("Debug failed to create user with error \(error.localizedDescription)")
        }
    }
}
