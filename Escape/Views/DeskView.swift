//
// DeskView.swift
// Escape
//
// A desk puzzle, all switches must be
// switched on to recieve the note
//
// @Author Emily Hoppe
// Last Updated: 4.21.21
//

import SwiftUI

struct DeskView: View {
    @ObservedObject var desk: Puzzle
    
    //Manages if the note display is open or not
    @State var showNote = false
    
    //Values of the various switched on the desk
    //true = on, false = off
    @State var dial1 = 0
    @State var switch1 = false
    @State var switch2 = false
    @State var switch3 = false
    @State var switch4 = false
    @State var switch5 = false
    @State var switch6 = false
    
    //Contains names of various switch displays
    var switches = ["SwitchUp", "SwitchDown"]
    
    
    
    var body: some View {
        VStack {
            ZStack {
                //Desk image background
                Image("Desk").resizable()
                if !desk.solved {
                    //Desk contains 6 switches that flip when tapped but also
                    //trigger eachother to flip
                    VStack{ //Switches are arranged in two rows of three
                        HStack{
                            Spacer()
                            Button(action:{
                                switch1 = !switch1
                                switch2 = !switch2
                                switch3 = !switch3
                                //After the flips happen the desk is tested to see if they are all on
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch1{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                            Spacer()
                            Button(action:{
                                switch2 = !switch2
                                switch3 = !switch3
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch2{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                            Spacer()
                            Button(action:{
                                switch2 = !switch2
                                switch3 = !switch3
                                switch4 = !switch4
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch3{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Button(action:{
                                switch2 = !switch2
                                switch4 = !switch4
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch4{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                            Spacer()
                            Button(action:{
                                switch5 = !switch5
                                switch1 = !switch1
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch5{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                            Spacer()
                            Button(action:{
                                switch4 = !switch4
                                switch6 = !switch6
                                desk.solveDesk(s1: switch1, s2: switch2, s3: switch3, s4: switch4, s5: switch5, s6: switch6)
                            }, label:{
                                if switch6{
                                    Image(switches[0]).resizable()
                                } else {
                                    Image(switches[1]).resizable()
                                }
                            })
                        }
                        //Placeholder slot for the note to come out of
                        Image("DeskNotePreButton").resizable()
                    }
                } else {
                    //Once solved the switches become frozen in the 'on' position
                    ZStack {
                        VStack{
                            HStack{
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                                Image(switches[0]).resizable()
                                Spacer()
                            }
                            //The slot opens to show a piece of paper, this is a button that
                            //can be tapped to reveal the note
                            if !showNote {
                                Button(action:{
                                    showNote = true
                                }, label:{
                                    Image("DeskNoteButton").resizable()
                                })
                            }
                            else {
                                Image("DeskNotePreButton").resizable()
                            }
                            
                        }
                        if(showNote){ // The note can be tapped again to have it disappear
                            Button(action:{
                                showNote = false
                            }, label:{
                                Image("DeskNote").resizable().frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)                     })
                        }
                    }
                }
            }
            
        }
        
        
    }
}

//Preview of UI
struct DeskView_Preview: PreviewProvider {
    
    static var previews: some View {
        DeskView(desk: Puzzle())
    }
}
