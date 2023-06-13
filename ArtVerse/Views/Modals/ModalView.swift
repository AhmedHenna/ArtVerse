//
//  ModalView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/13/23.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal = true
    @State var viewState: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            Group{
                switch model.selectedModal {
                case .register: RegisterView()
                case .logIn: LogInView()
                }
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotationEffect(.degrees(viewState.width / 50))
            .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z:0))
            .hueRotation(.degrees(viewState.height / 5))
            .hueRotation(.degrees(viewState.width / 5))
            .offset(x: viewState.width, y: viewState.height)
            .gesture(drag)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
            .padding(20)
            .background(Image("Blob").offset(x: 200, y: -100))
            
           
            Button {
                withAnimation {
                    showModal = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
        }
    }
    
    var drag: some Gesture{
        DragGesture()
            .onChanged{value in
                viewState = value.translation
            }
            .onEnded{ value in
                withAnimation(.openCard){
                    viewState = .zero
                }
            }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
