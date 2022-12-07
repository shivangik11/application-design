//
//  CreatePlanView.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct CreatePlanView: View {
    
    let user: AppUser
    
    @State var title: String = ""
    @State var PlanDescription: String = ""
    @State var PlanType: String = ""
    @State var completed: Bool = false
    
    @ObservedObject var viewModel: planViewModel
   
    var body: some View {
        VStack{
            
            PlanButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            PlanTextField(text: $title, placeholder: "Planit")
                .padding([.horizontal, .bottom])
            
            CustomTextField(text: $PlanDescription, placeholder: Text("Description"),    imageName: "line.3.horizontal",
                            foregroundColor: .gray)
                            .padding([.horizontal, .bottom])
            HStack{
                Button{
                    viewModel.uploadplan(Plan: plan(ownerUid: user.id ?? "", title: title, description: PlanDescription, planType: viewModel.filterplanSelected == .all ? "Extra" :
                                                        viewModel.filterplanSelected.rawValue, completed: false))
                    viewModel.showCreateplanView = false
                    
                }label: {
                    CreatePlanButton()
                }
                Button{
                    viewModel.showCreateplanView = false
                }label: {
                    CancelPlanButton()
                }
                
                
            }
            Spacer()
            
        }//end of Vstack
        .frame(width: UIScreen.main.bounds.size.width - 50, height: 280)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreatePlanView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlanView(user: appUser01, viewModel: planViewModel())
    }
}


struct CreatePlanButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(Color.black.opacity(0.6))
            .clipShape(Capsule())
    }
}
struct CancelPlanButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
    }
}
