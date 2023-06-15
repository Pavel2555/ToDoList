//
//  ListView.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 08.06.2023.
//

import SwiftUI

struct ListView: View {
  @EnvironmentObject var listViewModel: ListViewModel
  
  var body: some View {
    List {
      ForEach(listViewModel.items) { item in
        ListRowView(item: item)
          .onTapGesture {
            withAnimation(.linear) {
              listViewModel.updateItem(item: item)
            }
          }
      }
      .onDelete(perform: listViewModel.deleteItem)
      .onMove(perform: listViewModel.moveItem)
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
    .environmentObject(ListViewModel())
  }
}

