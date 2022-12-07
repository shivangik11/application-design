//
//  DashboardView.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    
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
                
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                
                PlanButtonStack (viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                
                if viewModel.PlanFiltered.isEmpty{
                    Text("Get started!")
                        .padding(.top)
                }
                
                ScrollView {
                    
                    VStack(spacing: 15) {
                        //ForEach(viewModel.PlanFiltered, id: \.id) { plan in
                        //
                        //
                        //                            if searchText == "" {
                        //                                PlanView(Plan: (ownerUid: plan.ownerUid, title: plan.title, description: plan.description, planType: plan.planType, completed: plan.completed, documentID: plan.documentID), viewModel: viewModel)
                        //
                        //                            }
                        //                        } else {
                        //                            if
                        //                            plan.title.lowercased().contains(searchText.lowercased()) ||
                        //                            plan.description.lowercased().contains(searchText.lowercased()) {
                        //                            PlanView(Plan: plan(ownerUid: plan.ownerUid, title: plan.title, description: plan.description, planType: plan.planType, completed: plan.completed, documentID: plan.documentID), viewModel: viewModel)
                        //
                        //
                        //                            } // of if statement
                        
                        
                        
                        //                         } // end of foreach
                        //                        }// end of Vstack
                        //
                                           } // end of scroll view
                    }// end of Vstack
                    
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    viewModel.showCreateplanView = true
                                } label: {
                                    Image (systemName: "plus")
                                        .padding()
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 30))
                                        .frame(width: 60, height: 60)
                                        .background(Color.gray)
                                        .cornerRadius(30)
                                }
                                .padding(20)
                            }
                        }
                    )
                    
                    if viewModel.showCreateplanView {
                        BlankView()
                        CreatePlanView(user: user, viewModel: viewModel)
                    }
                    
                } // end of Zstack
            }
            
        }
        
        
        struct DashboardView_Previews: PreviewProvider {
            static var previews: some View {
                DashboardView(user: appUser01)
            }
        }
        
        
    }
