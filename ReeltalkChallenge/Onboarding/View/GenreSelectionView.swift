//
//  GenreSelectionView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/10/23.
//

import SwiftUI

struct GenreSelectionView: View {
    @ObservedObject var UserVM: UserViewModel
    @ObservedObject var OBManager: OnboardingManager
    
    var body: some View {
        VStack {
            StepView(step: OBManager.onboardingTag)
                .frame(height: 5)
                .padding(.leading, 80)
                .padding(.trailing, 80)
                .padding(.bottom, 50)
                .padding(.top)
                        
            Text("Select your top 3 genres for movies and TV")
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.medium)
                .padding(.leading, 40)
                .padding(.trailing, 40)
            
            Text("\(UserVM.user.favGenres.count < 3 ? UserVM.user.favGenres.count:3)/3 selected")
                .foregroundStyle(.gray)
                .font(.headline)
                .fontWeight(.medium)
                .padding()
            
            TagView(UserVM: UserVM, tags: genreTagsSample)
                .padding(.leading)
                .padding(.trailing)
            
            Spacer()
            
            Button {
                OBManager.nextPage()
            } label: {
                VStack {
                    Text("Continue")
                        .foregroundStyle(UserVM.user.favGenres.count >= 3 ? Color.black:Color.white)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                .background(UserVM.user.favGenres.count >= 3 ? Color("ReelTalkYellow"):Color.gray)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
            .disabled(UserVM.user.favGenres.count >= 3 ? false:true)
            .padding(.bottom, 70)
                        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    GenreSelectionView(UserVM: UserViewModel(user: sampleUser), OBManager: OnboardingManager())
}
