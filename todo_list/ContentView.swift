//
//  ContentView.swift
//  todo_list
//
//  Created by ZY H on 2021/2/18.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
                    VStack {
                        ForEach(0..<10){ item in
                            singlecardview(title:item.description)
                            
                        }.padding()


                    }        })
       
    }
}

struct singlecardview:View {
    @State var ischecked:Bool = false
    @State var title:String = ""
    @State var duedate:Date = Date()

    var body: some View{
        HStack {
            Rectangle()
                .frame(width: 8)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing:6) {
                Text(self.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(self.duedate.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            Spacer()
            Image(systemName: self.ischecked ? "checkmark.square.fill": "square")
    .imageScale(.large)
    .padding(.trailing)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.ischecked.toggle()
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
