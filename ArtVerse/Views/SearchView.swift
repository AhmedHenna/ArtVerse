//
//  SearchView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/11/23.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List{
                ForEach(courses.filter{$0.title.contains(text) || text == ""}) { item in
                    Text(item.title)
                }
            }
            .searchable(text: $text, placement:
                    .navigationBarDrawer(displayMode: .always), prompt: Text("Blender, Procreate, Ps"))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {presentationMode.wrappedValue.dismiss()}
                                label: {Text("Done").bold()})
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
