//
//  ContentViewModel.swift
//  Prepped
//
//  Created by Daniel Priestley on 20/10/2023.
//

import Foundation
import Combine
import Firebase

@Observable class ContentViewModel {
    var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
