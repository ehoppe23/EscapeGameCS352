//
// RoomView.swift
// Escape
//
// The display of the main room
// Allows user to navigate to all other 'places'
//
// @Author Emily Hoppe
// Last Updated: 4.22.21
//

import SwiftUI

struct RoomView: View {
    //Puzzles
    @StateObject var door: Puzzle
    @StateObject var closet: Puzzle
    @StateObject var table: Puzzle
    @StateObject var safe: Puzzle
    @StateObject var desk: Puzzle
    @StateObject var rug: RugManager
    
    //Inventory to be passed to views
    @StateObject var stuff: Inventory
    
    //Navigator to manage where the user would like to go
    @StateObject var nav: Navigator
    
    var body: some View {
        ZStack {
            //Room background image
            Image("Room").resizable().layoutPriority(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            VStack{
                Spacer()
                    .frame(height: 22.0)
                    .layoutPriority(/*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                //Navigates the user to the door when pressed
                Button(action:{
                    nav.choice = "X"
                }, label:{
                    Image("DoorButton").resizable().frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 38.0)
                })
                Spacer()
                    .frame(height: 21.0)
                
                HStack {
                    VStack {
                        //Navigates the user to the table when pressed
                        Button(action:{
                            nav.choice = "C"
                        }, label:{
                            Image("TableButton").resizable().padding(.horizontal)
                            
                        })
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                            .frame(height: 100.0)
                        //Navigates the user to the rug when pressed
                        Button(action:{
                            nav.choice = "D"
                            stuff.atRug = true
                        }, label:{
                            if rug.burned { //Rug image is replaced with ash when the rug is burned
                                Image("RugButton2").resizable().frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 154.0)
                            } else {
                                Image("RugButton1").resizable().frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 154.0)
                            }
                        })
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            //Navigates the user to the trash bin when pressed
                            Button(action:{
                                nav.choice = "G"
                            }, label:{
                                Image("TrashButton").resizable().frame(width: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            })
                            Spacer()
                                .frame(width: 40.0)
                        }
                        Spacer()
                            .padding(.vertical)
                        HStack {
                            Spacer()
                            //Navigates the user to the painting when pressed
                            Button(action:{
                                nav.choice = "B"
                            }, label:{
                                Image("PaintingButton").resizable().frame(width: 30.0, height: 90.0)
                            })
                        }
                    }
                }
                Spacer()
                    .padding(.top)
                
                HStack{
                    //Navigates the user to the closet when pressed
                    Button(action:{
                        nav.choice = "A"
                        stuff.atCloset = true
                    }, label:{
                        Image("ClosetButton").resizable().frame(width: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/, height: 110.0)
                    })
                    
                    Spacer()
                    
                    
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                            .frame(height: 75.0)
                        //Navigates the user to the safe when pressed
                        Button(action:{
                            nav.choice = "E"
                        }, label:{
                            Image("SafeButton").resizable().frame(width: /*@START_MENU_TOKEN@*/90.0/*@END_MENU_TOKEN@*/, height: 39)
                        })
                    }
                    
                    VStack {
                        //Navigates the user to the desk when pressed
                        Button(action:{
                            nav.choice = "F"
                        }, label:{
                            Image("DeskButton").resizable().padding([.bottom, .trailing], 30.0).frame(width: /*@START_MENU_TOKEN@*/120.0/*@END_MENU_TOKEN@*/, height: 117.0)
                        })
                        Spacer()
                    }
                }
                Spacer()
                    .frame(height: 93.0)
                    .layoutPriority(/*@START_MENU_TOKEN@*/-1/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

//Preview of UI
struct RoomView_Preview: PreviewProvider {
    
    static var previews: some View {
        RoomView(door: Puzzle(doorAnswer: 4231), closet: Puzzle(), table: Puzzle(), safe: Puzzle(safeAnswer: "sundae"), desk: Puzzle(), rug: RugManager(), stuff: Inventory(), nav: Navigator())
    }
}
