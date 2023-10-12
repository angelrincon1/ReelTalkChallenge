//
//  MovieSelectionView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import SwiftUI

struct MovieSelectionView: View {
    @ObservedObject var UserVM: UserViewModel
    @ObservedObject var SearchVM: SearchViewModel
    @ObservedObject var OBManager: OnboardingManager
    
    var body: some View {
        ScrollView {
            VStack {
                StepView(step: OBManager.onboardingTag)
                    .frame(height: 5)
                    .padding(.leading, 80)
                    .padding(.trailing, 80)
                    .padding(.bottom)
                    .padding(.top)
                
                Text("Select your top 5 \n movies")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .padding(.bottom, 5)
                
                Text("\(UserVM.user.favMovies.count < 5 ? UserVM.user.favMovies.count : 5)/5 selected")
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 10)
                
                CustomSearchBarView(searchText: $SearchVM.searchText)
                    .padding(.leading)
                    .padding(.trailing)
                
                //scrollview for the lazivstack
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0, content: {
                        ForEach(sampleMoviePosterData) { poster in
                            PosterView(UserVM: UserVM, selected: UserVM.user.favMovies.contains(poster.title) ? true : false, title: poster.title, imageLink: poster.imageLink, type: poster.type)
                                .padding(5)
                        }
                    })
                    .padding()
                }
                .frame(width: .infinity, height: 400)
                .background(.clear)
                
                Button {
                    OBManager.nextPage()
                } label: {
                    VStack {
                        Text("Continue")
                            .foregroundStyle(UserVM.user.favMovies.count >= 5 ? Color.black:Color.white)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(UserVM.user.favMovies.count >= 5 ? Color("ReelTalkYellow"):Color.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
                .disabled(UserVM.user.favMovies.count >= 5 ? false:true)
                .padding(.top, 30)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    MovieSelectionView(UserVM: UserViewModel(user: sampleUser), SearchVM: SearchViewModel(), OBManager: OnboardingManager())
}
