//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Edgar Ernesto Vergara Montiel on 22/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            // bio and stats
            VStack(alignment: .leading, spacing: 12) {
                // fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("13 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
