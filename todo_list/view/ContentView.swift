//
//  ContentView.swift
//  todo_list
//
//  Created by ZY H on 2021/2/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userdata:todo = todo(data: [singletodo(title:"写作",duedate:Date()),
        singletodo(title:"吃饭",duedate:Date()),
        singletodo(title:"玩耍",duedate:Date()),
    ])
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
                    VStack {
                        ForEach(self.userdata.todolist){ item in
                            singlecardview(index: item.id
                            ).environmentObject(self.userdata)
                            
                        }.padding()


                    }        })
       
    }
}

struct singlecardview:View {
   @EnvironmentObject var userdata:todo
    var index:Int

    var body: some View{
        HStack {
            Rectangle()
                .frame(width: 8)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing:6) {
                Text(self.userdata.todolist[index].title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(self.userdata.todolist[index].duedate.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            Spacer()
            Image(systemName: self.userdata.todolist[index].ischecked ? "checkmark.square.fill": "square")
    .imageScale(.large)
    .padding(.trailing)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.userdata.todolist[index].ischecked.toggle()
                })
        }
        .frame(height:80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10,x:0,y:10 )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
