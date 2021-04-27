//
// SafeView.swift
// Escape
//
// Display for the safe puzzle
//
// @Author Emily Hoppe
// Last Updated: 4.23.21
//

import SwiftUI

struct SafeView: View {
    @StateObject var safe: Puzzle
    
    //Solving this puzzle provides an item to add to inventory
    @StateObject var inventory: Inventory
    
    //Holds the user input to the safe text field
    @State var input: String = ""
    
    //Manages if the note display is open or not
    @State var showNote = false
    
    var body: some View {
        VStack {
            if safe.safeAnswer == input.lowercased() { //Display when safe is solved
                ZStack {
                    //Open safe background image
                    Image("SafeOpen").resizable()
                    if !inventory.hasGas() && !inventory.hadGasoline {
                        VStack {
                            Spacer()
                            //The safe contains a gas tank, once the gas button has been pressed
                            //The gas is added to inventory and is no longer in the safe
                            Button(action:{
                                inventory.aquireGas()
                                safe.solveSafe(attempt: input.lowercased())
                            }, label:{
                                Image("Gas").resizable().frame(width: 180.0, height: 210.0)
                            })
                            Spacer()
                                .frame(height: 90.0)
                        }
                    }
                }
            } else { //Display when is not solved
                VStack {
                    ZStack {
                        //Closed safe background image
                        Image("SafeClosed").resizable()
                        //Note button is tap-able
                        if showNote {
                            Button(action:{ //Full note will disappear when tapped again
                                showNote = false
                            }, label:{
                                Image("SafeNote").resizable()
                            })
                            
                        } else {
                            Button(action:{
                                showNote = true
                            }, label:{
                                Image("SafeNoteButton").resizable().frame(width: /*@START_MENU_TOKEN@*/130.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/95.0/*@END_MENU_TOKEN@*/)
                            })
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                //The front of the safe has a text field for the user to enter the safe's password
                                if !showNote {
                                    TextField("_ _ _ _ _ _", text: $input)
                                        .frame(width: 80.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: 2)
                                                .foregroundColor(.black)
                                        )
                                        .shadow(color: Color.gray.opacity(0.4),
                                                radius: 3, x: 1, y: 2)
                                }
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 200.0)
                        }
                    }
                    
                    
                }
            }
        }
        
    }
}

//Preview of UI
struct SafeView_Preview: PreviewProvider {
    
    static var previews: some View {
        SafeView(safe: Puzzle(safeAnswer: "sundae"), inventory: Inventory())
    }
}
