//
//  TONotificationsView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/9/23.
//

import SwiftUI

struct TONotificationsView: View {
    @ObservedObject var UserVM: UserViewModel
    @ObservedObject var OBManager: OnboardingManager

    var body: some View {
        VStack {
            Text("Turn on push notifications")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.leading, 80)
                .padding(.trailing, 80)
            
            Text("Stay in the loop with worldwide enthusiasts in discussions.")
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .padding()
            
            Text("Get instant alets on upcoing movies for fan faviorite recommentations and exciting movie experts.")
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .padding()
            
            Spacer()
            
            Text("Turn on notifications and don't miss anything never.")
                .multilineTextAlignment(.center)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .padding()
            
            VStack {
                Button {
                    OBManager.onboardingTag += 1
                } label: {
                    VStack {
                        Text("Turn on notifications")
                            .foregroundStyle(Color.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(Color("ReelTalkYellow"))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
                .onTapGesture {
                    UserVM.user.notifications = true
                }
                
                Button {
                    OBManager.nextPage()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(
                                Color.gray,
                                style: StrokeStyle(lineWidth: 1.0)
                            )
                        
                        Text("Not now")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
                .onTapGesture {
                    UserVM.user.notifications = false
                }
            }
            .padding(.top)
            .padding(.bottom, 50)
        }
        .background(Color.black)
    }
}

#Preview {
    TONotificationsView(UserVM: UserViewModel(user: sampleUser), OBManager: OnboardingManager())
}
