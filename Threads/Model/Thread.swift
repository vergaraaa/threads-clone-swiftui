//
//  Thread.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 26/10/23.
//

import Firebase
import Foundation
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
