//
//  PurchaseHistoryView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画一覧View
struct ComicList: View {
    @StateObject var viewModel: ComicListViewModel = ComicListViewModel()

    var body: some View {
        List {
            ForEach(viewModel.comicEntities) { comic in
                NavigationLink(
                    destination: ComicDetailView(comic: comic)) {
                    ComicRow(
                        viewModel: viewModel,
                        comic: comic
                    )
                }
            }
        }
    }
}

struct ComicList_Previews: PreviewProvider {
    static var previews: some View {
        ComicList()
    }
}
