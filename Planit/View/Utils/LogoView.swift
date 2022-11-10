//
//  LogoView.swift
//  Planit
//
//  Created by Shivangi on 09/11/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        VStack{
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("PLAN iT")
                .foregroundColor(.black)
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            LogoView()
        }
    }
}
