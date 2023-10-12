//
//  UserWelcomeView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/9/23.
//

import SwiftUI

struct UserWelcomeView: View {
    @ObservedObject var UserVM: UserViewModel
    @ObservedObject var OBManager: OnboardingManager
    
    var body: some View {
        VStack {
            Text("Welcome, \(UserVM.user.name)!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding()
            
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundStyle(Color.gray)
                .clipShape(.rect(cornerRadius: 20))
            
            Text("Let's get to know yoy better and personalize your experience!")
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .padding(.top, 80)
                .padding(.leading)
                .padding(.trailing)
            
            Button {
                OBManager.nextPage()
            } label: {
                VStack {
                    Text("Continue")
                        .foregroundStyle(Color.black)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                .background(Color("ReelTalkYellow"))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
            .padding(.top, 80)
            .padding(.bottom, 80)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    UserWelcomeView(UserVM: UserViewModel(user: sampleUser), OBManager: OnboardingManager())
}
