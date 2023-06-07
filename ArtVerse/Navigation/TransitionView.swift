//
//  MatchedView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

struct TransitionView: View {
    @Namespace var namespace
    @State var show = false
    
    
    var body: some View {
        ZStack {
            if !show{
                VStack {
                    Spacer()
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
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                   
                }
                .foregroundStyle(.white)
                .background(
                    Image("Illustration 5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image("Background 4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "bg", in: namespace)
                )
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous).matchedGeometryEffect(id: "mask", in: namespace))
                .frame(height: 300)
                .padding(20)
                
            }else{
                ScrollView {
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
                        .offset(y: 100)
                        .padding(20)
                        
                    }
                }
                
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                show.toggle()
            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
