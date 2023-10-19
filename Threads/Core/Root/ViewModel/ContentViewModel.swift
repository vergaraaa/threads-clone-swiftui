//
//  ContentViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 19/10/23.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
