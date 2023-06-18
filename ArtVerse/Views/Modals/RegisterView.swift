//
//  RegisterView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI
import AudioToolbox

struct RegisterView: View {
    enum Field: Hashable{
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @State var circlePosition: CGFloat = 120
    @State var emailYPos: CGFloat = 0
    @State var passwordYPos: CGFloat = 0
    @State var circleColor: Color = .blue
    @State var appear = [false, false, false]
    @FocusState var focusField: Field?
    @EnvironmentObject var model: Model
    private let generator = UISelectionFeedbackGenerator()
    private var viewModel = AuthViewModel()
    
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Register")
                .font(.largeTitle).bold()
                .opacity(appear[0] ? 1 : 0)
                .offset(y: appear[0] ? 0 : 20)
            Text("Access hours of courses and tutorials for all your creative needs")
                .font(.headline)
                .opacity(appear[1] ? 1 : 0)
                .offset(y: appear[1] ? 0 : 20)
            
            Group{
                TextField("Email", text: $email)
                    .inputFieldStyle(icon: Image(systemName: "envelope.open.fill"))
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .focused($focusField, equals: .email)
                    .shadow(color: focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self){ value in
                        emailYPos = value
                        circlePosition = value
                        generator.selectionChanged()
                    }
                    .onChange(of: email) { value in
                        viewModel.email = value
                    }
            
            SecureField("Password", text: $password)
                .inputFieldStyle(icon: Image(systemName: "key.fill"))
                .textContentType(.password)
                .focused($focusField, equals: .password)
                .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self){ value in
                    passwordYPos = value
                    generator.selectionChanged()
                }
                .onChange(of: password) { value in
                    viewModel.password = value
                }
            
            Button {
                viewModel.register()
                generator.selectionChanged()
            } label: {
                Text("Register account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.customButton)
            .tint(.accentColor)
            .controlSize(.large)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
            
            Divider()
            
            HStack {
                Text("Already have an account?")
                Button {
                    model.selectedModal = .logIn
                } label: {
                    GradientText(text: "Log in")
                }
            }
            .font(.footnote.bold())
            .foregroundColor(.secondary)
            .accentColor(.secondary)
        }
        .opacity(appear[2] ? 1 : 0)
        .offset(y: appear[2] ? 0 : 20)
    }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle()
                .fill(circleColor)
                .frame(width: 70, height: 70)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circlePosition)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
        .onChange(of: focusField, perform: { newValue in
            withAnimation{
                if newValue == .email{
                    circlePosition = emailYPos
                    circleColor = .blue
                }else{
                    circlePosition = passwordYPos
                    circleColor = .red
                }
            }
        })
        .onAppear(){
            withAnimation(.spring().delay(0.1)){
                appear[0] = true
            }
            withAnimation(.spring().delay(0.2)){
                appear[1] = true
            }
            withAnimation(.spring().delay(0.3)){
                appear[2] = true
            }
        }
}

var geometry: some View{
    GeometryReader{ proxy in
        Color.clear.preference(key: CirclePreferenceKey.self,
                               value: proxy.frame(in: .named("container")).minY)
    }
}

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(Model())
    }
}
