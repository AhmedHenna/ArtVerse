//
//  CourseView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

struct CourseView: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                topContainer
            }
            .background(Color("Background"))
            
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                    show.toggle()
                }
                
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
        .ignoresSafeArea()
        
    }
    
    var topContainer: some View{
        VStack{
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
                .frame(height: 250)
        )
        .background(
            Image("Background 4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "bg", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).matchedGeometryEffect(id: "mask", in: namespace))
        .overlay{
            VStack (alignment: .leading, spacing: 12){
                Text("Blender Beginner Tutorial")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("17 Sections - 7 Hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.")
                    .lineLimit(2)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "description", in: namespace)
                Divider()
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
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
            
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
