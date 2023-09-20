//
//  ContentView.swift
//  TaskManager
//
//  Created by Garrett W on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [String] = []
    @State var newTask: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("New Task", text: $newTask)
                    .padding()
                Button(action: {
                    tasks.append(newTask)
                    newTask = ""
                    
                }) {
                    
                    ZStack {
                        
                        let shape = RoundedRectangle(cornerRadius: 10)
                        shape.foregroundColor(.white)
                        shape.stroke(lineWidth: 1)
                            .foregroundColor(.black)
                            .frame(width: 375, height: 40.0)
                        Text("Add Task")
                            .foregroundColor(.black)
                            .padding()
                            Spacer() //pushes item to top
                        
                        
                    }
                    .frame(width: 375, height: 40.0)
                    
                    
                }
                List{
                    ForEach(tasks, id: \.self) { task in
                        TaskView(taskContent: task) // Pass task to TaskView
                    }
                    .onDelete(perform: deleteItems)
                    Spacer()
                }
            }

            
            .navigationBarTitle("To-Do List")
            .toolbar{
                EditButton()
            }
            
        }
    }
    

    func deleteItems(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskView: View {
    var taskContent: String // Receive task as a parameter
    var body: some View {
        ZStack {
            Text(taskContent) // Display the task content
            
        }
        .frame(width: 375, height: 40.0) //constricts to set frame
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
