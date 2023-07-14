//
//  AddingWorkout.swift
//  Workout App
//
//  Created by Ari Kothari on 7/7/23.
//

import SwiftUI

struct AddingWorkout: View {

    @EnvironmentObject var dataModel: DataModel
    
    @State private var type = ""
    @State private var num = ""
    
    var body: some View {
        
        Form {
            TextField("Workout type", text: $type)
            TextField("Number of Repetitions", text: $num)
            Button("Save changes") {
                if var selectedList = dataModel.workoutDays[day()] {
                    selectedList.append(Workout(typeWorkout: type, numReps: num))
                    dataModel.workoutDays[day()] = selectedList
                }
            }
        }
    }
}

struct AddingWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddingWorkout()
    }
}
