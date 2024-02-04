//
//  ContentView.swift
//  Workout App
//
//  Created by Ari Kothari on 7/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.colorScheme) var colorScheme


    
    var body: some View {
        TabView {
            NavigationStack {
                Text("Today is " + day())
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .background(colorScheme == .dark ? Color.black : Color.white)

                
                Spacer()
                
                if let selectedList = dataModel.workoutDays[day()] {
                    List {
                        ForEach(selectedList, id: \.self) { Workout in
                            HStack {
                                Text(Workout.typeWorkout)
                                Spacer()
                                Text(Workout.numReps)
                            }
                            
                        }
                        .onDelete { indices in
                            dataModel.workoutDays[day()] = selectedList.enumerated()
                                .filter { index, _ in !indices.contains(index) }
                                .map { $0.element }
                        }
                    }
                }
                NavigationLink(destination: AddingWorkout()) {
                    Text("Add a Workout")
                }
                    .navigationTitle("Welcome")
            }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            Options()
                .tabItem {
                    Label("Options", systemImage: "list.dash")
                }
            HealthKitUI().environmentObject(HealthKitViewModel())
                .tabItem {
                    Label("Health", systemImage: "heart.text.square.fill")
                }
        }
        

    }
}


func day() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    let dayOfTheWeekString = dateFormatter.string(from: date)
    return dayOfTheWeekString
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
            .environmentObject(HealthKitViewModel())
    }
}


