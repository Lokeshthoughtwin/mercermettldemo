//
//  ValidateInvitationKeyViewController.swift
//  Mercer | Mettl
//
//  Created by m@k on 18/04/22.
//

import UIKit
import SideMenu

class ValidateInvitationKeyViewController: UIViewController {
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var btnValidate: UIButton!
    @IBOutlet weak var btnSideMenu: UIButton!
    @IBOutlet weak var lblProvideKey: UILabel!
    @IBOutlet weak var lblMercerAssessment: UILabel!
    @IBOutlet weak var TFInvitationKey: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}
// MARK: - Instance Method
extension ValidateInvitationKeyViewController {
    private func setup() {
        lblWelcome.font = UIFont.setFont(fontType: .light, fontSize: .large)
        lblMercerAssessment.font = UIFont.setFont(fontType: .regular, fontSize: .vxllarge)
        lblProvideKey.font = UIFont.setFont(fontType: .regular, fontSize: .small)
        btnValidate.titleLabel?.font =  UIFont.setFont(fontType: .medium, fontSize: .medium)
        lblErrorMsg.font = UIFont.setFont(fontType: .regular, fontSize: .small)
        
        TFInvitationKey.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        [ btnValidate, btnSideMenu ].forEach {
            $0?.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }
    }
}

// MARK: - Button Action
extension ValidateInvitationKeyViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        validateKey()
    }
    @objc func buttonPressed(_ sender: UIButton) {
        switch  sender {
        case btnValidate:
            if validateData() {
                let alert = UIAlertController(title: "Alert", message: "Let Start your test", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Yeah", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        case btnSideMenu:
            let menu = self.storyboard?.instantiateViewController(withIdentifier: "Left_menu") as! SideMenuNavigationController
            menu.menuWidth = self.view.frame.width - 10
            menu.presentationStyle = .menuSlideIn
            menu.leftSide = true
            present(menu, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    private func validateKey() {
        if validateData() {
            print("Yeah its done")
        }
    }
}


// MARK: - Closure and Delegate Callbacks
extension ValidateInvitationKeyViewController {
    
}

// MARK: - API Callbacks
extension ValidateInvitationKeyViewController {
    
}

// MARK: - Text field Validation  Callbacks
extension ValidateInvitationKeyViewController{
    func validateData() -> Bool {
        TFInvitationKey.borderWidth = 0.5
        TFInvitationKey.layer.cornerRadius = 5
        guard TFInvitationKey.text! != "" else {
            lblErrorMsg.text = AppConstant.emptyInvitationKey
            TFInvitationKey.borderColor = .red
            return false
        }
        guard TFInvitationKey.text! == "1234" else {
            lblErrorMsg.text = AppConstant.incorrectInvitationKey
            TFInvitationKey.borderColor = .red
            return false
        }
        TFInvitationKey.borderColor = .gray
        lblErrorMsg.text = ""
        return true
    }
}
