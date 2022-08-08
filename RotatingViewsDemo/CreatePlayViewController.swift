//
//  CreatePlayViewController.swift
//  RotatingViewsDemo
//
//  Created by Prasanna Venkatesh on 08/08/22.
//

import UIKit

class CreatePlayViewController: UIViewController {

    @IBOutlet weak var rotatingView: UIView!
    @IBOutlet weak var referenceView: UIView!
    public var panGesture: UIPanGestureRecognizer?
    private var lastRotation: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SHAPE"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: nil)
    }

    @IBAction func didRotate(_ sender: UIRotationGestureRecognizer) {
        var originalRotation: CGFloat = 0
        if sender.state == .began {
            sender.rotation = lastRotation
            originalRotation = sender.rotation
        } else if sender.state == .changed {
            let newRotation = sender.rotation + originalRotation
            rotatingView.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            panGesture?.isEnabled = true
            lastRotation = sender.rotation
        }
    }

    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: referenceView)
        let center = CGPoint(x: location.x - (referenceView.frame.width / 2), y: location.y - (referenceView.frame.height / 2))
        let radians = atan2(center.y, center.x)
        rotatingView.transform = CGAffineTransform(rotationAngle: radians)
        if sender.state == .ended {
            panGesture?.isEnabled = true
        }
    }
}

extension CreatePlayViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        panGesture?.isEnabled = false
        return true
    }
}
