//
//  AuthViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/18/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email: String = "" { didSet { validateFields() } }
    @Published var password: String = "" { didSet { validateFields() } }
    @Published var firstName: String = "" { didSet { validateFields() } }
    @Published var lastName: String = "" { didSet { validateFields() } }
    @Published var fieldsNotEmpty: Bool = false
    @Published var isLoggedIn = false
    @Published var errorTitle: String = ""
    @Published var errorDescription: String = ""
    @Published var isLoading = false
    @AppStorage("showModal") var showModal = false
    
    func validateFields() {
        fieldsNotEmpty = !email.isEmpty && !password.isEmpty
    }
    
    func register(completion: @escaping (Bool) -> Void) {
        isLoading = true

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }

            if let error = error {
                self.handleAuthError(error)
                self.isLoggedIn = false
                completion(false)
                self.isLoading = false
                return
            }

            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = "\(self.firstName) \(self.lastName)"
            changeRequest?.commitChanges { [weak self] error in
                if let error = error {
                    print("Error saving user profile \(error.localizedDescription)")
                } else {
                    print("User profile saved successfully!")
                }
                self?.isLoggedIn = true
                completion(true)
                self?.showModal = false
                self?.isLoading = false
            }
        }
    }

    
    func login(completion: @escaping (Bool) -> Void) {
        isLoading = true // Set isLoading to true before starting the login process

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }

            self.isLoading = false // Set isLoading to false when the login process completes

            if let error = error {
                self.handleAuthError(error)
                self.isLoggedIn = false
                completion(false) // Call the completion handler with false if login fails
            } else {
                self.isLoggedIn = true
                self.showModal = false
                completion(true) // Call the completion handler with true if login succeeds
            }
        }
    }
    
    func checkIfLoggedIn() -> Bool{
        if Auth.auth().currentUser?.uid != nil {
            return true
        }else{
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    func getUserFullName() -> String? {
           guard let currentUser = Auth.auth().currentUser else {
               return nil
           }
           return currentUser.displayName
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
