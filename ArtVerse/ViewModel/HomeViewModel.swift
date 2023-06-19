//
//  CoursesFeaturedViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/19/23.
//

import SwiftUI
import Firebase

class HomeViewModel: ObservableObject {
    @Published var coursesFeatured: [Course] = []
    
    init() {
        fetchCoursesFeatured()
    }
    
    func fetchCoursesFeatured() {
        FirestoreManager.shared.fetchFeaturedCoursesFromFirestore { [weak self] courses in
            DispatchQueue.main.async {
                self?.coursesFeatured = courses
            }
        }
    }
}
