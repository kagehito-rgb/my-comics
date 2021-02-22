//
//  Entity.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import Foundation

/// エンティティのインターフェース。
protocol Entity: class {
    /// エンティティの識別子の型。
    associatedtype EntityID: Hashable
    /// エンティティの識別子。
    /// -  Note
    /// 例えばStateとして保持する際に、「IDに対して実体はひとつ」な持たせ方をさせたいため
    /// 実体の重複防止や、あるいは正規化を行いやすくする事で計算量の爆発を防ぐ。
    var id: EntityID { get }
}
