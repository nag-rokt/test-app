//
//  ViewController.swift
//  test-app
//
//  Created by Nahuel Local Account on 13/05/2025.
//

import UIKit
import mParticle_Apple_SDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button 1: Video Watched Event
        let videoEventButton = UIButton(type: .system)
        videoEventButton.setTitle("Log Video Event", for: .normal)
        videoEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        videoEventButton.addTarget(self, action: #selector(logVideoEventTapped), for: .touchUpInside)
        videoEventButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(videoEventButton)

        // Button 2: Purchase Commerce Event
        let purchaseEventButton = UIButton(type: .system)
        purchaseEventButton.setTitle("Log Purchase Event", for: .normal)
        purchaseEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        purchaseEventButton.addTarget(self, action: #selector(logPurchaseEventTapped), for: .touchUpInside)
        purchaseEventButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(purchaseEventButton)
        
        // Button 3: Screen Event
        let screenEventButton = UIButton(type: .system)
        screenEventButton.setTitle("Log Screen", for: .normal)
        screenEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        screenEventButton.addTarget(self, action: #selector(logScreenEventTapped), for: .touchUpInside)
        screenEventButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenEventButton)

        // Layout both buttons vertically
        NSLayoutConstraint.activate([
            videoEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            videoEventButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            videoEventButton.heightAnchor.constraint(equalToConstant: 50),

            purchaseEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            purchaseEventButton.topAnchor.constraint(equalTo: videoEventButton.bottomAnchor, constant: 20),
            purchaseEventButton.heightAnchor.constraint(equalToConstant: 50),
            
            screenEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenEventButton.topAnchor.constraint(equalTo: purchaseEventButton.bottomAnchor, constant: 20),
            screenEventButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func logVideoEventTapped() {
        if let event = MPEvent(name: "Video Watched", type: .navigation) {
            event.customAttributes = [
                "category": "Destination Intro",
                "title": "Paris"
            ]
            MParticle.sharedInstance().logEvent(event)
            print("Video event logged.")
        }
    }
    
    @objc func logScreenEventTapped() {
        let screenInfo = ["rating": "5", "property_type": "hotel", "price": "1000", "aux":"20"];

        MParticle.sharedInstance().logScreen("MOP_PRODUCT_DETAILS_VIEW", eventInfo: screenInfo)
    }

    @objc func logPurchaseEventTapped() {
        // 1. Create the product
        let product = MPProduct(name: "Foo name",
                                sku: "Foo sku",
                                quantity: 4,
                                price: 100.00)

        // 2. Summarize the transaction
        let attributes = MPTransactionAttributes()
        attributes.transactionId = "foo-transaction-id"
        attributes.revenue = 430.00
        attributes.tax = 30.00

        // 3. Log the purchase event
        let event = MPCommerceEvent(action: .purchase, product: product)
        event.transactionAttributes = attributes

        MParticle.sharedInstance().logEvent(event)
        print("Purchase event logged.")
    }
}
