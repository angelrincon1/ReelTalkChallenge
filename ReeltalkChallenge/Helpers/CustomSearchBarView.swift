//
//  CustomSearchBarView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import SwiftUI

struct CustomSearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            
            TextField("Search to add more", text: $searchText)
                        
            Spacer()
        }
        .font(.title3)
        .foregroundStyle(.gray)
        .frame(height: 50)
        .background(.white)
        .cornerRadius(30)
    }
}

#Preview {
    CustomSearchBarView(searchText: .constant(""))
}
