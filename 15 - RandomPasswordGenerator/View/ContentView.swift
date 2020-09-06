//
//  ContentView.swift
//  15 - RandomPasswordGenerator
//
//  Created by Kevin Paul on 9/6/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let lowercaseLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    let numbers = ["0","1","2","3","4","5","6","7","8","9"]
    let symbols = ["!","@","#","$","%","^","&","*","-","+"]
    
    
    let pickerValues = [8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
    @State private var passwordLength = 0
    @State private var password = "            "
    @State private var includeSymbolsToggle = false
    @State private var includeNumbersToggle = true
    @State private var includeLowercaseToggle = true
    @State private var includeUppercaseToggle = true
    var body: some View {
        GeometryReader { geo in
            Form {
                
                Text("Password Length:")
                    .padding(.top)
                HStack() {
                    
                    Picker("", selection: self.$passwordLength) {
                        ForEach(0..<self.pickerValues.count) { value in
                            Text("\(self.pickerValues[value])")
                        }
                    }
                    Spacer()
                }.padding()
                
                HStack {
                    Text("Include Symbols:")
                        .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Toggle("example: @#$%", isOn: self.$includeSymbolsToggle)
                    .frame(width: geo.size.width / 4.0)
                    
                    Spacer()
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Text("Include Numbers:")
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Toggle("example: 123456", isOn: self.$includeNumbersToggle)
                        .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Text("Include Lowercase:")
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Toggle("example: abcdef", isOn: self.$includeLowercaseToggle)
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Text("Include Uppercase:")
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Toggle("example: ABCDEF", isOn: self.$includeUppercaseToggle)
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Spacer()
                Button("Generate Password") {
                    self.password = self.generatePassword(length: self.passwordLength + 8)
                }
                    .frame(width: geo.size.width / 4.0)
                    Spacer()
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Text("Your new password: ")
                    TextField("Password", text: self.$password)
                    Spacer()
                }.padding(.vertical)
                
                
            }
            
        }
    }
    
    func generatePassword(length: Int) -> String {
        var characterSet: [String] = []
        var tempPassword = ""
        
        if includeLowercaseToggle == false && includeUppercaseToggle == false && includeNumbersToggle == false && includeSymbolsToggle == false {
            return "You must include at least one character set!"
        }
        
        if includeLowercaseToggle {
            characterSet += lowercaseLetters
        }
        
        if includeUppercaseToggle {
            characterSet += lowercaseLetters.map{$0.capitalized}
        }
        
        if includeNumbersToggle {
            characterSet += numbers
        }
        
        if includeSymbolsToggle {
            characterSet += symbols
        }
        
        for _ in 0...length {
            tempPassword.append(characterSet.randomElement()!)
        }
        
        
        return tempPassword
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
