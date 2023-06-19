//
//  FIrestoreManager.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/19/23.
//

import SwiftUI
import Firebase

class FirestoreManager {
    private var db: Firestore
    
    static let shared = FirestoreManager() // Singleton instance
    
    private init() {
        db = Firestore.firestore()
    }
    
    func fetchFeaturedCoursesFromFirestore(completion: @escaping ([Course]) -> Void) {
        db.collection("coursesFeatured").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            var fetchedCourses: [Course] = []

            for document in documents {
                let data = document.data()

                if let title = data["title"] as? String,
                   let subtitle = data["subtitle"] as? String,
                   let description = data["description"] as? String,
                   let image = data["image"] as? String,
                   let logo = data["logo"] as? String,
                   let bg = data["bg"] as? String,
                   let height = data["height"] as? CGFloat {
                    
                    let course = Course(title: title, subtitle: subtitle, description: description, image: image, logo: logo, bg: bg, height: height)
                    fetchedCourses.append(course)
                }
            }
            completion(fetchedCourses)
        }
    }
    
    func fetchCoursesFromFirestore(completion: @escaping ([Course]) -> Void) {
        db.collection("courses").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            var fetchedCourses: [Course] = []

            for document in documents {
                let data = document.data()

                if let title = data["title"] as? String,
                   let subtitle = data["subtitle"] as? String,
                   let description = data["description"] as? String,
                   let image = data["image"] as? String,
                   let logo = data["logo"] as? String,
                   let bg = data["bg"] as? String,
                   let height = data["height"] as? CGFloat {
                    
                    let course = Course(title: title, subtitle: subtitle, description: description, image: image, logo: logo, bg: bg, height: height)
                    fetchedCourses.append(course)
                }
            }
            completion(fetchedCourses)
        }
    }
}
