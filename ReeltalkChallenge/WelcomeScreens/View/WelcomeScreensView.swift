//
//  WelcomeScreensView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import SwiftUI

struct WelcomeScreensView: View {
    @ObservedObject var WSViewModel: WelcomeScreenViewModel
    
    var welcomeScreen: WelcomeScreenModel
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundStyle(Color.gray)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.top, 50)
            
            Text(welcomeScreen.welcomeScreenText)
                .frame(height: 50)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 70)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            HStack {
                Image(systemName: "circle.fill")
                    .font(.caption2)
                    .foregroundStyle(welcomeScreen.welcomeScreenNumber == 0 ? Color("ReelTalkYellow"):Color.white)
                
                Image(systemName: "circle.fill")
                    .font(.caption2)
                    .foregroundStyle(welcomeScreen.welcomeScreenNumber == 1 ? Color("ReelTalkYellow"):Color.white)

                
                Image(systemName: "circle.fill")
                    .font(.caption2)
                    .foregroundStyle(welcomeScreen.welcomeScreenNumber == 2 ? Color("ReelTalkYellow"):Color.white)
            }
            .padding(.top, 30)
            
            if welcomeScreen.welcomeScreenNumber == 2 {
                Button {
                    UserDefaults().setValue(false, forKey: "welcomeComplete")
                    WSViewModel.completeWelcome()
                    
                } label: {
                    VStack {
                        Text("Continue")
                            .foregroundStyle(Color.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color("ReelTalkYellow"))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 60)
                    
                }
            }
            
            HStack {
                Text("Already have an account?")
                    .foregroundStyle(Color.white)
                
                Text("Log In")
                    .foregroundStyle(Color("ReelTalkYellow"))

            }
            .fontWeight(.semibold)
            .padding(.top, welcomeScreen.welcomeScreenNumber == 2 ? 20: 80)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    WelcomeScreensView(WSViewModel: WelcomeScreenViewModel(), welcomeScreen: WelcomeScreenModel(welcomeScreenImage: "we", welcomeScreenText: "asd", welcomeScreenNumber: 1))
}
