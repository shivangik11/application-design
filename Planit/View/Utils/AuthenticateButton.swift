//
//  AuthenticateButton.swift
//  Planit
//
//  Created by Shivangi on 04/12/22.
//

import SwiftUI

struct AuthenticateButton: View {
    
        let text: String
        
        var body: some View {
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 360, height: 50)
                .background(Color.white)
                .clipShape(Capsule())
            
        }
    }
    
    struct AuthenticateButton_Previews: PreviewProvider {
        static var previews: some View {
            AuthenticateButton(text: "Sign in")
        }
    }

