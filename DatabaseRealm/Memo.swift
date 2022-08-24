//
//  Memo.swift
//  DatabaseRealm
//
//  Created by K I on 2022/08/20.
//

import Foundation
import RealmSwift

class Memo:Object{
    @objc dynamic var title: String=""
    @objc dynamic var content: String=""
}
