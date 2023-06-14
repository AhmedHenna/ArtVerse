//
//  SectionRow.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct SectionRow: View {
    var section: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .top , spacing: 16) {
            Image(section.logo)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
            .overlay(CircularView(value: section.progress))
            VStack(alignment: .leading, spacing: 8) {
                Text(section.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                Text(section.title)
                    .fontWeight(.semibold)
                Text(section.description)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                ProgressView(value: section.progress)
                    .accentColor(.white)
                    .frame(maxWidth: 130)
            }
        }
        .padding(15)
       
    }
}

struct SectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionRow()
    }
}
