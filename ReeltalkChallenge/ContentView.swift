//
//  ContentView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var WSViewModel = WelcomeScreenViewModel()
    @ObservedObject var userVM = UserViewModel(user: sampleUser)
    @ObservedObject var OBManager = OnboardingManager()
    
    @State private var pageIndex = 0
    private let welcomeScreens = welcomeScreenSampleData
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "welcomeComplete") || WSViewModel.welcomeCompleted {
            Group {
                switch OBManager.onboardingTag {
                case 0: ProfileView(UserVM: userVM, OBManager: OBManager)
                    
                case 1: TONotificationsView(UserVM: userVM, OBManager: OBManager)
                    
                case 2: UserWelcomeView(UserVM: userVM, OBManager: OBManager)
                
                case 3: GenreSelectionView(UserVM: userVM, OBManager: OBManager)
                    
                case 4: MovieSelectionView(UserVM: userVM, SearchVM: SearchViewModel(), OBManager: OBManager)
                
                case 5: SeriesSelectionView(UserVM: userVM, SearchVM: SearchViewModel(), OBManager: OBManager)
                                        
                default:
                    BeKindView()
                }
            }
        } else {
            TabView (selection: $pageIndex) {
                ForEach(welcomeScreens) { wScreen in
                    WelcomeScreensView(WSViewModel: WSViewModel, welcomeScreen: wScreen)
                        .tag(wScreen.welcomeScreenNumber)
                }
                
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
