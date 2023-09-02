//
//  RegistrationView.swift
//  Threads
//
//  Created by Edgar Vergara on 02/09/23.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email...", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your pasword...", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your fullname...", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username...", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                print("")
            } label: {
                Text("Sign up")
                    .modifier(AuthButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
