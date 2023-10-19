//
//  AuthService.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 19/10/23.
//

import Foundation
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
            
            print("DEBUG: Signed user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with errro \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            self.userSession = result.user
            
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with errro \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // sings out on backend
        self.userSession = nil // removes session locally and updates routing
    }
}
