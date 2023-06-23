//
//  SectionView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct SectionView: View {
    @StateObject private var mainViewModel = MainViewModel()
    @StateObject private var courseViewModel = CourseViewModel()
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    var course: Course?
    var section: CourseSection?
    
    var defaultCourse: Course {
        mainViewModel.courses.indices.contains(0) ? mainViewModel.courses[0] : Course(title: "", subtitle: "", description: "", image: "", logo: "", bg: "", height: 100, instructor: "", instructorImage: "")
    }
    
    
    var selectedCourse: Course {
        course ?? defaultCourse
    }
    
    var defaultSection: CourseSection {
        courseViewModel.allSections.indices.contains(0) ? courseViewModel.allSections[0] : CourseSection(title: "Blender", subtitle: "15 sections - 4 hours", description: "this is just a testing lol lololololol lol olol", image: "Illustration 7", background: "Background 4", logo: "Blender", videoLink: "", progress: 0.75, part: 0)
    }
    
    var selectedSection: CourseSection {
        section ?? defaultSection
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                topContainer
                    .overlay(PlayButton().overlay(CircularView(value: selectedSection.progress, lineWidth: 5).padding(24)))
                courseContent
                    .offset(y:120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            
            closeButton
        }
        .ignoresSafeArea()
    }
    
    var topContainer: some View{
        
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image(selectedSection.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 900)
            
        )
        .background(
            Image(selectedSection.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 0, style: .continuous)
        )
        .overlay(
            foregroundDetailBox
        )
        
        .frame(height: 500)
    }
    
    var closeButton: some View{
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
    }
    
    var foregroundDetailBox: some View{
        VStack (alignment: .leading, spacing: 12){
            Text(selectedSection.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(selectedSection.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            Text(selectedSection.description)
                .lineLimit(2)
                .font(.footnote)
            Divider()
            HStack{
                Image(selectedCourse.instructorImage)
                    .resizable()
                    .frame(width:26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text(selectedCourse.instructor)
                    .font(.footnote)
            }
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .offset(y: 250)
        .padding(20)
        
    }
    
    var courseContent: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("More info about course").font(.title3).bold()
            Divider()
            Text(selectedCourse.title).bold()
            Text(selectedCourse.description).font(.subheadline)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .padding(20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
