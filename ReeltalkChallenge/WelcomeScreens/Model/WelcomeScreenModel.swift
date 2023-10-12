//
//  WelcomeScreenModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import Foundation

struct WelcomeScreenModel: Identifiable, Equatable {
    let id = UUID()
    let welcomeScreenImage: String
    let welcomeScreenText: String
    let welcomeScreenNumber: Int
}

let welcomeScreenSampleData = [WelcomeScreenModel(welcomeScreenImage: "1", welcomeScreenText: "Welcome to Reel Talk, a community designed for true fil and TV Show fans", welcomeScreenNumber: 0), WelcomeScreenModel(welcomeScreenImage: "2", welcomeScreenText: "Discover and discuss your favority films, movies and shows", welcomeScreenNumber: 1), WelcomeScreenModel(welcomeScreenImage: "3", welcomeScreenText: "Let;s get started!", welcomeScreenNumber: 2)]
