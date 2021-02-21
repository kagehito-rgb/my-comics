//
//  ComicDetailView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画詳細View
struct ComicDetailView: View {
    // TODO: - あとでこの辺はViewModel経由で取得・更新するように
    @State var titleText = "漫画タイトル"
    @State var haveVolume = 10
    @State var nowVolume = 11
    @State var nextReleaseDate = Date()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                Spacer().frame(height: 4)
                HStack {
                    Text("所持巻数:")
                    Text("\(haveVolume)巻")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Text("既刊:")
                    Text("\(nowVolume)巻")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Text("次巻予定日:")
                    DateTextView(date: nextReleaseDate)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
            .navigationBarTitle(titleText)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
        }
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView()
    }
}
