//
//  CourseItem.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

struct CourseItem: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    @Binding var courseCardPressed: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack (alignment: .leading, spacing: 12){
                Text(course.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
                Text(course.description)
                    .lineLimit(2)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "description\(course.id)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
        )
        .background(
            Image(course.bg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "bg\(course.id)", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).matchedGeometryEffect(id: "mask\(course.id)", in: namespace))
        .frame(height: 300)
        .padding(20)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace, courseCardPressed: .constant(true))
    }
}
