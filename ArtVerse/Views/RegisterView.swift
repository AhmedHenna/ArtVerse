//
//  RegisterView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Register")
                .font(.largeTitle).bold()
            Text("Access hours of courses and tutorials for all your creative needs")
                .font(.headline)
            Button {} label: {
                Text("Register account")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .padding(20)
        .background(Image("Blob").offset(x: 200, y: -100))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
