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
            VStack(spacing: 40) {
                
                Text("This app will help you determine the Average grade and the Letter grade.")
                    .padding(.horizontal)
                    .font(.custom("Cochin-Bold", size: 30))
                
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
                            "Cochin",
                            size: 30,
                            relativeTo: .title3
                        )
                    ).padding(.horizontal)
                
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
        let average = Double(mark1 + mark2 + mark3) / 3.0
        
        feedback = """
                    Grades: First assignment: \(grade1)
                    Second assignment: \(grade2)
                    Third assignment: \(grade3)
                    Assigment avergae: \(average.formatted(.number.precision(.fractionLength(1))))
                    """
    }
    
       
}
#Preview {
    GradeView()
}
