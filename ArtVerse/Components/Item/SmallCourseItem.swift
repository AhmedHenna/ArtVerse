//
//  SmallCourseItem.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct SmallCourseItem: View {
    @StateObject private var mainViewModel = MainViewModel()
    var course: Course?
    
    var defaultCourse: Course {
        mainViewModel.courses[1]
    }
    
    var selectedCourse: Course {
        course ?? defaultCourse
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black.opacity(0.1))
                .overlay(
                    Image(selectedCourse.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 105)
                )
            Text(selectedCourse.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Text(selectedCourse.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 160, height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

struct SmallCourseItem_Previews: PreviewProvider {
    static var previews: some View {
        SmallCourseItem()
    }
}
