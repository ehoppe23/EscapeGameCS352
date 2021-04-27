//
// DoorView.swift
// Escape
//
// Display for the door puzzle
// This is the final puzzle of the game
//
// @Author Emily Hoppe
// Last Updated: 4.23.21
//

import SwiftUI

struct DoorView: View {
    @StateObject var door: Puzzle
    
    //Manages if the lock display is open or not
    @State var showLock = false
    
    //Values of the various number slots on the lock
    @State var slot1 = 0
    @State var slot2 = 0
    @State var slot3 = 0
    @State var slot4 = 0
    
    //Used to combine the slot numbers into a single int to pass to the puzzle for solving
    @State var test = 0
    
    //Contains names of various number displays (name is same as the number displayed)
    var numbers = ["0","1","2","3","4","5","6","7","8","9"]
    
    var body: some View {
        VStack{
            ZStack {
                //Backdrop is the door display
                Image("DoorClosed").resizable()
                
                //On top of the door is the lock (4 number slots), which can be tapped to open the interactive lock display
                if showLock {
                    ZStack {
                        //Interactive lock is made up of the lock background and 4 numbers aligned
                        //horizontally that can be increased by tapping them
                        Image("DoorLock").resizable().frame(width: 197, height: /*@START_MENU_TOKEN@*/160.0/*@END_MENU_TOKEN@*/)
                        HStack {
                            //Each button displays a number, tapping it increases the number up to 9
                            //At which point it resets to 0
                            Button(action:{
                                slot1 = slot1 + 1
                                if slot1 > 9 {slot1 = 0}
                                test = Int(String(slot1)+String(slot2)+String(slot3)+String(slot4))!
                                door.solveDoor(attempt: test)
                            }, label:{
                                Image(numbers[slot1]).resizable().frame(width: 35.0, height: 35.0)
                            })
                            Spacer()
                                .frame(width: 5)
                            Button(action:{
                                slot2 = slot2 + 1
                                if slot2 > 9 {slot2 = 0}
                                test = Int(String(slot1)+String(slot2)+String(slot3)+String(slot4))!
                                door.solveDoor(attempt: test)
                            }, label:{
                                Image(numbers[slot2]).resizable().frame(width: 35.0, height: 35.0)
                            })
                            Spacer()
                                .frame(width: 5)
                            Button(action:{
                                slot3 = slot3 + 1
                                if slot3 > 9 {slot3 = 0}
                                test = Int(String(slot1)+String(slot2)+String(slot3)+String(slot4))!
                                door.solveDoor(attempt: test)
                            }, label:{
                                Image(numbers[slot3]).resizable().frame(width: 35.0, height: 35.0)
                            })
                            Spacer()
                                .frame(width: 5)
                            Button(action:{
                                slot4 = slot4 + 1
                                if slot4 > 9 {slot4 = 0}
                                test = Int(String(slot1)+String(slot2)+String(slot3)+String(slot4))!
                                door.solveDoor(attempt: test)
                            }, label:{
                                Image(numbers[slot4]).resizable().frame(width: 35.0, height: 35.0)
                            })
                        }
                    }
                } else { //If the lock has not been selected it remains a small button on the front of the door
                    Button(action:{
                        showLock = true
                    }, label:{
                        Image("DoorLockButton").resizable().frame(width: 60, height: 60)
                    })
                }
                
            }
        }
    }
}

//Preview of UI
struct DoorView_Preview: PreviewProvider {
    
    static var previews: some View {
        DoorView(door: Puzzle(doorAnswer: 4231))
    }
}

