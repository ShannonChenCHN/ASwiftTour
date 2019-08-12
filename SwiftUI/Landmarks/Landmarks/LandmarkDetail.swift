//
//  ContentView.swift
//  Landmarks
//
//  Created by xianglongchen on 2019/7/24.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import SwiftUI


/// A view showing the details for a landmark.
struct LandmarkDetail : View {
    var landmark: Landmark
    
    var body: some View {
        
        /*
         When creating a SwiftUI view, you describe its content, layout, and behavior in the view’s body property; however, the body property only returns a single view. You can combine and embed multiple views in stacks, which group views together horizontally, vertically, or back-to-front.
         */
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                /*
                 To customize a SwiftUI view, you call methods called modifiers. Modifiers wrap a view to change its display or other properties. Each modifier returns a new view, so it’s common to chain multiple modifiers, stacked vertically.
                 */
                Text(landmark.name)
                    .font(.title)
                    .background(Color.green)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .background(Color.blue)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .background(Color.purple)
                }
                .background(Color.yellow)
                
            }
            .padding()
                .background(Color.red)
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        get {
            LandmarkDetail(landmark: landmarkData[0])
        }
    }
}
#endif
