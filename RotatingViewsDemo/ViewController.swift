//
//  ViewController.swift
//  RotatingViewsDemo
//
//  Created by Prasanna Venkatesh on 08/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func launchModal(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createPlayViewController = storyboard.instantiateViewController(withIdentifier: "CreatePlayViewController") as! CreatePlayViewController
        let navigationController: UINavigationController = UINavigationController(rootViewController: createPlayViewController)
        navigationController.modalPresentationStyle = .formSheet
        present(navigationController, animated: true) {
            createPlayViewController.panGesture = navigationController.presentationController?.presentedView?.gestureRecognizers?[0] as? UIPanGestureRecognizer
        }
    }
}

