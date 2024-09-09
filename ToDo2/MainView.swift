//
//  MainView.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/08/25.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        
        VStack {
            NavigationStack {
                List {
                    ForEach(viewModel.todoItems.freeze()) { item in
                        Text(item.text)
                    }
                    .onDelete(perform: { indexSet in
                        if let index = indexSet.first {
                            // ViewModelには、removeTODOItem メソッドを作成予定
                            viewModel.removeTODOItem(viewModel.todoItems[index].id)
                        }
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
    
    
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
