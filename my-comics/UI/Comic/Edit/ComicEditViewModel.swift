//
//  ComicEditViewModel.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

protocol ComicEditViewModelProtocol {
    func setItem(id: ComicID) -> Void
    func addNew(item: ComicViewItem) -> Void
    func update(item: ComicViewItem) -> Void
}

class ComicEditViewModel: ObservableObject {
    @Published var comicItem: ComicViewItem = ComicViewItem()
    let repository: ComicRepositoryProtocol

    init() {
        self.repository = ComicRepository(provider: RealmProvider.shared)
    }
}

extension ComicEditViewModel: ComicEditViewModelProtocol {

    func addNew(item: ComicViewItem) {
        let entity = ComicEntity(
            id: UUID().uuidString,
            title: item.title,
            haveVolume: item.haveVolume,
            publishedVolume: item.publishedVolume,
            nextReleaseDate: item.nextReleaseDate
        )
        repository.addNew(entity: entity)
    }

    func update(item: ComicViewItem) {
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
        self.comicItem = ComicViewItem(
            id: entity.id,
            title: entity.title,
            haveVolume: entity.haveVolume,
            publishedVolume: entity.publishedVolume,
            nextReleaseDate: entity.nextReleaseDate
        )
    }
}
