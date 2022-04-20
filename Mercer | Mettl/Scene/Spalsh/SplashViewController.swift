//
//  SplashViewController.swift
//  Mercer | Mettl
//
//  Created by m@k on 14/04/22.
//

import UIKit

class SplashViewController: UIViewController {
    var secondsRemaining = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTimer(secondsRemaining: 1)
    }
}

// MARK: - Instance Method
extension SplashViewController {
    func scheduleTimer(secondsRemaining:Int) -> Void{
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
            } else {
                Timer.invalidate()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
}
