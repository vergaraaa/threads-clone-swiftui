//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Edgar Vergara on 04/09/23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("threads-logo")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}