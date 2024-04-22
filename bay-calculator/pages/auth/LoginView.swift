//
//  LoginView.swift
//  bay-calculator
//
//  Created by Ben Stacey on 22/04/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var showCreateAccount: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("Login")
                .font(.title)
                .foregroundColor(.blue)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Handle login action
                self.login()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: {
                // Navigate to Create Account screen
                self.showCreateAccount.toggle()
            }) {
                Text("Create Account")
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $showCreateAccount) {
            CreateAccountView()
        }
    }
    
    func login() {
        // Here you can implement your login logic
        if email == "admin" && password == "password" {
            print("Login successful")
            // Navigate to the next screen or do something else
        } else {
            showAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
