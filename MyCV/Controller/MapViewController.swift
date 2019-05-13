//
//  MapViewController.swift
//  MyCV
//
//  Created by Alexandr on 5/2/19.
//  Copyright © 2019 Alex.Ltd. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!

    // MARK: - Private properties
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showDefaultAlert(title: "Just smth about me", message: "Here are the cities I've been to. There are few but I've visited much of them for the last 2 years. So everything is in a potential🙂")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            print("Current location is: \(currentLocation)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    // MARK: - Private Methods
    private func setupUI() {
        let annotations = setPoints()
        let coordinate = CLLocationCoordinate2D(latitude: 54.5260, longitude: 15.2551)
        mapView.setCenter(coordinate, animated: true)
        mapView.addAnnotations(annotations)
        getLocation()
    }

    private func getLocation() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return
        case .denied, .restricted:
            showDefaultAlert(title: "Location Services disabled", message: "Please enable Location Services in Settings")
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }

        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    private func setPoints() -> [MKAnnotation] {
        var annotations = [MKAnnotation]()

        // Berlin Coordinates
        let berlin = MKPointAnnotation()
        berlin.coordinate = CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050)
        berlin.title = "Berlin"

        // Minich Coordinates
        let munich = MKPointAnnotation()
        munich.coordinate = CLLocationCoordinate2D(latitude: 48.1351, longitude: 11.5820)
        munich.title = "Munich"
        munich.subtitle = "Cool city!"

        // Murmansk Coordinates
        let murmansk = MKPointAnnotation()
        murmansk.coordinate = CLLocationCoordinate2D(latitude: 68.9585, longitude: 33.0827)
        murmansk.title = "Murmansk"
        murmansk.subtitle = "The city of my birth"

        // Kemer Coordinates
        let kemer = MKPointAnnotation()
        kemer.coordinate = CLLocationCoordinate2D(latitude: 36.6028, longitude: 30.5598)
        kemer.title = "Kemer"

        // Moscow Coordinates
        let moscow = MKPointAnnotation()
        moscow.coordinate = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173)
        moscow.title = "Moscow"

        // Saint Petersburg Coordinates
        let saintPetersburg = MKPointAnnotation()
        saintPetersburg.coordinate = CLLocationCoordinate2D(latitude: 59.9343, longitude: 30.3351)
        saintPetersburg.title = "Saint Petersburg"

        // Sharm El-Sheikh Coordinates
        let sharm = MKPointAnnotation()
        sharm.coordinate = CLLocationCoordinate2D(latitude: 27.9158, longitude: 34.3300)
        sharm.title = "Sharm El-Sheikh"

        annotations.append(contentsOf: [berlin, munich, murmansk, kemer, moscow, saintPetersburg, sharm])
        return annotations
    }

}
