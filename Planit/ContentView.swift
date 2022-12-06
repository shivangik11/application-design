 //
//  ContentView.swift
//  Planit
//
//  Created by Shivangi on 09/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group{
            if viewModel.userSesssion == nil {
                Loginview()
                
            } else {
                if let user  = viewModel.currentUser{
                    DashboardView(user: user)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
