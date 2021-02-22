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
    func update(entity: ComicEntity) -> Void
    /// Comic(漫画)データの削除
    func delete(entity: ComicEntity) -> Void
}
