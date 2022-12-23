//
//  ContentView.swift
//  Moonshot
//
//  Created by Thaddeus Dronski on 12/22/22.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    @State private var showListView = false
    
    var body: some View {
        NavigationView {
            Group {
                if showListView {
                    ListLayout(astronauts: astronauts, missions: missions)
                } else {
                    GridLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showListView.toggle()
                } label: {
                    if showListView {
                        Label("Show grid", systemImage: "square.grid.2x2")
                    } else {
                        Label("Show as list", systemImage: "list.dash")
                    }
                }
            }
        }
    }
}


//// how to lay out views in a scrolling grid
//struct ContentView: View {
//    let layout = [
//        GridItem(.adaptive(minimum: 80, maximum: 120))
//    ]
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
//    }
//}



//Working with hierarchical Codable data

//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Deocde JSON") {
//
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//
//
//            let data = Data(input.utf8)
//
//            if let user = try? JSONDecoder().decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//}


//pushing new views into the stack using Navigation Link
//
//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                        .padding()
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
//    }
//}





//ScrollViews
//struct ContentView: View {
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                   CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}
//
//
//struct CustomText: View {
//    
//    let text: String
//    
//    var body: some View {
//        Text(text)
//    }
//    
//    init(_ text: String) {
//        print("Create a new CustomText")
//        self.text = text
//    }
//    
//}





//geometry reader

//struct ContentView: View {
//    var body: some View {
//        GeometryReader { geo in
//            Image("Example")
//                .resizable()
//                .scaledToFit()
//                .frame(width: geo.size.width * 0.8)
//                .frame(width: geo.size.width, height: geo.size.height)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
