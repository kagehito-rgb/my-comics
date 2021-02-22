//
//  ComicEntity.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

/// 当アプリにおいて漫画を示すプロトコル。
protocol ComicEntityProtocol: Entity, Identifiable {
    /// 漫画に紐づくID
    var id: ComicID { get }
    /// 漫画のタイトル
    var title: String { get }
    /// 所持している巻数
    var haveVolume: Int { get }
    /// 既刊の巻数
    var publishedVolume: Int { get }
    /// 次巻発売予定日
    var nextReleaseDate: Date { get }
}

/// 当アプリにおける漫画のエンティティ。
/// - NOTE
/// モバイルDBに保存される事を想定している。
class ComicEntity: Object, ComicEntityProtocol {
    @objc dynamic var id: ComicID
    @objc dynamic var title: String
    @objc dynamic var haveVolume: Int
    @objc dynamic var publishedVolume: Int
    @objc dynamic var nextReleaseDate: Date

    init(
        id: ComicID,
        title: String,
        haveVolume: Int,
        publishedVolume: Int,
        nextReleaseDate: Date
    ) {
        self.id = id
        self.title = title
        self.haveVolume = haveVolume
        self.publishedVolume = publishedVolume
        self.nextReleaseDate = nextReleaseDate
    }
}
