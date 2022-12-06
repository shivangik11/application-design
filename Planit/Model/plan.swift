//
//  plan.swift
//  Planit
//
//  Created by Shivangi on 05/12/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct plan: Identifiable, Decodable{
    @DocumentID var id: String? = UUID().uuidString
    let ownerID: String
    let title: String
    let description: String
    let planType: String
    var completed: Bool
    var documentID: String? = ""
    
    func getType() -> SelectedButton {
        if planType == "itenary"{
            return .Itenary
        } else if planType == "Travel"{
            return .travel
        } else if planType == "Packing"{
            return .packing
        } else if planType == "Tickets"{
            return.tickets
        } else if planType == "Personal"{
            return .personal
        } else {
            return .extra
        }
        
    }
}
