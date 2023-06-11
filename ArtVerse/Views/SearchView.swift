//
//  SearchView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/11/23.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var showCourseView = false
    @State var selectedIndex = 0
    @Namespace var namespace
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    searchResults
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(Image("Blob").offset(x: -100, y: -200))
                
            }
            .searchable(text: $text, placement:
                    .navigationBarDrawer(displayMode: .always), prompt: Text("Blender, Procreate, Ps")){
                        ForEach(suggestions){ suggestion in
                            Button {
                                text = suggestion.text
                            } label:{
                                Text(suggestion.text)
                                    .searchCompletion(suggestion.text)
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: Button {presentationMode.wrappedValue.dismiss()}
                                        label: {Text("Done").bold()})
                    .sheet(isPresented: $showCourseView) {
                        CourseView(namespace: namespace, course: courses[selectedIndex] ,courseCardPressed: $showCourseView)
                    }
        }
    }
    
    var searchResults: some View{
        ForEach(Array(courses.enumerated()), id: \.offset) {index, item in
            if item.title.contains(text) || text == ""  {
                if index != 0 {Divider()}
                Button {
                    showCourseView = true
                    selectedIndex = index
                    print(selectedIndex)
                } label: {
                    HStack (alignment: .top, spacing: 15){
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(RoundedRectangle(cornerRadius: 15))
                        VStack (alignment: .leading, spacing: 5) {
                            Text(item.title).bold()
                                .foregroundColor(.primary)
                            Text(item.description)
                                .font(.footnote)
                                .lineLimit(3)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 5)
                    .listRowSeparator(.hidden)
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
