//
//  HomeView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/3/23.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var hasScrolled = false
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                detectScroll
                coursesFeaturedSwiper
                
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show{
                    ForEach(courses){ course in
                        CourseItem(course: course, namespace: namespace, show: $show)
                            .onTapGesture {
                                withAnimation(.openCard){
                                    show.toggle()
                                    showStatusBar = false
                                    selectedID = course.id
                                }
                            }
                    }
                }else{
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y:10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(AppBar(title: "Featured", hasScrolled: $hasScrolled))
            
            if show{
                ForEach(courses) { course in
                    if course.id == selectedID{
                        CourseView(namespace: namespace, course: course, show: $show)
                            .zIndex(1)
                            .transition(
                                .asymmetric(
                                    insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                                    removal: .opacity.animation(.easeInOut(duration: 0.2))
                                )
                            )
                    }
                }
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show){ newValue in
            withAnimation(.closeCard){
                if newValue{
                    showStatusBar = false
                }else{
                    showStatusBar = true
                }
            }
        }
    }
    
    var detectScroll: some View{
        GeometryReader{ proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: {value in
            withAnimation (.easeInOut){
                if value < 0{
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
    }
    
    var coursesFeaturedSwiper: some View{
        TabView {
            ForEach(coursesFeatured) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .padding(.vertical, 10)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX/50))
                        .overlay(Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:course.height)
                            .offset(x:0, y:-100)
                            .offset(x: minX / 1.5)
                        )
                    
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob").offset(x:250, y:-100))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
