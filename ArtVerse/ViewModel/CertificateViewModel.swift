//
//  LibraryViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 7/2/23.
//

import SwiftUI
import Firebase

class CertificateViewModel: ObservableObject {
    @Published var certificates: [Certificate] = []

    init() {
        fetchCertificates()
    }
    
    func fetchCertificates() {
        FirestoreManager.shared.fetchCertificatesFromFirestore { [weak self] certificate in
            DispatchQueue.main.async {
                self?.certificates = certificate
            }
        }
    }
}
