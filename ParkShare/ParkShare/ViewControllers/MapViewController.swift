//
//  MapViewController.swift
//  ParkShare
//
//  Created by Jonathan Bautista on 4/8/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
//    fileprivate var annotation: MKAnnotation!
    fileprivate var locationManager: CLLocationManager!
    fileprivate var isCurrentLocation: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .standard
        
        
        // Test annotations
        
        
        
        let location1 = CLLocationCoordinate2DMake(30.285403, -97.744213)
        
        var span = MKCoordinateSpan(latitudeDelta: 0.0002, longitudeDelta: 0.0002)
        var region = MKCoordinateRegion(center: location1, span: span)
        mapView.setRegion(region, animated:true)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = location1
        annotation1.title = "2200 Neuces St"
        annotation1.subtitle = "$125"
        mapView.addAnnotation(annotation1)
        
        let location2 = CLLocationCoordinate2DMake(30.283248, -97.743321)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "2008 San Antonio St"
        annotation2.subtitle = "$80"
        mapView.addAnnotation(annotation2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        activityIndicator.center = self.view.center
    }
    
    @IBAction func getLocationButtonPressed(_ sender: Any) {
        if (CLLocationManager.locationServicesEnabled()) {
            if locationManager == nil {
                locationManager = CLLocationManager()
            }
            locationManager?.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            isCurrentLocation = true
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !isCurrentLocation {
            return
        }
        
        isCurrentLocation = false
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        self.mapView.setRegion(region, animated: true)
        
        if self.mapView.annotations.count != 0 {
            self.mapView.removeAnnotation(self.mapView.annotations[0])
        }
        
//        let pointAnnotation = MKPointAnnotation()
//        pointAnnotation.coordinate = location!.coordinate
//        pointAnnotation.title = ""
//        mapView.addAnnotation(pointAnnotation)
//
        self.mapView.showsUserLocation = true
    }
    
//        override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        manager.delegate = self
    //        manager.desiredAccuracy = kCLLocationAccuracyBest
    //        manager.requestWhenInUseAuthorization()
    //        manager.startUpdatingLocation()
    //

    //        // Do any additional setup after loading the view.
//        }
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        let location = locations[0]
    //
    //        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    //        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    //        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
    //        mapView.setRegion(region, animated: true)
    //
    //        self.mapView.showsUserLocation = true
    //    }
    
    //    fileprivate var searchController: UISearchController!
    //    fileprivate var localSearchRequest: MKLocalSearch.Request!
    //    fileprivate var localSearch: MKLocalSearch!
    //    fileprivate var localSearchResponse: MKLocalSearch.Response!
    
//    @objc func currentLocationButtonAction(_ sender: UIBarButtonItem) {
//
//        }
//    }
    
//    @objc func searchButtonAction(_ button: UIBarButtonItem) {
//        if searchController == nil {
//            searchController = UISearchController(searchResultsController: nil)
//        }
//        searchController.hidesNavigationBarDuringPresentation = false
//        self.searchController.searchBar.delegate = self
//        present(searchController, animated: true, completion: nil)
//    }
    
    
    // MARK: - Activity Indicator
    
    
    // MARK: - UIViewController's methods
    
    
    // MARK: - Actions
    

    
    // MARK: - Search
    

    
    // MARK: - UISearchBarDelegate
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        dismiss(animated: true, completion: nil)
//
//        if self.mapView.annotations.count != 0 {
//            annotation = self.mapView.annotations[0]
//            self.mapView.removeAnnotation(annotation)
//        }
//
//        localSearchRequest = MKLocalSearch.Request()
//        localSearchRequest.naturalLanguageQuery = searchBar.text
//        localSearch = MKLocalSearch(request: localSearchRequest)
//        localSearch.start { [weak self] (localSearchResponse, error) -> Void in
//
//            if localSearchResponse == nil {
////                let alert = UIAlertView(title: nil, message: "Place not found", delegate: self, cancelButtonTitle: "Try again")
////                let alert = UIAlertController(title: nil, message: "Place not found", preferredStyle: .alert)
//                return
//            }
//
//            let pointAnnotation = MKPointAnnotation()
//            pointAnnotation.title = searchBar.text
//            pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
//
//            let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
//            self!.mapView.centerCoordinate = pointAnnotation.coordinate
//            self!.mapView.addAnnotation(pinAnnotationView.annotation!)
//        }
//    }
    
    // MARK: - CLLocationManagerDelegate
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

