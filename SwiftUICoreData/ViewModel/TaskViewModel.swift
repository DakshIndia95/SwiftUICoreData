//
//  TaskViewModel.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var taskModel: [TaskModel] = []
    private var tempTask: [TaskModel] = TaskModel.createMockTask()
    
    func getMockResult(isActive: Bool) {
        taskModel = tempTask.filter({$0.isComplete == !isActive})
    }
    
    func addTask(task: TaskModel) -> Bool {
        let taskId = Int.random(in: 5...100)
        let taskToAdd = TaskModel(id: taskId, name: task.name, description: task.description, isComplete: false, finishDate: task.finishDate)
        tempTask.append(taskToAdd)
        return true
    }
    
    func updateTask(task: TaskModel) -> Bool {
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask[index].name = task.name
            tempTask[index].description = task.description
            tempTask[index].isComplete = task.isComplete
            tempTask[index].finishDate = task.finishDate
            return true
        }
        return false
    }
    
    func deleteTask(task: TaskModel) -> Bool {
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask.remove(at: index)
            return true
        }
        return false
    }
}
