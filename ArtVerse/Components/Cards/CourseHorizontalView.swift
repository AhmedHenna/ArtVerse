//
//  CourseHorizontalView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/24/23.
//

import SwiftUI


struct CourseHorizontalView: View {
    var courses: [Course]
    @Binding var courseCardPressed: Bool
    @Binding var showStatusBar: Bool
    @Binding var selectedID: UUID
    @EnvironmentObject var model: Model

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(courses) { course in
                    SmallCourseItem(course: course)
                        .onTapGesture {
                            withAnimation(.openCard) {
                                courseCardPressed.toggle()
                                model.showDetail.toggle()
                                showStatusBar = false
                                selectedID = course.id
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}
