//
//  ComicEditViewModel.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation

protocol ComicEditViewModelProtocol {
    func newID() -> ComicID
    func add(entity: ComicEntity) -> Void
    func update(entity: ComicEntity) -> Void
}

class ComicEditViewModel: ObservableObject {

    let repository: ComicRepositoryProtocol

    init() {
        self.repository = ComicRepository(provider: RealmProvider.shared)
    }
}

extension ComicEditViewModel: ComicEditViewModelProtocol {

    func newID() -> ComicID {
        repository.newID()
    }

    func add(entity: ComicEntity) {
        repository.add(entity: entity)
    }

    func update(entity: ComicEntity) {
        repository.update(entity: entity)
    }
}
