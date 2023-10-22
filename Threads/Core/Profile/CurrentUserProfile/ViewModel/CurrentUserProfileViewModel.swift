//
//  CurrentUserProfileViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 22/10/23.
//

import Combine
import Foundation

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        UserService.shared.$currentUser.sink { currentUser in
            self.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
