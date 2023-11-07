//
//  UserContentListViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 07/11/23.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = user
        }
        
        self.threads = threads
    }
}
