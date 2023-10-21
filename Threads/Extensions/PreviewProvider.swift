//
//  PreviewProvider.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 21/10/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Edgar Vergara", email: "vergaraa@gmail.com", username: "vergara")
}
