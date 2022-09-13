//
//  ContentView.swift
//  Landmarks
//
//  Created by Nguyễn Duy Việt on 08/09/2022.
//

import SwiftUI

// ContentView implement View protocol, mọi thứ muốn show lên thì phải implement View protocol, mình cần có 1 biến body return 1 view nào đó

// The return type of body is some View. The some keyword was introduced in Swift 5.1 and is part of a feature called opaque return types, and in this case what it means is literally “this will return some sort of View but SwiftUI doesn’t need to know (or care) what.”

// Important: Returning some View means that the body property will return something that conforms to the View protocol. You can’t forget to return anything at all – the Swift compiler will refuse to build your code.

// Chú ý @State, @Binding

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        // Đây là 1 label
        // Hehe
        // padding() In SwiftUI this actually creates a new view with padding around it
        
        
        VStack(alignment: .center, spacing: 1000) {
            TextFieldName(name: self.$name).background(.red)
            TextDisplayName(name: self.$name)
            Spacer().background(.green)
        }
        
    }
}

struct LabelStar: View {
    var body: some View {
        Label {
            Text("This is some long texttt.")
                .padding([.trailing])
                .font(.system(size: 30))
                .foregroundColor(.teal)
            
        } icon: {
            Image("star")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct ButtonTap: View {
    var body: some View {
        Button {
            print("Button Tapped")
        } label: {
            Text("Tap me")
                .frame(width: 200, height: 60)
                .background(.purple)
                .foregroundColor(.white)
        }
        .cornerRadius(30)
    }
}

struct TextFieldName: View {
    @Binding var name: String
    
    init(name: Binding<String>) {
        self._name = name
    }
    var body: some View {
        TextField("Enter your name", text: $name)
    }
}

struct TextDisplayName: View {
    @Binding var name: String
    
    var body: some View {
        Text("Hello \(name)")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
