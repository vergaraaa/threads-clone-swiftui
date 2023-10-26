//
//  ThreadService.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 26/10/23.
//

import Firebase
import Foundation
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
