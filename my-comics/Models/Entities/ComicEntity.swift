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
    @objc dynamic var id: ComicID = 0
    @objc dynamic var title: String = ""
    @objc dynamic var haveVolume: Int = 1
    @objc dynamic var publishedVolume: Int = 1
    @objc dynamic var nextReleaseDate: Date = Date()

    override class func primaryKey() -> String? { "id" }
    override class func indexedProperties() -> [String] { ["id"] }
}
