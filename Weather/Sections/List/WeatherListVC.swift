//
//  WeatherListVC.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import UIKit
import MapKit

class WeatherListVC: UIViewController {
    var presenter: ListPresenterInput?
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var weatherList: UITableView!
    @IBOutlet weak var ativityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.initializeMapView()
    }
    
    // MARK: Private Method
    
    private func initializeMapView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userDidTapMapPoint(_:)))
        self.mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func createRegion(for userLocation: MKUserLocation) -> MKCoordinateRegion {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: Constants.latitudeDelta, longitudeDelta: Constants.longitudeDelta)
        return MKCoordinateRegion(center: userLocation.coordinate, span: coordinateSpan)
    }
    
    private func removeAnnotations() {
        let annotations =  self.mapView.annotations
        self.mapView.removeAnnotations(annotations)
    }
    
    private func calculateLocation(from sender: UITapGestureRecognizer) -> Location {
        let coordinate = self.mapView.convert(sender.location(in: self.mapView), toCoordinateFrom: self.mapView)
        return Location(coordinate: coordinate)
    }
    
    private func createAnnotation(from pointOfInterest: Location) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = pointOfInterest.coordinate
        annotation.title = NSLocalizedString("place_to_eat", comment: "")
        return annotation
    }
    
     // MARK: User Interaction
    @objc func userDidTapMapPoint(_ sender: UITapGestureRecognizer) {
        DispatchQueue.global().sync {
            self.removeAnnotations()
            let pointOfInterest = self.calculateLocation(from: sender)
            let annotation = self.createAnnotation(from: pointOfInterest)
            self.mapView.addAnnotation(annotation)
            self.presenter?.userDidUpdatePointOfInterest(pointOfInterest: pointOfInterest)
        }
        self.title = NSLocalizedString("eating", comment: "")
    }
}

extension WeatherListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.weatherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.weatherCellIdentifier, for: indexPath)
        if let weather = self.presenter?.weatherList?[indexPath.row] {
            cell.textLabel?.text = "\(Constants.temperature): \(Int(weather.temperature)) - \(Constants.time): \(weather.timeFromTimeInterval()) "
            cell.detailTextLabel?.text = weather.weather
        }
        return cell
    }    
}

extension WeatherListVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = self.createRegion(for: userLocation)
        let userLocation = Location(coordinate: userLocation.coordinate)
        self.mapView.setRegion(region, animated: true)
        self.presenter?.userDidUpdateLocation(userLocation: userLocation)
    }
}

extension WeatherListVC: ListUI {
    func displayActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = false
            self.ativityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.ativityIndicator.stopAnimating()
        }
    }
    
    func displayUserLocation() {
        self.mapView.showsUserLocation = true
        self.title = NSLocalizedString("running", comment: "")
    }
    
    func displayWeather(list: [Weather]) {
        DispatchQueue.main.async {
             self.weatherList.reloadData()
        }
    }
}

