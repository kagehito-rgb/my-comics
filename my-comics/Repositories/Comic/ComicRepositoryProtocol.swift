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
    /// Comic(漫画)データの新規追加
    func addNew(entity: ComicEntity) -> Void
    /// Comic(漫画)データの更新
    func update(id: ComicID, newEntity: ComicEntity) -> Void
    /// Comic(漫画)データの削除
    func delete(id: ComicID) -> Void
    /// 指定したIDと一致するComic(漫画)データを取得
    func getByID(id: ComicID) -> Results<ComicEntity>.Element?
}
