//
//  ExploreView.swift
//  Threads
//
//  Created by Edgar Vergara on 02/09/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            UserCell()
                            
                            Divider()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search...")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
