//
//  GoogleMapUtility.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-12-02.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit
import GoogleMaps

extension GMSMapView{
    
    func focusMapOnSingleMarker(marker:GMSMarker){
        let myLocation: CLLocationCoordinate2D = marker.position
        let bounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: myLocation, coordinate: myLocation)
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets.zero)
        self.animate(with:update)
        self.animate(toZoom: 12)
    }
    
    func focusOnLocation(_ locationManager: CLLocationManager) {
        let myLocation: CLLocationCoordinate2D = (locationManager.location?.coordinate)!
        let bounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: myLocation, coordinate: myLocation)
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets.zero)
        self.animate(with:update)
        self.animate(toZoom: 11)
    }
    
    func focusOnMultipleMarkers(arrayMarkers:[GMSMarker]){
        if !arrayMarkers.isEmpty {
            let myLocation: CLLocationCoordinate2D = arrayMarkers.first!.position
            var bounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: myLocation, coordinate: myLocation)
            for marker in arrayMarkers{
                bounds = bounds.includingCoordinate(marker.position)
            }
            let update = GMSCameraUpdate.fit(bounds, withPadding: 100)
            self.moveCamera(update)
            if self.camera.zoom > 13 {
                self.animate(toZoom: 13)
            } else if self.camera.zoom < 3 {
                self.animate(toZoom: 3)
            } else {
                self.animate(with: update)
            }
        }
    }
    
//    func focusOnMultipleClusters(arrayClusters:[GMUClusterItem]) {
//        if !arrayClusters.isEmpty {
//            let myLocation: CLLocationCoordinate2D = arrayClusters[0].position
//            var bounds: GMSCoordinateBounds = GMSCoordinateBounds(coordinate: myLocation, coordinate: myLocation)
//            for cluster in arrayClusters{
//                bounds = bounds.includingCoordinate(cluster.position)
//            }
//            let update = GMSCameraUpdate.fit(bounds, withPadding: 100)
//            self.animate(with:update)
//        }
//    }
    
    
    func applyMapStyle(style: String){
        do {
            // Set the map style by passing the URL of the local file. Make sure style.json is present in your project
            if let styleURL = Bundle.main.url(forResource: style, withExtension: "json") {
                self.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                return
            }
        } catch {
            return
        }
    }
//    func setUpPinOnMapAndGetArrayMakers(arrEvents:[EventsMap])->[GMSMarker]{
//        var markers = [GMSMarker]()
//        if(arrEvents.count > 0){
//            for x in arrEvents{
//
//                let marker = GMSMarker()
//                marker.position = x.location
//                //TITLE EST LE ID
//                marker.title = "\(x.id)"
//                marker.icon = x.image
//                marker.map = self
//                marker.opacity = 1.0
//                markers.append(marker)
//            }
//        }
//        return markers
//    }
}

extension GMSMarker{
    func setMarkerImageFromServer(url:String){
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil { return }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.icon = image?.resizeImageWith(newSize: CGSize(width: 23, height: 23)).maskRoundedImage(radius: 11.5)
            })
            
        }).resume()
    }
}

