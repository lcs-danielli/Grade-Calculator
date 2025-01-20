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
    
    // Feedback to the user
    //@State var feedback = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("This app will help you determine the average grade and the letter grade.")
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
            }
            .navigationTitle("Grading Calculator")
        }
    }
}

#Preview {
    GradeView()
}
