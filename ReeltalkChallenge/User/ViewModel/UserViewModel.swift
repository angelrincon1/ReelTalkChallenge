//
//  UserViewModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/9/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
