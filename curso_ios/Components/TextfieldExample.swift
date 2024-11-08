//
//  TextfieldExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct TextfieldExample: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("oldValue: \(oldValue)")
                    print("newValue: \(newValue)")
                    print("----------------------")
                }
            
            SecureField("Password", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("oldValue: \(oldValue)")
                    print("newValue: \(newValue)")
                    print("----------------------")
                }
            
            Button("Login") {
                
            }
        }
    }
}

#Preview {
    TextfieldExample()
}
