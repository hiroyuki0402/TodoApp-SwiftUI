//
//  ContentView.swift
//  TodoApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/12.
//

import SwiftUI
import CoreData

struct HomeView: View {
    // MARK: - プロパティー
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    // MARK: - ボディー

    var body: some View {

        NavigationStack {
            List {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Text("TODO")
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button {
                        self.showingAddTodoView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                    .sheet(isPresented: $showingAddTodoView, content: {
                        AddTodoView()
                    })
            )
        }//: NavigationStack

    }//: ボディー
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    HomeView()
}
