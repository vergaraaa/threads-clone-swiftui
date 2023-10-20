//
//  UserService.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 20/10/23.
//

import Firebase
import Foundation
import FirebaseFirestoreSwift

class UserService {
    static let shared = UserService()
    
    @Published var currentUser: User?
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor 
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        
        self.currentUser = user
    }
}
