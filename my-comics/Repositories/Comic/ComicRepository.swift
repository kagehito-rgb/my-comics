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
        return realm.objects(ComicEntity.self).sorted(byKeyPath: ComicEntity.primaryKey()!, ascending: false)
    }

    func add(entity: ComicEntity) -> Void {
        try! realm.write {
            realm.add(entity)
        }
    }

    func update(entity: ComicEntity) -> Void {
        try! realm.write {
            realm.add(entity, update: .modified)
        }
    }

    func delete(entity: ComicEntity) -> Void {
        try! realm.write {
            realm.delete(entity)
        }
    }

    func newID() -> ComicID {
        return (all().first?.id ?? 0) + 1
    }
}
