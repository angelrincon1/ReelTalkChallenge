//
//  TagView.swift
//  ReeltalkChallenge
//
//  Created by Angel Rincon on 10/10/23.
//

import SwiftUI

struct TagView: View {
    @ObservedObject var UserVM: UserViewModel
    
    @State var tags: [TagViewItem]
    @State private var totalHeight = CGFloat.zero
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            ForEach(tags.indices) { index in
                item(for: tags[index].title, isSelected: tags[index].isSelected)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tags[index].title == self.tags.last!.title {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tags[index].title == self.tags.last!.title {
                            height = 0 // last item
                        }
                        return result
                    }).onTapGesture {
                        tags[index].isSelected.toggle()
                        if UserVM.user.favGenres.contains("\(tags[index].title)") {
                            let genreIndex = UserVM.user.favGenres.firstIndex(of: "\(tags[index].title)")
                            UserVM.user.favGenres.remove(at: genreIndex!)
                        } else {
                            UserVM.user.favGenres.append(tags[index].title)
                        }
                    }
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func item(for text: String, isSelected: Bool) -> some View {
        Text(text)
            .foregroundColor(isSelected ? Color.black : Color.white)
            .fontWeight(.medium)
            .font(.title2)
            .padding()
            .lineLimit(1)
            .background(isSelected ? Color.white : Color.black)
            .frame(height: 36)
            .cornerRadius(18)
            .overlay(Capsule().stroke(Color.white, lineWidth: 1))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}


#Preview {
    TagView(UserVM: UserViewModel(user: sampleUser), tags: [TagViewItem(title: "ff", isSelected: false), TagViewItem(title: "yyhuuuh", isSelected: false), TagViewItem(title: "kjhgdtfyucscdsdcsghuihu", isSelected: true), TagViewItem(title: "nbyvyvuyv", isSelected: false)])
}
