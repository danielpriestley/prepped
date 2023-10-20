//
//  AuthService.swift
//  Prepped
//
//  Created by Daniel Priestley on 19/10/2023.
//

import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug: Logged in user \(result.user.uid)")
        } catch {
            print("Debug failed to login user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug: Created user \(result.user.uid)")
        } catch {
            print("Debug failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut() {
        try? Auth.auth().signOut() // signs out on firebase
        self.userSession = nil // signs out locally and updates the routing
    }
}
