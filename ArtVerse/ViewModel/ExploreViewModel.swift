//
//  ExploreViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/21/23.
//

import SwiftUI
import Firebase

class ExploreViewModel: ObservableObject {
    @Published var handbooks: [Handbook] = []
    
    init() {
        fetchHandbooks()
    }
    
    func fetchHandbooks() {
        FirestoreManager.shared.fetchHandbooksFromFirestore { [weak self] handbook in
            DispatchQueue.main.async {
                self?.handbooks = handbook
            }
        }
    }
}
