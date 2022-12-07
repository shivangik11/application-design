//
//  PlanButtonStack.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct PlanButtonStack: View {
    
    
    @ObservedObject var viewModel: planViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                PlanButton(buttonType: .all, viewModel: viewModel)
                
                PlanButton(buttonType: .Itenary, viewModel: viewModel)
                
                PlanButton(buttonType: .packing, viewModel: viewModel)
                
                PlanButton(buttonType: .travel, viewModel: viewModel)
                
                PlanButton(buttonType: .tickets, viewModel:viewModel)
                
                PlanButton(buttonType: .personal, viewModel:viewModel)
                
                PlanButton(buttonType: .extra, viewModel:viewModel)
            }
        }
    }
}

struct PlanButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        PlanButtonStack(viewModel: planViewModel())
    }
}

struct PlanButton: View{
    
    
    
    let buttonType: SelectedButton
    @ObservedObject var viewModel: planViewModel
    
    var body: some View{
        Button {
            viewModel.filterplanSelected = buttonType
            
            if viewModel.filterplanSelected != .all {
                viewModel.PlanFiltered = viewModel.Plan.filter{ plan in
                    return plan.planType == viewModel.filterplanSelected.rawValue
                }
            }else{
                viewModel.PlanFiltered = viewModel.Plan
            }
        }label: {
            Text("\(buttonType.getValue())")
                .foregroundColor(viewModel.filterplanSelected == buttonType ? . white: Color(.systemGray))
                .frame(width: 100, height: 40)
                .background(buttonType == viewModel.filterplanSelected ?
                            Color.gray : Color (.systemGray6))
                .cornerRadius(20)
        }
    }
}
