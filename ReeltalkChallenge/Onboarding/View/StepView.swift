//
//  StepView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import SwiftUI

struct StepView: View {
    @State var step: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundStyle(step == 3 ? Color("ReelTalkYellow"):.gray)
            
            Rectangle()
                .foregroundStyle(step == 4 ? Color("ReelTalkYellow"):.gray)

            Rectangle()
                .foregroundStyle(step == 5 ? Color("ReelTalkYellow"):.gray)

        }
    }
}

#Preview {
    StepView(step: 2)
}
