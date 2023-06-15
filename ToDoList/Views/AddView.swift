//
//  AddView.swift
//  ToDoList
//
//  Created by Павел Бескоровайный on 08.06.2023.
//

import SwiftUI

struct AddView: View {
  
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var listViewModel: ListViewModel
  @State var textFieldText: String = ""
  
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Type something here...", text: $textFieldText)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
          .cornerRadius(10)
        
        Button {
          saveButtonPressed()
        } label: {
          Text("Save".uppercased())
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
        }
        
      }
      .padding(16)
      
    }
    .navigationTitle("Add an Item 🖊️")
    .alert(alertTitle, isPresented: $showAlert) {
      Button("OK") {}
    }
    
  }
  
  private func saveButtonPressed() {
    guard textIsAppropriate() else {
      return
    }
    listViewModel.addItem(title: textFieldText)
    dismiss()
  }
  
  func textIsAppropriate() -> Bool {
    if textFieldText.count < 3 {
      alertTitle = "Your new todo item must be at least 3 characters long!! 😨😰😱 "
      showAlert.toggle()
      return false
    }
    return true
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      AddView()
    }
    .environmentObject(ListViewModel())
  }
}
