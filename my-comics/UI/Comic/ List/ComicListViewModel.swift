//
//  HomeViewModel.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import Combine
import RealmSwift

protocol ComicListViewModelProtocol {
    func all() -> Results<ComicEntity>
    func delete(entity: ComicEntity) -> Void
}

class ComicListViewModel: ObservableObject {
    @Published var comicEntities: Results<ComicEntity>
    private var notificationTokens: [NotificationToken] = []

    let repository: ComicRepositoryProtocol

    init() {
        self.repository = ComicRepository(provider: RealmProvider.shared)
        self.comicEntities = repository.all()
        subscribeMobileDB()
    }
}

//  MARK: - ComicListViewModelProtocol
extension ComicListViewModel: ComicListViewModelProtocol {
    func all() -> Results<ComicEntity> { repository.all() }
    func delete(entity: ComicEntity) -> Void { repository.delete(entity: entity) }
}

//  MARK: - MobileDB
extension ComicListViewModel {
    private func subscribeMobileDB() {
        notificationTokens.append(comicEntities.observe { change in
            switch change {
            case let .initial(results):
                self.comicEntities = results
            case let .update(results, _, _, _):
                self.comicEntities = results
            case let .error(error):
                print(error.localizedDescription)
            }
        })
    }
}
