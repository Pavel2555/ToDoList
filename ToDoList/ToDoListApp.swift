//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 08.06.2023.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

@main
struct ToDoListApp: App {
  var body: some Scene {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    WindowGroup {
      NavigationStack {
        ListView()
      }
      .environmentObject(listViewModel)
    }
  }
}
