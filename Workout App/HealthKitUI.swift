//
//  HealthKitUI.swift
//  Workout App
//
//  Created by Ari Kothari on 7/23/23.
//

import SwiftUI

struct HealthKitUI: View {
    @EnvironmentObject var vm: HealthKitViewModel
    
    var body: some View {
        VStack {
            if vm.isAuthorized {
                VStack {
                    Text("Today's Step Count")
                        .font(.title3)
                    
                    Text("\(vm.userStepCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
//                    Spacer()
//                    Text("Heartrate")
//                    //Text(
                }
            } else {
                VStack {
                    Text("Please Authorize Health!")
                        .font(.title3)
                    
                    Button {
                        vm.healthRequest()
                    } label: {
                        Text("Authorize HealthKit")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 320, height: 55)
                    .background(Color(.orange))
                    .cornerRadius(10)
                }
            }
            
        }
        .padding()
        .onAppear {
            vm.readStepsTakenToday()
        }
    }
}

struct HealthKitUI_Previews: PreviewProvider {
    static var previews: some View {
        HealthKitUI()
    }
}
