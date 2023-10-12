//
//  ProfileView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var UserVM: UserViewModel
    @ObservedObject var OBManager: OnboardingManager
    
    @State private var nameText: String = ""
    @State private var date = Date()
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Your profile")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .padding(.top, 100)
                
                ZStack {
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundStyle(Color.gray)
                    
                    Text(nameText.prefix(1).capitalized)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                }
                .padding(.bottom, 60)
                
                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            TextField("", text: $nameText)
                                .foregroundStyle(.white)
                        }
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 2)
                    }
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    
                    Text("You will be able to change your name later on the app.")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            DatePicker("label", selection: $date, displayedComponents: [.date])
                                .colorInvert()
                                .colorMultiply(.white)
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                            
                            Spacer()
                        }
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 2)
                    }
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    
                    Text("You will be able to change your name later on the app, and you can change many other things.")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                Button {
                    UserVM.user.DOB = self.date
                    UserVM.user.name = self.nameText
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
                .padding(.top, 150)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ProfileView(UserVM: UserViewModel(user: sampleUser), OBManager: OnboardingManager())
}
