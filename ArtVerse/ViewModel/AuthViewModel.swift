//
//  AuthViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/18/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = "" { didSet { validateFields() } }
    @Published var password: String = "" { didSet { validateFields() } }
    @Published var firstName: String = "" { didSet { validateFields() } }
    @Published var lastName: String = "" { didSet { validateFields() } }
    @Published var fieldsNotEmpty: Bool = false
    @Published var isLoggedIn = false
    @Published var error: Error?
    
    func validateFields() {
        fieldsNotEmpty = !email.isEmpty && !password.isEmpty
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            // User creation successful, save additional user details
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = "\(self.firstName) \(self.lastName)"
            
            changeRequest?.commitChanges { error in
                if let error = error {
                    print("Error saving user profile: \(error.localizedDescription)")
                } else {
                    print("User profile saved successfully!")
                }
            }
        }
    }
    
    
    func login() {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                
                if let error = error {
                    self.error = error
                    self.isLoggedIn = false
                    print("error")
                } else {
                    self.isLoggedIn = true
                    print("success")
                }
            }
        }
    
    
    
}

