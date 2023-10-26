//
//  ThreadCreationViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 26/10/23.
//

import Firebase
import Foundation

class ThreadCreationViewModel: ObservableObject {
    @Published var caption = ""
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
                
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
                
        try await ThreadService.uploadThread(thread)
    }
}
