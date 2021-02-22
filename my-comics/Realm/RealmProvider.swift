//
//  RealmProvider.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

/// Realmを提供するクラス。
class RealmProvider {

    let configuration: Realm.Configuration

    private init() {
        // DocumentsではなくLibraryディレクトリにRealm関連ファイルを配置する
        let libraryDirectoryURL =  FileManager.default.urls(
            for: .libraryDirectory,
            in: .userDomainMask
        ).first!
        configuration = .init(
            fileURL: libraryDirectoryURL.appendingPathComponent("default.relam")
        )
    }
}

extension RealmProvider {
    static let shared = RealmProvider()
}

extension RealmProvider: RealmProviderProtocol {
    func provide() throws -> Realm {
        try Realm(configuration: configuration)
    }
}
