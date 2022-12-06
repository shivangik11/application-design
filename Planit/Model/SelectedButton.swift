//
//  SelectedButton.swift
//  Planit
//
//  Created by Shivangi on 05/12/22.
//

import Foundation

enum SelectedButton: String{
    
    case all = "All"
    case Itenary = "Itenary"
    case packing = "Packing"
    case travel = "Travel"
    case tickets = "Tickets"
    case personal = "Personal"
    case extra = "EXtra"
    
    func getValue() -> String{
        return self.rawValue
    }
}
