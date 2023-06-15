//
//  ItemModel.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 13.06.2023.
//

import Foundation

struct ItemModel: Identifiable {
  let title: String
  let isCompleted: Bool
  
  let id: String = UUID().uuidString
}
