//
//  DetailView.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/08/25.
//

import SwiftUI

struct DetailView: View {
    @State var inputTitle = ""
    var body: some View {
        VStack {
            TextField("やること", text: $inputTitle)
                .textFieldStyle(.roundedBorder)
            Button {
                print(inputTitle)
            } label: {
                ZStack {
                    Text("保存ボタン")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }

        }
        .padding()
    }
}

#Preview {
    DetailView()
}
