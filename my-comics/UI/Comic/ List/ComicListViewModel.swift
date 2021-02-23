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
    func setUp() -> Void
    func delete(id: ComicID) -> Void
}

class ComicListViewModel: ObservableObject {
    @Published var items: [ComicViewItem] = []
    private var comicEntities: Results<ComicEntity>? = nil
    private var token: NotificationToken? = nil

    let repository: ComicRepositoryProtocol

    init() {
        self.repository = ComicRepository(provider: RealmProvider.shared)
        setUp()
        subscribeMobileDB()
    }

    deinit {
        token?.invalidate()
    }
}

//  MARK: - ComicListViewModelProtocol
extension ComicListViewModel: ComicListViewModelProtocol {
    func setUp() { comicEntities = repository.all() }
    func delete(id: ComicID) -> Void { repository.delete(id: id) }
}

//  MARK: - MobileDB
extension ComicListViewModel {
    /// - NOTE
    /// モバイルDB内で変更があればその結果が表示用アイテムに入り通知される
    private func subscribeMobileDB() {
        if let entities = comicEntities {
            token = entities.observe { [weak self] _ in
                self?.items = self?.comicEntities?.map { ComicViewItem(
                    id: $0.id,
                    title: $0.title,
                    haveVolume: $0.haveVolume,
                    publishedVolume: $0.publishedVolume,
                    nextReleaseDate: $0.nextReleaseDate
                )} ?? []
            }
        }
    }
}
