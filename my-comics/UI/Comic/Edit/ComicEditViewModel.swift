//
//  ComicEditViewModel.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

protocol ComicEditViewModelProtocol {
    func addNew(item: ComicEditViewItem) -> Void
    func update(item: ComicEditViewItem) -> Void
}

class ComicEditViewModel: ObservableObject {
    @Published var comicItem: ComicEditViewItem = ComicEditViewItem()
    let repository: ComicRepositoryProtocol

    init() {
        self.repository = ComicRepository(provider: RealmProvider.shared)
    }
}

extension ComicEditViewModel: ComicEditViewModelProtocol {

    func addNew(item: ComicEditViewItem) {
        let entity = ComicEntity(
            id: UUID().uuidString,
            title: item.title,
            haveVolume: item.haveVolume,
            publishedVolume: item.publishedVolume,
            nextReleaseDate: item.nextReleaseDate
        )
        repository.addNew(entity: entity)
    }

    func update(item: ComicEditViewItem) {
        let newEntity = ComicEntity(
            id: item.id,
            title: item.title,
            haveVolume: item.haveVolume,
            publishedVolume: item.publishedVolume,
            nextReleaseDate: item.nextReleaseDate
        )
        repository.update(id: item.id, newEntity: newEntity)
    }

    func setItem(id: ComicID) {
        guard let entity = repository.getByID(id: id) else { return }
        self.comicItem = ComicEditViewItem(
            id: entity.id,
            title: entity.title,
            haveVolume: entity.haveVolume,
            publishedVolume: entity.publishedVolume,
            nextReleaseDate: entity.nextReleaseDate
        )
    }
}
