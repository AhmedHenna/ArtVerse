//
//  AccountView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/31/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List{
                VStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundColor(.blue)
                                .font(.system(size:200))
                                .offset(x: -45, y: -120)
                    )
                    Text("Ahmed Henna")
                        .font(.title.weight(.semibold))
                    HStack{
                        Image(systemName: "location").imageScale(.large)
                        Text("Egypt").foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
            
                Section {
                    Text("Ahmed")
                    Text("Billing")
                    Text("Help")
                }
               
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
