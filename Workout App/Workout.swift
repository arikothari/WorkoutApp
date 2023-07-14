//
//  Workout.swift
//  Workout App
//
//  Created by Ari Kothari on 7/7/23.
//

import Foundation

struct Workout: Hashable, Codable {
    let typeWorkout: String
    let numReps: String
}

class DataModel: ObservableObject {
    @Published var workoutDays: [String: [Workout]] = [
        "Monday": [],
        "Tuesday": [],
        "Wednesday": [],
        "Thursday": [],
        "Friday": [],
        "Saturday": [],
        "Sunday": []
    ] {
        didSet {
            saveWorkoutDaysToUserDefaults()
        }
    }

    init() {
        restoreWorkoutDaysFromUserDefaults()
    }

    private func restoreWorkoutDaysFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "workoutDays"),
           let loadedData = try? JSONDecoder().decode([String: [Workout]].self, from: data) {
            workoutDays = loadedData
        }
    }

    private func saveWorkoutDaysToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(workoutDays) {
            UserDefaults.standard.set(encodedData, forKey: "workoutDays")
        }
    }
}






