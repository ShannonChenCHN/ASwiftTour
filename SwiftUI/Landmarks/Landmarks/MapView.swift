//
//  MapView.swift
//  Landmarks
//
//  Created by xianglongchen on 2019/7/25.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import SwiftUI
import MapKit

/*
 To use UIView subclasses from within SwiftUI, you wrap the other view in a SwiftUI view that conforms to the UIViewRepresentable protocol.
 
 The UIViewRepresentable protocol has two requirements you need to add: a `makeUIView(context:)` method that creates an MKMapView, and an `updateUIView(_:context:)` method that configures the view and responds to any changes.
 */
struct MapView : UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
#endif
