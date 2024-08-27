//
//  MainView.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/08/25.
//

import SwiftUI

struct MainView: View {
    @State var taskData: [Model] = []
    var body: some View {
        
        VStack {
            NavigationStack {
                List {
                    ForEach(taskData) { taskData in
                        Text(taskData.text)
                    }
                    .onDelete(perform: { indexSet in
                        remove(offsets: indexSet)
                    })
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        NavigationLink {
                            DetailView()
                        } label: {
                            Text("編集")
                        }
                        .tint(.yellow)
                    }
                }
                .navigationTitle("やること")
                NavigationLink(destination: {
                    DetailView()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                .padding()
                .foregroundColor(.blue)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            
        }
    }
    func remove(offsets: IndexSet) {
        taskData.remove(atOffsets: offsets)
    }
    
}

#Preview {
    MainView()
}
