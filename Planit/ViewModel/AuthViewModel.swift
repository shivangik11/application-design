//
//  AuthViewModel.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject{
    
    @Published var userSesssion: User? //FirebaseUser
    @Published var currentUser: AppUser?
    
    static let shared = AuthViewModel()
    
    init(){
        userSesssion = Auth.auth().currentUser
        fetchUser()
    }
    func fetchUser(){
        guard let uid = userSesssion?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument {snapshot, _ in
            guard let user = try? snapshot?.data(as: AppUser.self) else { return }
            self.currentUser = user
            
        }
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print ("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSesssion = user
            self.fetchUser()
        }
    }
    func register(withEmail email: String, password: String, firstName: String, lastName: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print ("DEBUG: Register failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data  = ["uid": user.uid,
                         "firstName": firstName,
                         "lastName": lastName,
                         "email": email]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("Successfully uploaded data")
                self.userSesssion = user
                self.fetchUser()
            }
        }
    }
    
    func signout(){
        self.userSesssion = nil
        try? Auth.auth().signOut()
        }
    
    func resetPassword(){
        
    }
}
