//
//  ExploreView.swift
//  Threads
//
//  Created by Edgar Vergara on 02/09/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                
                                Divider()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .searchable(text: $searchText, prompt: "Search...")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
