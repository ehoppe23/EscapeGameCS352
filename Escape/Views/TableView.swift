//
// TableView.swift
// Escape
//
// Table puzzle display
//
// @Author Emily Hoppe
// Last Updated: 4.22.21
//

import SwiftUI

struct TableView: View {
    @ObservedObject var table: Puzzle
    
    //Solving this puzzle provides an item to add to inventory
    @StateObject var inventory: Inventory
    
    //Manages if the note display is open or not
    @State var showNote = false
    
    //Values of the various dials on the table
    // 0 means the arrow on the dial is pointing up, 1 means pointing right, etc
    @State var dial1 = 0
    @State var dial2 = 0
    @State var dial3 = 0
    @State var dial4 = 0
    
    //Contains names of various dial displays
    //Dial1 is up-pointing dial, Dial2 is right-pointing dial, etc
    var dials = ["Dial1","Dial2","Dial3","Dial4"]
    
    var body: some View {
        VStack {
            ZStack {
                if !table.solved {
                    ZStack{
                        //Table background image
                        Image("TableClosed").resizable()
                        VStack{
                            Spacer()
                                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 235.0)
                            HStack{
                                //First vertical stack of two dials
                                VStack{
                                    //Each dial can be tapped to rotate the arrow on the dial clockwise
                                    Spacer()
                                    Button(action:{
                                        dial1 += 1
                                        if dial1 > 3 {dial1 = 0}
                                        table.solveTable(dial1: dial1, dial2: dial2, dial3: dial3, dial4: dial4)
                                    }, label:{
                                        Image(dials[dial1]).resizable()
                                    })
                                    //Each button has a label below it to direct the puzzle
                                    Image("A").resizable().frame(width: 15.0, height: 15.0)
                                    
                                    Button(action:{
                                        dial2 += 1
                                        if dial2 > 3 {dial2 = 0}
                                        table.solveTable(dial1: dial1, dial2: dial2, dial3: dial3, dial4: dial4)
                                    }, label:{
                                        Image(dials[dial2]).resizable()
                                    })
                                    Image("B").resizable().frame(width: 15.0, height: 15.0)
                                }
                                Spacer()
                                    .frame(width: 165.0, height: 125.0)
                                //Second vertical stack of two dials
                                VStack{
                                    Spacer()
                                    Button(action:{
                                        dial3 += 1
                                        if dial3 > 3 {dial3 = 0}
                                        table.solveTable(dial1: dial1, dial2: dial2, dial3: dial3, dial4: dial4)
                                    }, label:{
                                        Image(dials[dial3]).resizable()
                                    })
                                    Image("C").resizable().frame(width: 15.0, height: 15.0)
                                    Button(action:{
                                        dial4 += 1
                                        if dial4 > 3 {dial4 = 0}
                                        table.solveTable(dial1: dial1, dial2: dial2, dial3: dial3, dial4: dial4)
                                    }, label:{
                                        Image(dials[dial4]).resizable()
                                    })
                                    Image("D").resizable().frame(width: 15.0, height: 15.0)
                                }
                            }
                            Spacer()
                                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 105.0)
                        }
                    }
                } else {
                    //After the table is solved, the dials become locked and the table image now includes an open drawer
                    Image("TableOpen").resizable() //Table with open drawer
                    VStack{
                        Spacer()
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 235.0)
                        HStack{ //Dials that are no longer changable
                            VStack{
                                Spacer()
                                Image(dials[0]).resizable()
                                Image("A").resizable().frame(width: 15.0, height: 15.0)
                                Image(dials[3]).resizable()
                                Image("B").resizable().frame(width: 15.0, height: 15.0)
                            }
                            Spacer()
                                .frame(width: 165.0, height: 125.0)
                            VStack{
                                Image(dials[1]).resizable()
                                Image("C").resizable().frame(width: 15.0, height: 15.0)
                                Image(dials[3]).resizable()
                                Image("D").resizable().frame(width: 15.0, height: 15.0)
                            }
                        }
                        Spacer()
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 105.0)
                    }
                    //The drawer contains a match, once the match button has been pressed
                    //The match is added to inventory and is no longer in the drawer
                    if !inventory.hasMatch() && !inventory.hadMatch {
                        VStack {
                            Spacer().frame(height: 285)
                            Button(action:{
                                inventory.aquireMatch()
                            }, label:{
                                Image("Match").resizable().frame(width: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)
                            })
                            Spacer()
                        }
                    }
                }
                
            }
            
        }
        
    }
}

//Preview of UI
struct TableView_Preview: PreviewProvider {
    
    static var previews: some View {
        TableView(table: Puzzle(), inventory: Inventory())
    }
}
