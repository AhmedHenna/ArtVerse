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
    @Published var topics: [Topic] = []
    
    init() {
        fetchCourses()
        fetchTopics()
    }
    
        
    func fetchCourses() {
        FirestoreManager.shared.fetchCoursesFromFirestore { [weak self] courses in
            DispatchQueue.main.async {
                self?.courses = courses
            }
        }
    }
    
    func fetchTopics() {
        FirestoreManager.shared.fetchTopicsFromFirestore { [weak self] topics in
            DispatchQueue.main.async {
                self?.topics = topics
            }
        }
    }
}
