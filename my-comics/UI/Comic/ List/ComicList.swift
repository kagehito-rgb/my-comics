//
//  PurchaseHistoryView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画一覧View
struct ComicList: View {
    var body: some View {
        List {
            ForEach(0...10, id: \.self) { _ in
                ComicRow()
            }
        }
    }
}

struct ComicList_Previews: PreviewProvider {
    static var previews: some View {
        ComicList()
    }
}
