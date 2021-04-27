//
// PaintingView.swift
// Escape
//
// Display of a painting
//
// @Author Emily Hoppe
// Last Updated: 4.12.21
//

import SwiftUI

struct PaintingView: View {
    
    var body: some View {
            //This display is just an image of a painting
            //This provides a clue to a different puzzle
            Image("Painting").resizable()
    }
}

//Preview of UI
struct PaintingView_Preview: PreviewProvider {
    
    static var previews: some View {
        PaintingView()
    }
}

