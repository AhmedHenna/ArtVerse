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
    @Published var errorTitle: String = ""
    @Published var errorDescription: String = ""
    
    func validateFields() {
        fieldsNotEmpty = !email.isEmpty && !password.isEmpty
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                self.handleAuthError(error)
                self.isLoggedIn = false
                return
            }
            
            // User creation successful, save additional user details
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = "\(self.firstName) \(self.lastName)"
            
            changeRequest?.commitChanges { error in
                if let error = error {
                    print("Error saving user profile")
                } else {
                    print("User profile saved successfully!")
                }
            }
        }
        isLoggedIn = true
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                self.handleAuthError(error)
                self.isLoggedIn = false
                print("fail")
            } else {
                self.isLoggedIn = true
                print("success")
            }
        }
    }
    
    private func handleAuthError(_ error: Error) {
        if let errorCode = AuthErrorCode.Code(rawValue: (error as NSError).code) {
            self.errorDescription = error.localizedDescription
            switch errorCode {
            case .networkError:
                self.errorTitle = "Network error"
            case .userNotFound:
                self.errorTitle = "User Not Found"
            case .wrongPassword:
                self.errorTitle = "Incorrect Password"
            case .emailAlreadyInUse:
                self.errorTitle = "Email Already in Use"
            case .invalidEmail:
                self.errorTitle = "Invalid Email"
            case .weakPassword:
                print("WEAK")
                self.errorTitle = "Weak Password"
            default:
                self.errorTitle = "Unkown Error"
                self.errorDescription = "Something went wrong please try again"
            }
        } else {
            self.errorTitle = "Unkown Error"
            self.errorDescription = "Something went wrong please try again"
        }
    }
}
