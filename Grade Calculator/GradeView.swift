//
//  ContentView.swift
//  Grade Calculator
//
//  Created by 李泽宇 on 2025-01-20.
//
//4. Grade Calculator
//Input: Marks for0000 three assignments (TextFields or Steppers).
//Output: Displays the average grade and a letter grade
//(e.g., A, B, C).

import SwiftUI

struct GradeView: View {
    
    @State var firstMark = ""
    @State var secondMark = ""
    @State var thirdMark = ""
    @State var feedback = ""
    @State var History: [String] = []

    var body: some View {
        
        NavigationStack {
            VStack(spacing: 25) {
                
                Text("This app will help you determine the Average grade and the Letter grade.")
                    .padding(.horizontal)
                    .font(.custom("Cochin-Bold", size: 28))
                    .padding(.vertical)
                
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
                            size: 28,
                            relativeTo: .title3
                        )
                    )
                
                ScrollView {
                    VStack(spacing: 5) {
                        Text("Feedback")
                            .font(.custom("Cochin-Bold", size: 28))
                        ForEach(History, id: \.self) { feedbackItem in
                            Text("\(feedbackItem)")
                                .font(.custom("Cochin",size: 20)).padding(.horizontal)
                            Divider()
                        }
                            
                    }
                }
                
                
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
            return "Mark provided is too low"
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
        
        //guard nonsense
        guard mark1 >= 0 && mark1 <= 100 else {
            feedback = "Make mark 1 a valid number"
            return
        }
        guard mark2 >= 0 && mark2 <= 100 else {
            feedback = "Make mark 2 a valid number"
            return
        }
        guard mark3 >= 0 && mark3 <= 100 else {
            feedback = "Make mark 3 a valid number"
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
        History.append(feedback)
    }
    
       
}
#Preview {
    GradeView()
}
