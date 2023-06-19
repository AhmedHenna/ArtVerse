//
//  MainViewModel.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/20/23.
//


import SwiftUI
import Firebase

class MainViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    init() {
        fetchCourses()
    }
    
        
    func fetchCourses() {
        FirestoreManager.shared.fetchCoursesFromFirestore { [weak self] courses in
            DispatchQueue.main.async {
                self?.courses = courses
            }
        }
    }
}
