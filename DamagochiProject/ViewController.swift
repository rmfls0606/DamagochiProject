//
//  ViewController.swift
//  DamagochiProject
//
//  Created by 이상민 on 7/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var damagochiBubbleImageView: UIImageView!
    @IBOutlet weak var damagochiTextLabel: UILabel!
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var damagochiNameView: UIView!
    @IBOutlet weak var damagochiNameLabel: UILabel!
    @IBOutlet weak var damagochiInfoLabel: UILabel!
    @IBOutlet var inputTextFields: [UITextField]!
    @IBOutlet var eatButtons: [UIButton]!
    @IBOutlet weak var EditProfileBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        
        title = "대장님의 다마고치"
        view.backgroundColor = UIColor.background
        
        EditProfileBarButton.image = UIImage(systemName: "person.crop.circle")?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        
        damagochiTextLabel.backgroundColor = UIColor.background
        
        damagochiBubbleImageView.image = UIImage.bubble
        
        damagochiTextLabel.text = "대장님 오늘 깃허브 푸시 하셨어요?"
        damagochiTextLabel.numberOfLines = 0
        
        damagochiImageView.image = UIImage._2_1
        damagochiBubbleImageView.contentMode = .scaleToFill
        
        damagochiNameView.backgroundColor = UIColor.background
        damagochiNameView.layer.borderColor = UIColor.lightGray.cgColor
        damagochiNameView.layer.borderWidth = 1.0
        damagochiNameView.layer.cornerRadius = 5
        
        damagochiNameLabel.text = "방실방실 다마고치"
        
        damagochiInfoLabel.text = "LV4 · 밥알 74개 · 물방울 57개"
        
        textFieldStyle(textField: inputTextFields[0], placeholder: "밥주세용")
        textFieldStyle(textField: inputTextFields[1], placeholder: "물주세용")
        
        buttonStyle(button: eatButtons[0], imageName: "fork.knife.circle", text: "밥먹기")
        buttonStyle(button: eatButtons[1], imageName: "drop.circle", text: "물먹기")
    }
    
    func textFieldStyle(textField: UITextField, placeholder: String){
        textField.backgroundColor = UIColor.background
        textField.placeholder = placeholder
        textField.textAlignment = .center
    }
    
    func buttonStyle(button: UIButton, imageName: String, text: String){
        var config = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(scale: .small)
        config.attributedTitle = AttributedString(text, attributes: AttributeContainer([
            .foregroundColor: UIColor.darkGray
        ]))
        config.image = UIImage(systemName: imageName)?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        config.imagePadding = 8
        config.preferredSymbolConfigurationForImage = imageConfig
        
        button.configuration = config
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5   
    }
}

