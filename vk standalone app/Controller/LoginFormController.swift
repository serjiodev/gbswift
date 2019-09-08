//
//  LoginFormController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 11/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit


class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginBtn: UIButton!
    
    var wasAnimationShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTopConstraint.constant = -50
        loginTextField.alpha = 0
        passwordTextField.alpha = 0
        loginBtn.alpha = 0
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboadr))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !wasAnimationShow {
            wasAnimationShow = true
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1, delay: 1, animations: {
                self.titleTopConstraint.constant = 150
                self.view.layoutIfNeeded()
            }) { _ in
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 1, delay: 1, animations: {
                    self.loginTextField.alpha = 1
                    self.passwordTextField.alpha = 1
                    self.view.layoutIfNeeded()
                }) { _ in
                    self.view.layoutIfNeeded()
                    UIView.animate(withDuration: 1, delay: 1, animations: {
                        self.loginBtn.alpha = 1
                        self.view.layoutIfNeeded()
                    }) { _ in
                        
                    }
                }
            }
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillHidden(notification: Notification) {
        let insets = UIEdgeInsets.zero
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
    
    //keyboard up
    @objc func keyboardWasShow(notification: Notification) {
        
        //size keyboard
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) .cgRectValue.size
        _ = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        
    }
    
    // keyboards hidden
    @objc func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
        // padding bottom keyboard size
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func hideKeyboadr(){
        self.scrollView?.endEditing(true)
    }
    
    
    @IBAction func loginButtonTap(_ sender: Any){
        let login = self.loginTextField.text ?? ""
        let pass = self.passwordTextField.text ?? ""
        
        if login == "admin" && pass == "0000"{
            print("authorization successful")
            // connect segue
            performSegue(withIdentifier: "SuccessLogin", sender: nil)
        } else {
            print("authorization failed")
            //
            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
            //
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                print("OK")
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
}
