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
    @State var showeditpage = false
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true, content: {
                        VStack {
                            ForEach(self.userdata.todolist){ item in
                                if(!item.deleted){
                                    singlecardview(index: item.id
                                    ).environmentObject(self.userdata)
                                }
                                
                            }.padding()


                    }        })
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {self.showeditpage = true}, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90, alignment: .center)
                                .foregroundColor(.blue)                    })
                        .sheet(isPresented: self.$showeditpage, content: {
                            editview()
                                .environmentObject(self.userdata)
                        })
                    
                }.padding()
            }
        }
       
    }
}

struct singlecardview:View {
   @EnvironmentObject var userdata:todo
    var index:Int
    @State var showeditpage = false

    var body: some View{
        HStack {
            Rectangle()
                .frame(width: 8)
                .foregroundColor(.blue)
            Button(action: {
                self.userdata.delete(id: index)
            }, label: {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .padding(.leading)            })
           
            Button(action: {self.showeditpage = true}, label: {
                    Group {
                        VStack(alignment: .leading, spacing:6) {
                            Text(self.userdata.todolist[index].title)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            Text(self.userdata.todolist[index].duedate.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        Spacer()

                    } })
                .sheet(isPresented: self.$showeditpage, content: {
                    editview(title:self.userdata.todolist[index].title,
                             duedate: self.userdata.todolist[index].duedate, id:self.index)
                        .environmentObject(self.userdata)
                })
           
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
