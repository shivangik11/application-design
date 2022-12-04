//
//  Loginview.swift
//  Planit
//
//  Created by Shivangi on 09/11/22.
//

import SwiftUI

struct Loginview: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack{
            BackgroundGradientView()
            
            VStack{
                LogoView()
                    .padding(.bottom, 25)
                   
                    
                VStack(spacing: 20){
                    EmailTextField(text: $email)
                    PasswordSecureView(text: $password, placeholder: "Password")
                    }// end of Vstack
                .padding(.horizontal, 32)
                
                
                
                
            }// end of Vstack
            
            
            
        }// end of Zstack
    }
}






struct Loginview_Previews: PreviewProvider {
    static var previews: some View {
        Loginview()
    }
}
