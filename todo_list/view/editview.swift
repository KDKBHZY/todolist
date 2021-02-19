//
//  editview.swift
//  todo_list
//
//  Created by ZY H on 2021/2/18.
//

import SwiftUI

struct editview: View {
    @EnvironmentObject var userdata:todo
    @State var title:String = ""
    @State var duedate:Date = Date()
     var id:Int? = nil
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView{
            Form{
            Section(header: Text("事项")){
                if(self.id == nil){
                    TextField("事项内容",text:self.$title)
                    DatePicker(selection: self.$duedate, label: { Text("截止日期") })
                }
                else{
                    TextField("事项内容",text:self.$title)
                    DatePicker(selection: self.$duedate, label: { Text("截止日期") })
                }
                }
                Section{
                    Button(action: {
                        if self.id == nil{
                            self.userdata.add(data: singletodo(title: self.title, duedate: self.duedate))
                        }
                        else{
                            self.userdata.edit(id: self.id!, data:singletodo(title:self.title,duedate: self.duedate))
                        }
                        self.presentation.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("确认")
                    })
                    
                    Button(action: {self.presentation.wrappedValue.dismiss()}, label: {
                        Text("取消")
                    })
                }
            }.navigationBarTitle("编辑")
                

            

        }
    }
}

struct editview_Previews: PreviewProvider {
    static var previews: some View {
        editview()
    }
}
