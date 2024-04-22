//
//  CreateAccountView.swift
//  bay-calculator
//
//  Created by Ben Stacey on 22/04/24.
//

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPasswordsDontMatchAlert: Bool = false
    @State private var showNoFirstNameAlert: Bool = false
    @State private var showNoLastNameAlert: Bool = false
    @State private var showNoEmailAlert: Bool = false
    @State private var showNoPasswordAlert: Bool = false
    @State private var showCreationFailedAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("Create Account")
                .font(.title)
                .foregroundColor(.blue)
            
            TextField("First name", text: $firstName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            TextField("Last name", text: $lastName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
                .autocorrectionDisabled()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
                .autocorrectionDisabled()
            
            Button(action: {
                self.createAccount()
            }) {
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .alert(isPresented: $showCreationFailedAlert) {
                Alert(title: Text("Error"), message: Text("Failed to create user"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showPasswordsDontMatchAlert) {
            Alert(title: Text("Error"), message: Text("Passwords do not match"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showNoFirstNameAlert) {
            Alert(title: Text("Error"), message: Text("No first name"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showNoLastNameAlert) {
            Alert(title: Text("Error"), message: Text("No last name"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showNoEmailAlert) {
            Alert(title: Text("Error"), message: Text("No email"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showNoPasswordAlert) {
            Alert(title: Text("Error"), message: Text("No password"), dismissButton: .default(Text("OK")))
        }
    }
    
    func createAccount() {
        if firstName.isEmpty {
            showNoFirstNameAlert = true
            return
        }
        
        if lastName.isEmpty {
            showNoLastNameAlert = true
            return
        }
        
        if email.isEmpty {
            showNoEmailAlert = true
            return
        }
        
        if password.isEmpty {
            showNoPasswordAlert = true
            return
        }
        
        if password == confirmPassword {
            do {
                try addUser(firstName: firstName, lastName: lastName, email: email, password: password)
                print("Account created successfully")
                goBack()
            } catch {
                print("Failed to create account: \(error)")
                showCreationFailedAlert = true
            }
        } else {
            showPasswordsDontMatchAlert = true
        }
    }
    
    private func addUser(firstName: String, lastName: String, email: String, password: String) throws {
        let newUser = User(id: UUID().uuidString, firstName: firstName, lastName: lastName, email: email, password: password)
//        do {
             modelContext.insert(newUser)
//        } catch {
//            throw error
//        }
        
    }
}

//struct CreateAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateAccountView()
//    }
//}
