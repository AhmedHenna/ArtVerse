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
    
    func fetchSuggestionsFromFirestore(completion: @escaping ([Suggestions]) -> Void) {
        db.collection("suggestions").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            
            var fetchedSuggestions: [Suggestions] = []
            
            for document in documents {
                let data = document.data()
                
                if let text = data["text"] as? String {
                    
                    let suggestion = Suggestions(text: text)
                    fetchedSuggestions.append(suggestion)
                }
            }
            completion(fetchedSuggestions)
        }
    }
    
    func fetchTopicsFromFirestore(completion: @escaping ([Topic]) -> Void) {
        db.collection("topics").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            
            var fetchedTopics: [Topic] = []
            
            for document in documents {
                let data = document.data()
                
                if let text = data["text"] as? String,
                   let icon = data["icon"] as? String{
                    
                    let topic = Topic(title: text, icon: icon)
                    fetchedTopics.append(topic)
                }
            }
            completion(fetchedTopics)
        }
    }
    
    func fetchHandbooksFromFirestore(completion: @escaping ([Handbook]) -> Void) {
        db.collection("handbooks").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            
            var fetchedHandbooks: [Handbook] = []
            
            for document in documents {
                let data = document.data()
                
                if let title = data["title"] as? String,
                   let subtitle = data["subtitle"] as? String,
                   let description = data["description"] as? String,
                   let image = data["image"] as? String,
                   let logo = data["logo"] as? String,
                   let color1 = data["color1"] as? String,
                   let color2 = data["color2"] as? String{
                    
                    
                    let handbook = Handbook(title: title, subtitle: subtitle, description: description, logo: logo,
                                            image: image, color1: colorFromString(color1) ?? .gray, color2: colorFromString(color2) ?? .white)
                    fetchedHandbooks.append(handbook)
                }
            }
            completion(fetchedHandbooks)
        }
    }
    
    func fetchAllSectionsFromFirestore(title: String, completion: @escaping ([CourseSection]) -> Void) {
        db.collection("courseSections").whereField("title", isEqualTo: title).getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            
            var fetchedSections: [CourseSection] = []
            
            for document in documents {
                let data = document.data()
                
                if let title = data["title"] as? String,
                   let subtitle = data["subtitle"] as? String,
                   let description = data["description"] as? String,
                   let image = data["image"] as? String,
                   let logo = data["logo"] as? String,
                   let background = data["background"] as? String,
                   let videoLink = data["videoLink"] as? String,
                   let progress = data["progress"] as? CGFloat{
                    
                    let section = CourseSection(title: title, subtitle: subtitle, description: description, image: image,
                                                background: background, logo: logo, videoLink: videoLink, progress: progress)
                    fetchedSections.append(section)
                }
            }
            completion(fetchedSections)
        }
    }
    
    func fetchCurrentSectionsFromFirestore(completion: @escaping ([CourseSection]) -> Void) {
        db.collection("courseSections").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            
            var fetchedSections: [CourseSection] = []
            
            for document in documents {
                let data = document.data()
                
                if let title = data["title"] as? String,
                   let subtitle = data["subtitle"] as? String,
                   let description = data["description"] as? String,
                   let image = data["image"] as? String,
                   let logo = data["logo"] as? String,
                   let background = data["background"] as? String,
                   let videoLink = data["videoLink"] as? String,
                   let progress = data["progress"] as? CGFloat{
                    
                    let section = CourseSection(title: title, subtitle: subtitle, description: description, image: image,
                                                background: background, logo: logo, videoLink: videoLink, progress: progress)
                    if section.progress > 0{
                        fetchedSections.append(section)
                    }
                }
            }
            completion(fetchedSections)
        }
    }
}
