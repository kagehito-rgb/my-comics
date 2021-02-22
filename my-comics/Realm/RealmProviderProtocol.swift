//
//  RealmProviderProtocol.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation
import RealmSwift

/// Realmを提供する事を示すプロトコル。
protocol RealmProviderProtocol {
    func provide() throws -> Realm
}
