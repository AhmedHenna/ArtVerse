//
//  CourseItem.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

struct CourseItem: View {
    var course: Course?
    @StateObject private var mainViewModel = MainViewModel()
    var namespace: Namespace.ID
    @Binding var courseCardPressed: Bool
    
    var defaultCourse: Course {
        mainViewModel.courses[0]
    }
    
    var selectedCourse: Course {
        course ?? defaultCourse
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading, spacing: 12){
                Text(selectedCourse.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(selectedCourse.id)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(selectedCourse.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(selectedCourse.id)", in: namespace)
                Text(selectedCourse.description)
                    .lineLimit(2)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "description\(selectedCourse.id)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(selectedCourse.id)", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image(selectedCourse.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .matchedGeometryEffect(id: "image\(selectedCourse.id)", in: namespace)
        )
        .background(
            Image(selectedCourse.bg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "bg\(selectedCourse.id)", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).matchedGeometryEffect(id: "mask\(selectedCourse.id)", in: namespace))
        .frame(height: 300)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace, courseCardPressed: .constant(true))
    }
}
