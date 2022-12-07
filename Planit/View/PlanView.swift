//
//  PlanView.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct PlanView: View {
    
    
    var plan: plan
    
    @ObservedObject var viewModel: planViewModel
    
    var body: some View {
        HStack{
            Button{
                if plan.completed{
                    viewModel.unCompleteplan(PlanID: plan.documentID ?? "")
                    } else {
                        viewModel.completeplan(PlanID: plan.documentID ?? "" )
                    
                }
                
            }label: {
                Image(systemName: plan.completed ? "checkmark,square, fill":
                "square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color.gray)
            }
            VStack(alignment: .leading,spacing: 5){
                Text (plan.title)
                    .font(.system(size: 18))
                
                if plan.description != ""{
                    HStack{
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .foregroundColor(Color.gray)
                        
                        Text("\(plan.description)")
                            .font(.system(size: 14))
                            .foregroundColor(Color.gray)
                    }
                }
                
                
            }//end of Vstack
            .padding(.leading,10)
            
            Spacer()
            Button{
                
            }label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .frame(width:22, height: 22)
            }
            
        }//end of HStack
        
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 70)
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView(plan: plan01, viewModel: planViewModel())
    }
}
