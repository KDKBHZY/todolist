//
//  controller.swift
//  todo_list
//
//  Created by ZY H on 2021/2/18.
//

import Foundation

class todo:ObservableObject{
    @Published var todolist:[singletodo]
    var count = 0
    
    init() {
        self.todolist = []
    }
    init(data:[singletodo]) {
        self.todolist = []
        for item in data{
            self.todolist.append(singletodo(title:item.title,duedate: item.duedate,id: self.count))
            count+=1
        }
    }
    func add(data:singletodo){
        self.todolist.append(singletodo(title: data.title, duedate: data.duedate,id: self.count))
        self.count+=1
    }
}
