//
//  PlanTextField.swift
//  Planit
//
//  Created by Shivangi on 06/12/22.
//

import SwiftUI

struct PlanTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placeholder), imageName: "checkmark.square", foregroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        
    }
}

struct PlanTextField_Previews: PreviewProvider {
    static var previews: some View {
        PlanTextField(text: .constant(""), placeholder: "Title")
    }
}
