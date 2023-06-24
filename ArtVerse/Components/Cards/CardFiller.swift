//
//  CardFiller.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/24/23.
//

import SwiftUI

/*this just acts as the courses card, since once one of them is clicked they are removed
so this will help stop the autoscrolling to the top*/
struct CardFiller: View {
    var courses: [Course]
    
    var body: some View {
        ForEach(courses) { course in
            Rectangle()
                .fill(Color.white)
                .frame(height: 300)
                .cornerRadius(30)
                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                .opacity(0.3)
                .padding(.horizontal, 30)
        }
    }
}
