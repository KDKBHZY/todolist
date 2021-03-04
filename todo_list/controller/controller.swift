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
        self.sort()
    }
    func edit(id:Int,data:singletodo){
        self.todolist[id].title = data.title
        self.todolist[id].duedate = data.duedate
        self.todolist[id].ischecked = false
        self.sort()
    }
    //按照日期排序
    func sort(){
        self.todolist.sort { (data1, data2) -> Bool in
            return data1.duedate.timeIntervalSince1970 < data2.duedate.timeIntervalSince1970
        }
        
        for i in 0..<todolist.count{
            self.todolist[i].id = i
        }
    }
    
    func delete(id:Int){
        self.todolist[id].deleted = true
        self.sort()
    }
}
