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
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            List{
                profile
                menu
                links
                
                Button {
                    viewModel.signOut()
                    dismiss()
                } label: {
                    Text("Log out")
                }
                .tint(.red)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button {dismiss()}label: {Text("Done").bold()})
        }
    }
    
    var profile: some View{
        VStack (spacing: 8) {
            AvatarView(height: 50, width: 50, imageCornerRadius: 32, backgroundCornerRadius: 32)
                .cornerRadius(18)
                .symbolRenderingMode(.palette)
                .padding()
                .background(
                    HexagonView().offset(x: -40, y: -115)
                )
                .background(
                    BlobView()
                        .offset(x:250, y:0)
                        .scaleEffect(0.7)
                )
            Text(viewModel.getUserFullName() ?? "Anonymous Wizard")
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
