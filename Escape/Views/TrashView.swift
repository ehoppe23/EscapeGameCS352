//
// TrashView.swift
// Escape
//
// View for the trash, which contains a note
// That provides information for solving a different puzzle
//
// @Author Emily Hoppe
// Last Updated: 4.19.21
//

import SwiftUI

struct TrashView: View {
    //Needs access to table because when table is solved the note
    //is no longer nedded
    @StateObject var table: Puzzle
    
    //Manages if the note display is open or not
    @State var showNote = false
    
    var body: some View {
        VStack {
            ZStack {
                //Trash background image
                Image("Trash").resizable()
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        //Button to show the note, disappears after table is solved
                        if !showNote && !table.solved{
                            Button(action:{
                                showNote = true
                            }, label:{
                                //Button appears as a crumpled paper next to the trash bin
                                Image("TrashNoteButton").resizable().frame(width: 65.0, height: 65.0)
                            })
                        }
                        Spacer()
                            .frame(height: 10.0)
                    }
                    Spacer()
                        .frame(width: 45.0)
                }
                //The note itself, only displays once the button is pressed
                //If the note is tapped it will disappear and the crumpled paper button will reappear
                if showNote && !table.solved{
                    Button(action:{
                        showNote = false
                    }, label:{
                        Image("TrashNote").resizable()
                    })
                    
                }
                
            }
            
        }
        
    }
}

//Preview of UI
struct TrashView_Preview: PreviewProvider {
    
    static var previews: some View {
        TrashView(table: Puzzle())
    }
}
