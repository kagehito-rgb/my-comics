//
//  RealmComicRepositoryProtocol.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

/// ComicRepositoryを示すプロトコル。
protocol ComicRepositoryProtocol {
    /// Realmオブジェクトの提供者
    var provider: RealmProviderProtocol { get }
    /// モバイルDBで保持するComic(漫画)の全データを取得
    func all() -> Results<ComicEntity>
    /// Comic(漫画)データの追加
    func add(entity: ComicEntity) -> Void
    /// Comic(漫画)データの更新
    func update(entity: ComicEntity) -> Void
    /// Comic(漫画)データの削除
    func delete(entity: ComicEntity) -> Void
    /// 追加されるレコードのIDを取得
    func newID() -> ComicID
    /// 指定したIDに紐づくComic(漫画)データの取得
    func getByID(id: ComicID) -> Results<ComicEntity>
}
