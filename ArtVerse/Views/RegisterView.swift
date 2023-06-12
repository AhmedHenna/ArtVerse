//
//  RegisterView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Register")
                .font(.largeTitle).bold()
            Text("Access hours of courses and tutorials for all your creative needs")
                .font(.headline)
            
            TextField("Email", text: $email)
                .inputFieldStyle(icon: "envelope.open.fill")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
               
            SecureField("Password", text: $password)
                .inputFieldStyle(icon: "key.fill")
                .textContentType(.password)
            
            
            Button {} label: {
                Text("Register account")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.customButton)
            .tint(.accentColor)
            .controlSize(.large)
            
            Divider()
            
            HStack {
                Text("Already have an account?")
                Button {} label: {
                    Text("**Log in**")
                }
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .accentColor(.secondary)
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
