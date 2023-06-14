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
    @State var isDismiss = false
    @State var appear = [false, false, false]
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .onTapGesture {
                    dismissModal()
                }
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
            .offset(y: isDismiss ? 1000 : 0)
            .gesture(drag)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
            .opacity(appear[0] ? 1 : 0)
            .offset(y: appear[0] ? 0 : 200)
            .padding(20)
            .background(
                Image("Blob")
                    .offset(x: 200, y: -100)
                    .opacity(appear[2] ? 1 : 0)
                    .offset(y: appear[2] ? 0 : 20)
                    .blur(radius: appear[2] ? 0 : 40)
                    .allowsHitTesting(false)
            )
            
            
            Button {
                dismissModal()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .opacity(appear[1] ? 1 : 0)
            .offset(y: appear[1] ? 0 : -200)
        }
        .onAppear(){
            withAnimation(.easeOut){
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.1)){
                appear[1] = true
            }
            withAnimation(.easeOut(duration: 1).delay(0.2)){
                appear[2] = true
            }
        }
        .onChange(of: isLoggedIn) { newValue in
            if newValue {
                dismissModal()
            }
        }
    }
    
    var drag: some Gesture{
        DragGesture()
            .onChanged{value in
                viewState = value.translation
            }
            .onEnded{ value in
                if value.translation.height > 200{
                    dismissModal()
                }else{
                    withAnimation(.openCard){
                        viewState = .zero
                    }
                }
            }
    }
    
    func dismissModal(){
        withAnimation{
            isDismiss = true
        }
        withAnimation(.linear.delay(0.3)){
            showModal = false
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}
