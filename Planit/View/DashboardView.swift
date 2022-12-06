//
//  DashboardView.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
//    @ObservedObject viewModel
     
    var body: some View {
        VStack{
            Text("Dashboard View")
            Button{
                AuthViewModel.shared.signout()
            }label:{
                Text("Log Out")
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
