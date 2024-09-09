//
//  ViewModel.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/09/02.
//

import Foundation
import SwiftUI
import RealmSwift

class ViewModel: ObservableObject {
    @ObservedObject public var model: Model = Model()
    // Model から受け取る Results<ToDoItem> を (View へ)渡す
    var todoItems: Results<ToDoItem> {
        model.taskData
    }
    
    // View からのリクエストで、text に指定値をもたすように ToDoItem 作成(を依頼する)
    func addToDoItem(_ text: String) {
        let command = Model.CreateTODOItemCommand(text: text)
        // 変更することを明示する
        self.objectWillChange.send()
        // Model へ作成を依頼する
        model.executeCommand(command)
    }
    
    func removeTODOItem(_ id: ToDoItem.ID) {
        let command = Model.RemoveTODOItemCommand(id)
        objectWillChange.send()
        model.executeCommand(command)
    }
}
