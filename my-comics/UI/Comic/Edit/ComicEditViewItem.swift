//
//  ComicEditViewItem.swift
//  my-comics
//
//  Created by kagehito on 2021/02/23.
//

import Foundation
import Combine

/// 漫画編集Viewに表示するデータ。
///
///
/// Objectを適用しているモデルの値を直接使わず
/// (「Cannot modify managed objects outside of a write transaction」(変更はトランザクションの中で行え的なやつ)
/// と出たりする)、主にViewへの変更通知と表示を変えるためのデータとして扱う。
class ComicEditViewItem: ObservableObject, ComicEntityProtocol  {
    // idの変更通知は必要ない
    let id: ComicID
    @Published var title: String
    @Published var haveVolume: Int
    @Published var publishedVolume: Int
    @Published var nextReleaseDate: Date

    init(
        id: ComicID = "",
        title: String = "",
        haveVolume: Int = 1,
        publishedVolume: Int = 1,
        nextReleaseDate: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.haveVolume = haveVolume
        self.publishedVolume = publishedVolume
        self.nextReleaseDate = nextReleaseDate
    }
}
