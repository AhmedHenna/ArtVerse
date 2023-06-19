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
    @State var courseCardPressed = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showCourse = false
    @State var selectedIndex = 0
    @EnvironmentObject var model: Model
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var mainViewModel = MainViewModel()

    
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
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !courseCardPressed{
                        courseCards
                    }else{
                        cardFillerToStopAutoScrollingtoTop
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)})
            .overlay(AppBar(title: "Featured", hasScrolled: $hasScrolled))
            
            if courseCardPressed{
                courseCardDetails
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: courseCardPressed){ newValue in
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
            ForEach(Array(homeViewModel.coursesFeatured.enumerated()), id: \.offset) { index, course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX/50))
                        .overlay(Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:course.height)
                            .offset(y:-85)
                            .offset(x: minX / 1.5)
                        )
                        .onTapGesture {
                            showCourse = true
                            selectedIndex = index
                        }
                    
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob").offset(x:250, y:-100))
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: namespace, course: homeViewModel.coursesFeatured[selectedIndex], courseCardPressed: $showCourse)
        }
    }
    
    var courseCards: some View{
        ForEach(mainViewModel.courses){ course in
            CourseItem(course: course, namespace: namespace, courseCardPressed: $courseCardPressed)
                .onTapGesture {
                    withAnimation(.openCard){
                        courseCardPressed.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
                }
        }
    }
    
    var courseCardDetails: some View{
        ForEach(mainViewModel.courses) { course in
            if course.id == selectedID{
                CourseView(namespace: namespace, course: course, courseCardPressed: $courseCardPressed)
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
    
    /*this just acts as the courses card, since once one of them is clicked they are removed
    so this will help stop the autoscrolling to the top*/
    var cardFillerToStopAutoScrollingtoTop: some View{
        ForEach(mainViewModel.courses) { course in
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}
