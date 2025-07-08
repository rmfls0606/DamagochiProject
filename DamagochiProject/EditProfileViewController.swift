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
    @IBOutlet weak var validTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = UserDefaults.standard.string(forKey: "name"){
            title = "\(name)님의 이름 정하기"
        }else{
            title = "대장님의 이름 정하기"
        }
    }
    
    private func configure(){
        view.backgroundColor = UIColor.background
        
        saveProfileRightBarButton.title = "저장"
        saveProfileRightBarButton.tintColor = .black
        saveProfileRightBarButton.isEnabled = false
        
        profileNameTextField.backgroundColor = UIColor.background
        
        validTextLabel.font = .systemFont(ofSize: 10)
        validTextLabel.isHidden = true
    }
    
    @IBAction func nameTextFieldEditChanged(_ sender: UITextField) {
        validTextLabel.isHidden = false
        guard let text = sender.text, !text.isEmpty else{
            validTextLabel.text = "값을 입력해주세요."
            validTextLabel.textColor = .red
            saveProfileRightBarButton.isEnabled = false
            return
        }
        
        if text.count < 2 || text.count > 6{
            validTextLabel.text = "2글자 이상 6글자 이하로 작성해주세요."
            validTextLabel.textColor = .red
            saveProfileRightBarButton.isEnabled = false
            return
        }
        
        validTextLabel.text = "정상적으로 처리되었습니다."
        validTextLabel.textColor = .green
        saveProfileRightBarButton.isEnabled = true
    }
    
    @IBAction func saveDamagochiNameButtonClicked(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(profileNameTextField.text, forKey: "name")
        self.navigationController?.popViewController(animated: true)
    }    
}
