//
//  AccountView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/31/23.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List{
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button {presentationMode.wrappedValue.dismiss()}
                                label: {Text("Done").bold()})
        }
    }
    
    var profile: some View{
        VStack (spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView().offset(x: -40, y: -115)
                )
                .background(
                    BlobView()
                        .offset(x:250, y:0)
                        .scaleEffect(0.7)
                )
            Text("Ahmed Henna")
                .font(.title.weight(.semibold))
            HStack{
                Image(systemName: "location").imageScale(.medium)
                Text("Egypt").foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        
    }
    
    var menu : some View{
        Section {
            NavigationLink {HomeView()} label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {HomeView()} label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {HomeView()} label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View{
        Section {
            if !isDeleted {
                Link(destination: URL(string: "http://youssefhenna.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false){
                    deleteButton
                    pinButton
                }
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var deleteButton: some View{
        Button(action: {isDeleted = true}) {
            Label("Delete", systemImage: "trash")
        }
        .tint(.red)
    }
    
    var pinButton: some View{
        Button(action: {isPinned.toggle()}){
            Label("Pin", systemImage: !isPinned ? "pin" : "pin.slash")
        }
        .tint(!isPinned ? .yellow: .gray)
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
        AccountView()
            .preferredColorScheme(.dark)
    }
}
