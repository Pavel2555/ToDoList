//
//  ListView.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 08.06.2023.
//

import SwiftUI

struct ListView: View {
  @State var items: [ItemModel] = [
    ItemModel(title:  "This is the first title!", isCompleted: false),
    ItemModel(title:  "This is the second!", isCompleted: true),
    ItemModel(title:  "Third!", isCompleted: true)
  ]
  
  var body: some View {
    List {
      ForEach(items) { item in
        ListRowView(item: item)
      }
    }
    .listStyle(.plain)
    .navigationTitle("Todo List 📝")
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        EditButton()
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink("Add") {
          AddView()
        }
      }
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ListView()
    }
  }
}

