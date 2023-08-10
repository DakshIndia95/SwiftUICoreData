//
//  AddNewTask.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import SwiftUI

struct AddNewTask: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    @State var taskToAdd: TaskModel
    @Binding var showAddTaskSheet: Bool
    @Binding var refreshTaskList: Bool
    var body: some View {
        
        NavigationStack {
            List {
                Section(header: Text("Add New Task")) {
                    TextField("Task name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                
                Section(header: Text("Add Task Date & time")) {
                    DatePicker("Task date", selection: $taskToAdd.finishDate)
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showAddTaskSheet.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        if taskViewModel.addTask(task: taskToAdd){
                            showAddTaskSheet.toggle()
                            refreshTaskList.toggle()
                        }
                    }.disabled(taskToAdd.name.isEmpty)
                }
            }
        }
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask(taskViewModel: TaskViewModel(), taskToAdd: TaskModel(id: 1, name: "", description: "", isComplete: false, finishDate: Date()), showAddTaskSheet: .constant(false), refreshTaskList: .constant(false))
    }
}
