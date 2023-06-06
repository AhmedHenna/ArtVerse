//
//  NavigationBar.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/3/23.
//

import SwiftUI

struct AppBar: View {
    var title = ""
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear.background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .animatedFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 40, height: 40)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .strokeStyle(cornerRadius: 14)
                
                Image("Default Avatar")
                    .resizable()
                    .frame(width:26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing,20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -5 : 0)
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar(title: "Featured", hasScrolled: .constant(false))
    }
}
