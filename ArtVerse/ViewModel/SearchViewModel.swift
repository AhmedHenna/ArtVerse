//
//  SearchViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/21/23.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var suggestions: [Suggestions] = []
    
    init() {
        fetchCoursesFeatured()
    }
    
    func fetchCoursesFeatured() {
        FirestoreManager.shared.fetchSuggestionsFromFirestore { [weak self] suggestion in
            DispatchQueue.main.async {
                self?.suggestions = suggestion
            }
        }
    }
}
