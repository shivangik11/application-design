//
//  AppUser.swift
//  Planit
//
//  Created by Shivangi on 05/12/22.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable{
    
    @DocumentID var id: String?
    let uid: String
    let firstname: String
    let lastName : String
    let email: String
    
    var isCurrentUser: Bool{
        return AuthViewModel.shared.userSesssion?.uid == id
    }
}

