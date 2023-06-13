//
//  LogInView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/13/23.
//

import SwiftUI

struct LogInView: View {
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
    @FocusState var focusField: Field?
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Log In")
                .font(.largeTitle).bold()
            Text("Access hours of courses and tutorials for all your creative needs")
                .font(.headline)
            
            TextField("Email", text: $email)
                .inputFieldStyle(icon: "envelope.open.fill")
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
                }
            
            SecureField("Password", text: $password)
                .inputFieldStyle(icon: "key.fill")
                .textContentType(.password)
                .focused($focusField, equals: .password)
                .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                .overlay(geometry)
                .onPreferenceChange(CirclePreferenceKey.self){ value in
                    passwordYPos = value
                }

            Button {} label: {
                Text("Log in")
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
                Text("No account yet?")
                Button {
                    model.selectedModal = .register
                } label: {
                    Text("**Register**")
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
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
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
    }
    
    var geometry: some View{
        GeometryReader{ proxy in
            Color.clear.preference(key: CirclePreferenceKey.self,
                                   value: proxy.frame(in: .named("container")).minY)
        }
    }
    
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
            .environmentObject(Model())
    }
}
