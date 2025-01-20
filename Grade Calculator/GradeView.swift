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
        
    }
}
#Preview {
    GradeView()
}
