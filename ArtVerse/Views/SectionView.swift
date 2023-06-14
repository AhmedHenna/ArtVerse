//
//  SectionView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct SectionView: View {
    var section : CourseSection = courseSections[0]
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                topContainer
                    .overlay(PlayButton().overlay(CircularView(value: section.progress, lineWidth: 5).padding(24)))
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
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .frame(maxWidth: 900)
            
        )
        .background(
            Image(section.background)
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
            Text(section.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(section.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            Text(section.description)
                .lineLimit(2)
                .font(.footnote)
            Divider()
                .opacity(0)
            HStack{
                Image("Default Avatar")
                    .resizable()
                    .frame(width:26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Taught by Blender Guru")
                    .font(.footnote)
            }
            .opacity(0)
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
        VStack(alignment: .leading, spacing: 30){
            Text("Hello this is the blender course and here you will lear all sort of useless information like making a 3d donut").font(.title3).fontWeight(.medium)
            Text("This Course").font(.title).bold()
            Text("Text text Text text Text text Text text Text text Text text Text text Text text Text text Text text Text text Text textText textText textText text")
            Text("Some more text")
        }
        .padding(20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
