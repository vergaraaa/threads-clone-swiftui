//
//  User.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 20/10/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
