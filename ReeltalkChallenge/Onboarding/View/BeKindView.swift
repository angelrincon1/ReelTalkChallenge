//
//  BeKindView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/10/23.
//

import SwiftUI

struct BeKindView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("\(Image(systemName: "exclamationmark.square.fill")) Keep it reel, \n but be kind")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 5)
                    
                    
                    Text("Welcome, we're so exited to have you here at Reel Talk! \n \nAt Reel Talk, we believe that every individual brings something uqnique to our community. We are commited to fostering a safe and respectful enviroment for everyone to engage in exciting conversations. \n \nIn our mission to encourage respect and belongingness, we ask that you join us by adhering to our guidelines. We take these guidelines seriously, and failure to adhere to them may result in being banned from our community. Thanks for your cooperation. \n \nWith love, \nThe Reel Talk Team")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom)
                    
                }
                
                Spacer()
                
                Button {
                    print("Something")
                } label: {
                    VStack {
                        Text("I agree")
                            .foregroundStyle(Color.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(Color("ReelTalkYellow"))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
                
            }
            .padding(.top, 50)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BeKindView()
}
