//
//  ContentView.swift
//  Grade Calculator
//
//  Created by 李泽宇 on 2025-01-20.
//
//4. Grade Calculator
//Input: Marks for three assignments (TextFields or Steppers).
//Output: Displays the average grade and a letter grade
//(e.g., A, B, C).

import SwiftUI

struct GradeView: View {
    
    // MARK: Stored properties
    
    // The two numbers the user must add
    @State var firstMark = ""
    @State var secondMark = ""
    @State var thirdMark = ""
    @State var feedback = ""
    // Feedback to the user
    //@State var feedback = ""
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("This app will help you determine the Average grade and the Letter grade.")
                    .padding(.horizontal)
                    .font(.custom("Cochin", size: 23))
                
                TextField("Mark for the first assignment", text: $firstMark)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                TextField("Mark for the second assignment", text: $secondMark)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                TextField("Mark for the third assignment", text: $thirdMark)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button("Calculate Grade") {
                    letterGrading()
                }
                .buttonStyle(.borderedProminent)
                
                Text(feedback)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 24.0,
                            relativeTo: .title3
                        )
                    )
                
            }
            .navigationTitle("Grading Calculator")
        }
    }
    func letter(for mark: Int) -> String {

        let High = 100
        let A = 90
        let B = 80
        let C = 70
        let D = 60
        let Low = 0
        
        if mark > High {
            return "Mark provided is too high"
        } else if mark > A {
            return "A"
        } else if mark > B {
            return "B"
        } else if mark > C {
            return "C"
        } else if mark > D {
            return "D"
        } else if mark < Low {
            return "Mark provided is too high"
        } else {
            return "F"
        }
    }
    func letterGrading() {
        guard let mark1 = Int(firstMark),
              let mark2 = Int(secondMark),
              let mark3 = Int(thirdMark) else {
            feedback = "Please provide valid integers for all marks."
            return
        }
        let grade1 = letter(for: mark1)
        let grade2 = letter(for: mark2)
        let grade3 = letter(for: mark3)
        
    }
    
       
}
#Preview {
    GradeView()
}
