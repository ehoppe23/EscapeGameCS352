//
// ClosetView.swift
// Escape
//
// Closet display, involves item use to solve
//
// @Author Emily Hoppe
// Last Updated: 4.16.21
//

import SwiftUI

struct ClosetView: View {
    @StateObject var closet: Puzzle
    
    //Manages if the book display is open or not
    @State var showBook = false
    
    var body: some View {
        ZStack {
            VStack {
                if !closet.isOpen {
                    //Closed closet image until the key is used
                    Image("ClosetClosed").resizable()
                } else {
                    ZStack {
                        //Open closet image
                        Image("ClosetOpen").resizable()
                        VStack {
                            Spacer()
                                .frame(height: 50.0)
                            //A book is on the shelf of the closet
                            //When tapped it shows a page from the book
                            Button(action:{
                                showBook = true
                            }, label:{
                                Image("BookButton").resizable().frame(width: 110.0, height: 110)
                            })
                        }
                        if showBook { //The page can be tapped again to make it go away
                            Button(action:{
                                showBook = false
                            }, label:{
                                Image("BookPage").resizable()
                            })
                        }
                    }
                }
            }
        }
        
    }
}

//Preview of UI
struct ClosetView_Preview: PreviewProvider {
    
    static var previews: some View {
        ClosetView(closet: Puzzle())
    }
}
