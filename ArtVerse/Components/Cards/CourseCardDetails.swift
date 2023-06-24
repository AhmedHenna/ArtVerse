//
//  CourseCardDetails.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/24/23.
//

import SwiftUI

struct CourseCardDetails: View {
    var courses: [Course]
    var selectedID: UUID
    @Namespace var namespace
    @Binding var courseCardPressed: Bool
    
    var body: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, course: course, courseCardPressed: $courseCardPressed)
                    .zIndex(1)
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                            removal: .opacity.animation(.easeInOut(duration: 0.2))
                        )
                    )
            }
        }
    }
}

