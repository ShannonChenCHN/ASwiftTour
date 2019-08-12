//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ShannonChen on 2019/8/11.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationBarTitle(Text("Landmarks").color(Color.blue))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif
