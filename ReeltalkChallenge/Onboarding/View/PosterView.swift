//
//  PosterView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/11/23.
//

import SwiftUI

struct PosterView: View {
    @ObservedObject var UserVM: UserViewModel
    
    @State var selected: Bool
    @State var title: String
    @State var imageLink: String
    @State var type: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .overlay {
                        if selected {
                            RoundedRectangle(cornerRadius: 3).stroke(Color("ReelTalkYellow"), lineWidth: 3)
                        }
                    }
                    .foregroundStyle(.white)
                
                if selected {
                    VStack {
                        HStack {
                            Spacer()
                            
                            ZStack {
                                Circle()
                                    .foregroundStyle(Color("ReelTalkYellow"))
                                
                                Image(systemName: "checkmark")
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 30, height: 30)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                    
            }
            .frame(width: 150, height: 200)
            
            Text(title)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(.leading)
                .padding(.trailing)
                
            Spacer()
        }
        .onTapGesture {
            selected.toggle()
            if type == "movie" {
                if UserVM.user.favMovies.contains("\(title)") {
                    let movieIndex = UserVM.user.favMovies.firstIndex(of: "\(title)")
                    UserVM.user.favMovies.remove(at: movieIndex!)
                } else {
                    UserVM.user.favMovies.append(title)
                }
            } else {
                if UserVM.user.favSeries.contains("\(title)") {
                    let movieIndex = UserVM.user.favSeries.firstIndex(of: "\(title)")
                    UserVM.user.favSeries.remove(at: movieIndex!)
                } else {
                    UserVM.user.favSeries.append(title)
                }
            }
        }
    }
}

#Preview {
    PosterView(UserVM: UserViewModel(user: sampleUser), selected: true, title: "La carrera de los caballos mochos", imageLink: "", type: "series")
}
