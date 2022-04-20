//
//  ViewController.swift
//  Mercer | Mettl
//
//  Created by m@k on 14/04/22.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet weak var lblWelcometo: UILabel!
    @IBOutlet weak var lblGetStarted: UILabel!
    @IBOutlet weak var btnGetStarted: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblMercerAssessment: UILabel!
    @IBOutlet weak var collectionView: IntroCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
}

// MARK: - Instance Method
extension LandingViewController {
    private func setup() {
        lblWelcometo.font = UIFont.setFont(fontType: .light, fontSize: .large)
        lblMercerAssessment.font = UIFont.setFont(fontType: .regular, fontSize: .vxllarge)
        lblGetStarted.font = UIFont.setFont(fontType: .medium, fontSize: .medium)
        collectionView.configure()
        collectionView.didScrolledAtIndex = didScrolledAtIndex
        [ btnGetStarted ].forEach {
            $0?.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }
    }
}

// MARK: - Button Action
extension LandingViewController {
    @objc func buttonPressed(_ sender: UIButton) {
        switch  sender {
        case btnGetStarted:
            self.getStarted()
        default:
            break
        }
    }
    
    private func getStarted() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ValidateInvitationKey") as! ValidateInvitationKeyViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
}


// MARK: - Closure and Delegate Callbacks
extension LandingViewController {
    func didScrolledAtIndex(_ index: Int) {
        pageControl.currentPage = index
    }
}

// MARK: - API Callbacks
extension LandingViewController {
    
}

