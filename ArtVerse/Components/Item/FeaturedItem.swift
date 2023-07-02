//
//  FeaturedItem.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/3/23.
//

import SwiftUI

struct FeaturedItem: View {
    @StateObject private var mainViewModel = MainViewModel()
    @Environment(\.sizeCategory) var sizeCategory
    
    var course: Course?
    
    var defaultCourse: Course {
        mainViewModel.courses.indices.contains(0) ? mainViewModel.courses[0] :
        Course(title: "Blender", subtitle: "Learn 3D", description: "Make a Donut",
               image: "Illustration 1", logo: "Blender", bg: "Background 5", height: 400,
               instructor: "Blender Guru", instructorImage: "Blender Guru")
    }

    var selectedCourse: Course {
        course ?? defaultCourse
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image(selectedCourse.logo)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            Text(selectedCourse.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .dynamicTypeSize(.large)
            Text(selectedCourse.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(selectedCourse.description)
                .font(.footnote)
                .lineLimit(sizeCategory > .large ? 1 : 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 380.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
