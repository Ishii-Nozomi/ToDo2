//
//  Model.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/08/27.
//

import Foundation
import RealmSwift

class Model: ObservableObject {
    var config: Realm.Configuration
    
    init() {
        config = Realm.Configuration()
    }
    
    var realm: Realm {
        return try! Realm(configuration: config)
    }
    
    // 保存されている ToDoItem を Results<ToDoItem> として返す
    var taskData: Results<ToDoItem> {
        realm.objects(ToDoItem.self)
    }
    
    func executeCommand(_ command: TODOModelCommand) {
        command.execute(self)
    }
    
    func itemFromID(_ id: ToDoItem.ID) -> ToDoItem? {
        taskData.first(where: {$0.id == id})
    }
}
