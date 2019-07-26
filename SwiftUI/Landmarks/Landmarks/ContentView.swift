//
//  ContentView.swift
//  Landmarks
//
//  Created by xianglongchen on 2019/7/24.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        
        /*
         When creating a SwiftUI view, you describe its content, layout, and behavior in the view’s body property; however, the body property only returns a single view. You can combine and embed multiple views in stacks, which group views together horizontally, vertically, or back-to-front.
         */
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                /*
                 To customize a SwiftUI view, you call methods called modifiers. Modifiers wrap a view to change its display or other properties. Each modifier returns a new view, so it’s common to chain multiple modifiers, stacked vertically.
                 */
                Text("Turtle Rock")
                    .font(.title)
                    .background(Color.green)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                        .background(Color.blue)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                        .background(Color.purple)
                }
                .background(Color.yellow)
                
            }
            .padding()
                .background(Color.red)
            
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        get {
            ContentView()
        }
    }
}
#endif
