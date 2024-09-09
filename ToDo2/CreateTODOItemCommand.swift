//
//  CreateTODOItemCommand.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/09/09.
//

import Foundation

protocol TODOModelCommand: AnyObject {
    func execute(_ model: Model)
}

extension Model {
    class CreateTODOItemCommand: TODOModelCommand {
        var text: String = ""
        
        init(text: String) {
            self.text = text
        }
        
        func execute(_ model: Model) {
            let newItem = ToDoItem()
            newItem.id = UUID()
            newItem.text = text
            
            try! model.realm.write {
                model.realm.add(newItem)
            }
        }
    }
    
    class RemoveTODOItemCommand: TODOModelCommand {
        var id: UUID
        
        init(_ id: ToDoItem.ID) {
            self.id = id
        }
        
        func execute(_ model: Model) {
            guard let taskDataToBeRemoved = model.itemFromID(self.id) else { return }
            try! model.realm.write {
                model.realm.delete(taskDataToBeRemoved)
            }
        }
    }
}
