//
//  SplashScreen.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/8/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("ReelTalkSplashScreen")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                    .padding()
                
                
                Text("REEL TALK")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            .padding(.top, 150)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
