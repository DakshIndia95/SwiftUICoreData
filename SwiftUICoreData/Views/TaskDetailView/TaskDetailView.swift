//
//  TaskDetailView.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    @State var selectedTask: TaskModel
    @Binding var showUpdateTaskSheet: Bool
    @Binding var refreshTaskList: Bool

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Task DEtail")) {
                    TextField("Task name", text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description)
                    Toggle("Mark Complete", isOn: $selectedTask.isComplete)
                }
                
                Section(header: Text("Task Date & Time")) {
                    DatePicker("Task date", selection: $selectedTask.finishDate)
                }
                
                Section {
                    Button {
                        if taskViewModel.deleteTask(task: selectedTask){
                            showUpdateTaskSheet.toggle()
                            refreshTaskList.toggle()
                        }
                    } label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                }
            }
            .navigationTitle("Task Detail")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showUpdateTaskSheet.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Update") {
                        if taskViewModel.updateTask(task: selectedTask){
                            showUpdateTaskSheet.toggle()
                            refreshTaskList.toggle()
                        }
                    }
                }
            }
        }

    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskViewModel: TaskViewModel(), selectedTask: TaskModel.createMockTask().first!, showUpdateTaskSheet: .constant(false), refreshTaskList: .constant(false))
    }
}
