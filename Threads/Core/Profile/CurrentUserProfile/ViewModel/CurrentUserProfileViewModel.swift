//
//  CurrentUserProfileViewModel.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 22/10/23.
//

import Combine
import SwiftUI
import PhotosUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { currentUser in
            self.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
}
