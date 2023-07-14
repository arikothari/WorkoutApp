//
//  AddingWorkoutOptions.swift
//  Workout App
//
//  Created by Ari Kothari on 7/17/23.
//

import SwiftUI

struct AddingWorkoutOptions: View {

    @EnvironmentObject var dataModel: DataModel
    
    @State private var type = ""
    @State private var num = ""
    @State private var day = "Sunday"
    
    var body: some View {
        
        Form {
            Picker("Pick a date", selection: $day) {
                ForEach(Array(dataModel.workoutDays.keys), id: \.self) {
                    Text($0)
                }
            }
            TextField("Workout type", text: $type)
            TextField("Number of Repetitions", text: $num)
            Button("Save changes") {
                if var selectedList = dataModel.workoutDays[day] {

                    selectedList.append(Workout(typeWorkout: type, numReps: num))
                    dataModel.workoutDays[day] = selectedList
                }
                
            }
        }
        
        if let selectedList = dataModel.workoutDays[day] {
            List {
                ForEach(selectedList, id: \.self) { Workout in
                    HStack {
                        Text(Workout.typeWorkout)
                        Spacer()
                        Text(Workout.numReps)
                    }
                    
                }
                .onDelete { indices in
                    dataModel.workoutDays[day] = selectedList.enumerated()
                        .filter { index, _ in !indices.contains(index) }
                        .map { $0.element }
                }
            }
        }
    }
}

struct AddingWorkoutOptions_Previews: PreviewProvider {
    static var previews: some View {
        AddingWorkoutOptions()
    }
}

