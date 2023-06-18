//
//  AuthViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/18/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    var email: String = ""
    var password: String = ""
    
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            print("User signed up")
        }
    }
}



