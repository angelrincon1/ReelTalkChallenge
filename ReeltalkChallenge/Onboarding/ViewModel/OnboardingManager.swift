//
//  OnboardingManager.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import Foundation

class OnboardingManager: ObservableObject {
    @Published var onboardingTag: Int = 0
    
    func nextPage() {
        self.onboardingTag += 1
    }
}
