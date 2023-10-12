//
//  WelcomeScreenViewModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import Foundation

class WelcomeScreenViewModel: ObservableObject {
    @Published var welcomeCompleted = false
    
    init(welcomeCompleted: Bool = false) {
        self.welcomeCompleted = welcomeCompleted
    }
    
    func completeWelcome() {
        self.welcomeCompleted = true
    }
    
}
