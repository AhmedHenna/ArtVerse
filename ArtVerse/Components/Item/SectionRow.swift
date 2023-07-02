//
//  SectionRow.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct SectionRow: View {
    @StateObject private var mainViewModel = MainViewModel()
    @StateObject private var courseViewModel = CourseViewModel()
    
    
    
    var section: CourseSection?
    
    var defaultSection: CourseSection {
        courseViewModel.allSections.indices.contains(0) ? courseViewModel.allSections[0] : CourseSection(title: "", subtitle: "", description: "", image: "", background: "", logo: "", videoLink: "", progress: 0.75, part: 0)
    }
    
    var selectedSection: CourseSection {
        section ?? defaultSection
    }
    
    var body: some View {
        HStack(alignment: .top , spacing: 16) {
            Image(selectedSection.logo)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay(CircularView(value: selectedSection.progress))
            VStack(alignment: .leading, spacing: 8) {
                Text(selectedSection.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                Text(selectedSection.title)
                    .fontWeight(.semibold)
                Text(selectedSection.description)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                ProgressView(value: selectedSection.progress)
                    .accentColor(.white)
                    .frame(maxWidth: 130)
            }
        }
        .padding(15)
        Divider()
        
    }
}

struct SectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionRow()
    }
}
