//
//  TaskModel.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import Foundation

struct TaskModel {
    let id: Int
    var name: String
    var description: String
    var isComplete: Bool
    var finishDate: Date
    
    static func createMockTask() -> [TaskModel] {
        return [
            TaskModel(id: 1, name: "Go to gym", description: "Go to the gym and finish your today's workout", isComplete: false, finishDate: Date()),
            TaskModel(id: 2, name: "Wash your bike", description: "Go to the showroom and wash your bike", isComplete: true, finishDate: Date()),
            TaskModel(id: 3, name: "Wash your cloths", description: "Wash your dirty cloths which is in the basket", isComplete: false, finishDate: Date()),
            TaskModel(id: 4, name: "Watch series", description: "Need to complete this series on netflic", isComplete: true, finishDate: Date())]
    }
}
