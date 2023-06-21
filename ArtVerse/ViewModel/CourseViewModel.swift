//
//  CourseViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/21/23.
//

import SwiftUI
import Firebase

class CourseViewModel: ObservableObject {
    @Published var allSections: [CourseSection] = []

    func fetchAllSections(title: String) {
        FirestoreManager.shared.fetchAllSectionsFromFirestore(title: title) { [weak self] section in
            DispatchQueue.main.async {
                self?.allSections = section
            }
        }
    }
}
