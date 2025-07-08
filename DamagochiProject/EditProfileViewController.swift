//
//  EditProfileViewController.swift
//  DamagochiProject
//
//  Created by 이상민 on 7/8/25.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profileNameTextField: UITextField!
    @IBOutlet weak var saveProfileRightBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure(){
        title = "대장님 이름 정하기"
        view.backgroundColor = UIColor.background
        
        saveProfileRightBarButton.title = "저장"
        saveProfileRightBarButton.tintColor = .black
        
        profileNameTextField.backgroundColor = UIColor.background
    }
}
