//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var disabled = true
    @State private var letterCount = 0
    @State private var color: Color = .red
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { _ in
                        letterCount = name.count
                        
                        if letterCount < 3 {
                            disabled = true
                            color = .red
                        } else {
                            disabled = false
                            color = .green
                        }
                    }
                Text(letterCount.formatted())
                    .foregroundColor(color)
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(disabled)
            }
        }
    }
    
    private func registerUser() {
        if !disabled {
            userManager.name = name
            userManager.isRegister.toggle()
            userManager.save()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
