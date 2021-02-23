//
//  ComicRepository.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

// 当アプリにおけるComic(漫画)のデータ操作を担うモジュール。
// TODO: - Realm操作失敗時のハンドリング
class ComicRepository: ComicRepositoryProtocol {
    var provider: RealmProviderProtocol
    let realm: Realm

    init(
        provider: RealmProviderProtocol
    ) {
        self.provider = provider
        self.realm = try! provider.provide()
    }

    func all() -> Results<ComicEntity> {
        return realm.objects(ComicEntity.self)
    }

    func addNew(entity: ComicEntity) -> Void {
        try! realm.write {
            realm.add(entity)
        }
    }

    func update(id: ComicID, newEntity: ComicEntity) -> Void {
        guard let entity = getByID(id: id) else { return }
        try! realm.write {
            entity.overWrite(data: newEntity)
            realm.add(entity, update: .modified)
        }
    }

    func delete(id: ComicID) -> Void {
        guard let entity = getByID(id: id) else { return }
        try! realm.write {
            realm.delete(entity)
        }
    }

    func getByID(id: ComicID) -> Results<ComicEntity>.Element? {
        realm.objects(ComicEntity.self).first(where: { $0.id == id })
    }
}
