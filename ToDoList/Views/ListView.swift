//
//  ListView.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 08.06.2023.
//

import SwiftUI

struct ListView: View {
  @State var items: [String] = [
    "This is the first title!",
    "This is the second!",
    "Third!"
  ]
  
  var body: some View {
    List {
      ForEach(items, id: \.self) { item in
        ListRowView(title: item)
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

