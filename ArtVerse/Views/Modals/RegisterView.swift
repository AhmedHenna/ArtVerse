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
        case firstName
        case lastName
    }
    
    @StateObject var viewModel = AuthViewModel()
    @State var circlePosition: CGFloat = 120
    @State var firstNameYPos: CGFloat = 0
    @State var lastNameYPos: CGFloat = 0
    @State var emailYPos: CGFloat = 0
    @State var passwordYPos: CGFloat = 0
    @State var circleColor: Color = .purple
    @State var appear = [false, false, false]
    @FocusState var focusField: Field?
    @EnvironmentObject var model: Model
    private let generator = UISelectionFeedbackGenerator()
    
    
    
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
                TextField("First Name", text: $viewModel.firstName)
                    .inputFieldStyle(icon: Image(systemName: "person.fill"))
                    .autocorrectionDisabled(true)
                    .focused($focusField, equals: .firstName)
                    .shadow(color: focusField == .firstName ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self){ value in
                        firstNameYPos = value
                        circlePosition = value
                        generator.selectionChanged()
                    }
                
                TextField("Last Name", text: $viewModel.lastName)
                    .inputFieldStyle(icon: Image(systemName: "person.fill"))
                    .autocorrectionDisabled(true)
                    .focused($focusField, equals: .lastName)
                    .shadow(color: focusField == .lastName ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self){ value in
                        lastNameYPos = value
                        generator.selectionChanged()
                    }
                
                
                TextField("Email", text: $viewModel.email)
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
                        generator.selectionChanged()
                    }
                
                SecureField("Password", text: $viewModel.password)
                    .inputFieldStyle(icon: Image(systemName: "key.fill"))
                    .textContentType(.password)
                    .focused($focusField, equals: .password)
                    .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self){ value in
                        passwordYPos = value
                        generator.selectionChanged()
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
                .buttonStyle(CustomButtonStyle(fieldsNotEmpty: viewModel.fieldsNotEmpty))
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
                .disabled(!viewModel.fieldsNotEmpty)
                
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
                    circleColor = .purple
                }else if newValue == .password{
                    circlePosition = passwordYPos
                    circleColor = .pink
                }else if newValue == .lastName{
                    circlePosition = lastNameYPos
                    circleColor = .pink
                }else if newValue == .firstName{
                    circlePosition = firstNameYPos
                    circleColor = .purple
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
