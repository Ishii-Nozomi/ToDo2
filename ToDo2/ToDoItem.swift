//
//  ToDoItem.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/09/02.
//

import Foundation
import RealmSwift

class ToDoItem: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var text: String = ""
}
