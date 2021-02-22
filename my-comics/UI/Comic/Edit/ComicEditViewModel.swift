//
//  ComicEditViewModel.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation

protocol ComicEditViewModelProtocol {
    func addNew(entity: ComicEntity) -> Void
    func update(entity: ComicEntity) -> Void
}

class ComicEditViewModel: ObservableObject {
    @Published var comic: ComicEntity

    let repository: ComicRepositoryProtocol

    init(comic: ComicEntity) {
        self.repository = ComicRepository(provider: RealmProvider.shared)
        self.comic = comic
    }
}

extension ComicEditViewModel: ComicEditViewModelProtocol {

    func addNew(entity: ComicEntity) {
        repository.addNew(entity: entity)
    }

    func update(entity: ComicEntity) {
        repository.update(entity: entity)
    }
}
