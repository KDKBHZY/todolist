//
//  userdata.swift
//  todo_list
//
//  Created by ZY H on 2021/2/18.
//

import Foundation
//数据模型
struct singletodo:Identifiable {
    var title:String = ""
    var duedate:Date = Date()
    var ischecked:Bool = false
    
    var id:Int = 0
}
