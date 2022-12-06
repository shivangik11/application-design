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
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView{
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
                    
                    HStack {
                        Spacer()
                        Button{
                            //foregt password
                        } label: {
                            Text("Forget Password?")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 27)
                        }
                    }// end of HStack
                    
                    //                Spacer()
                    
                    Button{
                        // Signin action
                        viewModel.login(withEmail: email, password: password)
                    }label: {
                        AuthenticateButton(text: "Sign In")
                            .padding()
                        
                        
                    }
                    NavigationLink(
                        destination: SignupView()
                        .navigationBarHidden(true),
                        label:{
                            HStack{
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            }
                            )
                    .padding(.bottom, 16)
                    
                }// end of Vstack
                .padding(.top, -44)
                
                
            }// end of Zstack
        }
    }
    
    
    
    
    
    
    struct Loginview_Previews: PreviewProvider {
        static var previews: some View {
            Loginview()
        }
    }
}
