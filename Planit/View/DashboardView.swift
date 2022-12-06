//
//  DashboardView.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    @State var searchtext: String = ""
    
   @ObservedObject var viewModel = planViewModel()
     
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text("PLan-it")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                } //end of Hstack
                        .overlay{
                            HStack{
                                Spacer()
                                Button{
                                    
                                }label: {
                                    Text("Logout")
                                        .foregroundColor(Color(.systemGray))
                                }
                                .padding (.trailing)
                            }
                        }// end of HStack Overlay
                SearchBarView(searchText: $searchtext)
                    .padding()
                
                }// end of Vstack
            } // end of Zstack
            
        }
    }


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
