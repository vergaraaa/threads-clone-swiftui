//
//  FeedViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 04/11/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
    }
}
