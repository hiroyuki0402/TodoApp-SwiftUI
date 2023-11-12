//
//  AddTodoView.swift
//  TodoApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/13.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - プロパティー
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    let priorities = ["High", "Normal", "Low"]

    @Environment(\.dismiss) var dismiss
    // MARK: - ボディー

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    /// Name
                    TextField(text: $name) {
                        Text("inputed Name")
                    }

                    /// プロパティー
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .pickerStyle(.segmented)

                    /// 保存
                    Button {
                        dismiss()
                    } label: {
                        Text("保存")
                    }
                }
            }//: VStack
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "chevron.backward")
                        .onTapGesture {
                            dismiss()
                        }
                })
            }

        }//: NavigationStack

    }//: ボディー
}

#Preview {
    AddTodoView()
}
