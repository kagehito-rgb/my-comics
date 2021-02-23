//
//  ComicDetailView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画詳細View
struct ComicDetailView: View {
    var item: ComicViewItem

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                Spacer().frame(height: 4)
                HStack {
                    Text("所持巻数:")
                    Text("\(item.haveVolume)巻")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Text("既刊:")
                    Text("\(item.publishedVolume)巻")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack {
                    Text("次巻予定日:")
                    DateTextView(
                        date: item.nextReleaseDate,
                        format: DateFormatBuilder().build()
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
            .navigationBarTitle(item.title)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
        }
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(item: ComicViewItem())
    }
}
