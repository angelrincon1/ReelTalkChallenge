//
//  UserModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/9/23.
//

import Foundation

struct User {
    let id = UUID()
    var name: String
    var DOB: Date
    var notAct: Bool
    var notifications: Bool
    var favGenres: [String]
    var favMovies: [String]
    var favSeries: [String]

    init(name: String, DOB: Date, notAct: Bool, notifications: Bool, favGenres: [String], favMovies: [String], favSeries: [String]) {
        self.name = name
        self.DOB = DOB
        self.notAct = notAct
        self.notifications = notifications
        self.favGenres = favGenres
        self.favMovies = favMovies
        self.favSeries = favSeries
    }
}

let sampleUser = User(name: "Angel", DOB: Date(), notAct: false, notifications: false, favGenres: [], favMovies: [], favSeries: [])
