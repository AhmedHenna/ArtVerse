//
//  AuthViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/18/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var password: String = "" {
        didSet {
            validateFields()
        }
    }
    @Published var fieldsNotEmpty: Bool = false
    
    func validateFields() {
        fieldsNotEmpty = !email.isEmpty && !password.isEmpty
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            print("User signed up")
        }
    }
}
