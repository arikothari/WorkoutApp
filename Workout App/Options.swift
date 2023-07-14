//
//  Options.swift
//  Workout App
//
//  Created by Ari Kothari on 7/14/23.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var dataModel: DataModel
    
    var week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State var day = "Monday"
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Choose a day")
                    Picker("Pick a date", selection: $day) {
                        ForEach(week, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Spacer()
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
            NavigationLink(destination: AddingWorkoutOptions()) {
                Text("Add a Workout")
            }
            .navigationTitle("Options")
            
        }
        
        
        
    }
    func deleteWorkout(at offsets: IndexSet) {
        
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options()
            .environmentObject(DataModel())
    }
}
