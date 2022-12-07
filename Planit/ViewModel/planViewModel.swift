//
//  planViewModel.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI
import Firebase


class planViewModel: ObservableObject{
    
    @Published var Plan = [plan]()
    @Published var showCreateplanView: Bool = false
    @Published var filterplanSelected: SelectedButton = .all
    @Published var PlanFiltered = [plan]()
    
    
    init() {
        loadplans()
        
    }
    func loadplans(){
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let query = COLLECTION_USERS.document(user.id ?? "").collection("Plan-it").order(by: "completed", descending: false)
        
        query.getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.Plan = documents.compactMap({try? $0.data(as: plan.self) })
            
            for index in stride(from: 0, to: self.Plan.count, by:1){
                self.Plan[index].documentID = documents[index].documentID
            }
            self.PlanFiltered = self.Plan
            
            if self.filterplanSelected != .all{
                self.PlanFiltered = self.Plan.filter{ Plan in
                    return Plan.planType == self.filterplanSelected.rawValue
                    
                }
            } else{
                self.PlanFiltered = self.Plan
            }
        }
    }
    func uploadplan(Plan: plan){
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data : [String: Any] = ["title": Plan.title,
                                    "description": Plan.description,
                                    "PlanType": Plan.planType,
                                    "completed": Plan.completed,
                                    "ownerUid": user.id ?? "" ]
        
        COLLECTION_USERS.document(user.id ?? "").collection("Plan-it").addDocument(data: data){ error in
            if let error = error {
                print("DEBUG:\(error.localizedDescription)")
                return
            }
            self.loadplans()
        }
    }
    
    func deleteplan(PlanID: String){
        guard let uid = AuthViewModel.shared.userSesssion?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("Plan-it").document(PlanID).delete() { error in
            if let error = error {
                print("DEBUG:\(error.localizedDescription)")
                return
            }
            self.loadplans()
        }
    }
    
    func completeplan(PlanID: String){
        guard let uid = AuthViewModel.shared.userSesssion?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("Plan-it").document(PlanID).updateData(["comppleted": true]) { error in
            if let error = error {
                print("DEBUG:\(error.localizedDescription)")
                return
            }
            self.loadplans()
        }
        }
        func unCompleteplan(PlanID: String){
            guard let uid = AuthViewModel.shared.userSesssion?.uid else { return }
            
            COLLECTION_USERS.document(uid).collection("Plan-it").document(PlanID).updateData(["comppleted": false]) { error in
                if let error = error {
                    print("DEBUG:\(error.localizedDescription)")
                    return
                }
                self.loadplans()
            }
        }
    }

