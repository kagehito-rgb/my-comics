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
            ForEach(viewModel.items) { item in
                NavigationLink(
                    destination: ComicDetailView(item: item)) {
                    ComicRow(
                        viewModel: viewModel,
                        item: item
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
