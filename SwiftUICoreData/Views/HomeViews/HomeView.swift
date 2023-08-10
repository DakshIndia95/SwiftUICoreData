//
//  HomeView.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var taskViewModel: TaskViewModel
    @State var pickerFiler: [String] = ["Active","Completed"]
    @State var defaultPickerSelection: String = "Active"
    @State private var showAddTaskView: Bool = false
    @State private var showTaskDetailView: Bool = false
    @State var selectedTask: TaskModel
    @State private var refreshTaskList: Bool = false
    var body: some View {
        
        NavigationStack {
            
            Picker("Picker Filter", selection: $defaultPickerSelection) {
                ForEach(pickerFiler,id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .padding()
                .onChange(of: defaultPickerSelection) { newValue in
                    taskViewModel.getMockResult(isActive: defaultPickerSelection == "Active")
                }
            
            List(taskViewModel.taskModel,id: \.id) { task in
                VStack(alignment: .leading) {
                    Text(task.name)
                        .font(.title)
                    
                    HStack {
                        Text(task.description)
                            .font(.subheadline)
                            .lineLimit(2)
                        Spacer()
                        Text(task.finishDate.toString())
                            .font(.subheadline)
                    }
                }
                .onTapGesture {
                    showTaskDetailView.toggle()
                    selectedTask = task
                }
            }
            .onAppear {
                taskViewModel.getMockResult(isActive: true)
            }
            .onChange(of: refreshTaskList, perform: { _ in
                taskViewModel.getMockResult(isActive: defaultPickerSelection == "Active")
            })
            .listStyle(.plain)
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTaskView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddNewTask(taskViewModel: taskViewModel, taskToAdd: TaskModel(id: 1, name: "", description: "", isComplete: false, finishDate: Date()), showAddTaskSheet: $showAddTaskView, refreshTaskList: $refreshTaskList)
            }
            .sheet(isPresented: $showTaskDetailView) {
                TaskDetailView(taskViewModel: taskViewModel, selectedTask: selectedTask, showUpdateTaskSheet: $showTaskDetailView, refreshTaskList: $refreshTaskList)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(taskViewModel: TaskViewModel(), selectedTask: TaskModel.createMockTask().first!)
    }
}
