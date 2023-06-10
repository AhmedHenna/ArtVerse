//
//  CourseView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

struct CourseView: View {
    var namespace : Namespace.ID
    var course : Course = courses[0]
    @Binding var courseCardPressed : Bool
    @State var appear  = [false, false, false]
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            ScrollView {
                topContainer
                courseContent
                    .offset(y:120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? dragLeftSide : nil)
            
            closeButton
        }
        .ignoresSafeArea()
        .onAppear{
            fadeIn()
        }
        .onDisappear {
            fadeOut()
            
        }
    }
    
    var topContainer: some View{
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                Image(course.bg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "bg\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                foregroundDetailBox
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    
    var closeButton: some View{
        Button {
            withAnimation(.closeCard){
                courseCardPressed.toggle()
                model.showDetail.toggle()
                
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
    
    var foregroundDetailBox: some View{
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
            Divider()
                .opacity(appear[0] ? 1 : 0)
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
            .opacity(appear[1] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
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
    
    var dragLeftSide: some Gesture{
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged{ value in
                guard value.translation.width > 0 else {return}
                
                if value.startLocation.x < 100 {
                    withAnimation(.closeCard){
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120{
                    closeCoursePageGesture()
                }
                
            }
            .onEnded(){ value in
                if viewState.width > 80{
                    closeCoursePageGesture()
                }else{
                    withAnimation(.closeCard){
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn(){
        withAnimation(.easeOut.delay(0.3)){
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)){
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)){
            appear[2] = true
        }
    }
    
    func fadeOut(){
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func closeCoursePageGesture(){
        withAnimation(.closeCard){
            courseCardPressed.toggle()
            model.showDetail.toggle()
        }
        
        withAnimation(.closeCard){
            viewState = .zero
        }
        
        isDraggable = false
    }
    
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, courseCardPressed: .constant(true))
            .environmentObject(Model())
    }
}
