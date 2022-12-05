//
//  PasswordSecureView.swift
//  Planit
//
//  Created by Shivangi on 04/12/22.
//

import SwiftUI

struct PasswordSecureView: View {
    
    @Binding var text: String
    let placeholder: String
    var body: some View {
        CustomSecureField(text: $text, placeholder: Text(placeholder))
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
        
    }
}

struct PasswordSecureView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            BackgroundGradientView()
            PasswordSecureView(text: .constant(""), placeholder: "Password")
        }
    }
    
}
    
