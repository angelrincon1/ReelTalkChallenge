//
//  SearchViewModel.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    
    func search() {
        print("Search the API with the given title: \(searchText)")
    }
}
