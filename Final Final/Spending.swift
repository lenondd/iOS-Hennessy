//
//  Spending.swift
//  Final Final
//
//  Created by Lenora Duong on 11/12/23.
//

import Foundation


import UIKit

// The Task model
struct Spending: Codable {

    // The task's title
    var title: String

    // The due date by which the task should be completed
    var date: Date
    
    var amount: Int

    // Initialize a new task
    // `note` and `dueDate` properties have default values provided if none are passed into the init by the caller.
    init(title: String, date: Date = Date(), amount: Int) {
        self.title = title
        self.date = date
        self.amount = amount
    }

    // An id (Universal Unique Identifier) used to identify a spending.
    var id: String = UUID().uuidString
}

// MARK: - Task + UserDefaults
extension Spending {

    /* Note that some of the methods are type methods (marked static) which are methods associated with the type (in this case, Task) and allow for the method tobe accessed from anywhere in the app (i.e. Task.save(tasks)) but are not associated with a particular Task instance. In contrast, other methods are instancemethods which are associated with a particular task instance and use the task instance they are called on in some way. For instance, calling task.save() shouldsave (or update) the particular task it's being called on. */

    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ spendings: [Spending]) {
        // TODO: Save the array of tasks
        // Encode the array of tasks to data using a JSONEncoder instance.
        let defaults = UserDefaults.standard
        // Save the encoded tasks data to UserDefaults with a key.
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(spendings) {
            defaults.set(data, forKey: "Your Spending")
        }
        
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getSpendings() -> [Spending] {
        // TODO: Get the array of saved spendings from UserDefaults
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        // Get the saved task data for the key used to store tasks.
        guard let data = defaults.data(forKey: "Your Spending") else { return [] }
        // Decode the tasks data into an array of Task objects (i.e. [Task]) using a JSONDecoder instance.
        let spendings = try? decoder.decode([Spending].self, from: data)
        // If the decode failed, return an empty array.
        return spendings ?? []
    }

    func save() {
        // TODO: Save the current task
        var spendings = Spending.getSpendings()
        // get the current task id
        let currentSpendingID = self.id
        
        // Find the first index where a matching ID is found in the tasks array.
        var existingSpendingIndex: Int? =  nil
        for (index, spending) in spendings.enumerated() {
            if currentSpendingID == spending.id {
                existingSpendingIndex = index
                break
            }
        }
        
        // Remove the existing task from the array
        if let existingSpendingIndex = existingSpendingIndex {
            spendings.remove(at: existingSpendingIndex)
            spendings.insert(self, at: existingSpendingIndex)
        }
        else { spendings.append(self) }
        
        // Save the updated tasks array to UserDefaults
        Spending.save(spendings)
        
    }
}
