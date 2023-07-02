//
//  AvatarView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct AvatarView: View {
    @ObservedObject var viewModel = AuthViewModel()
    @State private var isLoggedIn = false
    var height: CGFloat = 24
    var width: CGFloat = 24
    var imageCornerRadius: CGFloat = 10
    var backgroundCornerRadius: CGFloat = 18

    var body: some View {
        Group {
            if viewModel.checkIfLoggedIn() {
                AsyncImage(url: URL(string: "https://t.ly/d-Z6"), transaction: Transaction(animation: .easeOut)) { phase in
                    // Image loading states
                    switch phase {
                    case .success(let image):
                        image.resizable().transition(.scale(scale: 0.5, anchor: .center))
                    case .empty:
                        ProgressView()
                    case .failure(_):
                        Color.gray
                    default:
                        EmptyView()
                    }
                }
            } else {
                Image("Default Avatar")
                    .resizable()
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(imageCornerRadius)
        .padding(8)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: backgroundCornerRadius, style: .continuous))
        .strokeStyle(cornerRadius: backgroundCornerRadius)
        .onAppear {
            isLoggedIn = viewModel.checkIfLoggedIn()
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
