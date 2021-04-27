//
// ContentView.swift
// Escape
//
// Main UI display
// Manage all interactions that lead to other displays
//
// @Author Emily Hoppe
// Last Updated: 4.24.21
//

import SwiftUI

struct ContentView: View {
    //Puzzle objects
    @StateObject var closet = Puzzle()
    @StateObject var table = Puzzle()
    @StateObject var safe = Puzzle(safeAnswer: "sundae")
    @StateObject var desk = Puzzle()
    @StateObject var door = Puzzle(doorAnswer: 4231)
    
    //Rug requires unique manager
    @StateObject var rug = RugManager()
    
    //Inventory manages ownership of key, match, and gas throughout all displays
    @StateObject var stuff = Inventory()
    
    //Navigator assists ContentView.swift in accessing the displays the user selects
    @StateObject var nav = Navigator()
    
    
    var body: some View {
        if !door.solved { //Displays room with navigation options until door is solved
            ZStack {
                if nav.choice == nav.choices[8]{ //Basic navigation choice is the main room display
                    RoomView( door: door, closet: closet, table: table, safe: safe, desk: desk, rug: rug, stuff: stuff, nav: nav)
                        .layoutPriority(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                } else { //Otherwise user navigates to room by selecting object buttons in the room
                    VStack {
                        ZStack {
                            if nav.choice == nav.choices[0] {
                                ClosetView(closet: closet)
                            } else if nav.choice == nav.choices[1] {
                                PaintingView()
                            } else if nav.choice == nav.choices[2] {
                                TableView(table: table, inventory: stuff)
                            } else if nav.choice == nav.choices[3] {
                                RugView(rug: rug, stuff: stuff)
                            } else if nav.choice == nav.choices[4] {
                                SafeView(safe: safe, inventory: stuff)
                            } else if nav.choice == nav.choices[5] {
                                DeskView(desk: desk)
                            } else if nav.choice == nav.choices[6] {
                                TrashView(table: table)
                            } else if nav.choice == nav.choices[7] {
                                DoorView(door: door)
                            }
                           //Exit button is present on all puzzle view
                            ExitButtonView(inventory: stuff, nav: nav)
                        }
                        Spacer().frame(height: 70.0)
                    }
                }
                //Inventory is present on all displays until the final puzzle (door) is solved
                InventoryView(inventory: stuff, rug: rug, closet: closet)
                    .layoutPriority(/*@START_MENU_TOKEN@*/-1/*@END_MENU_TOKEN@*/)
            }
        } else { //Once door is solved the game is over
            Image("DoorOpen").resizable()
        }
    }
}
    
    //Preview of UI
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
            }
        }
    }
