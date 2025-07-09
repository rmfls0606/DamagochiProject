//
//  ViewController.swift
//  DamagochiProject
//
//  Created by 이상민 on 7/8/25.
//

import UIKit

class Damagochi{
    let userDefaults = UserDefaults.standard
    
    var name: String{
        if let value = userDefaults.string(forKey: "name"){
            return value
        }else{
            userDefaults.setValue("대장", forKey: "name")
            return "대장"
        }
    }
    
    var level: Int{
        get{
            if userDefaults.object(forKey: "level") == nil{
                userDefaults.setValue(1, forKey: "level")
                return 1
            }else{
                return userDefaults.integer(forKey: "level")
            }
        }
        set{
            userDefaults.setValue(newValue, forKey: "level")
        }
    }
    
    var riceCount: Int{
        get{
            return userDefaults.integer(forKey: "rice")
        }
        set{
            userDefaults.setValue(newValue, forKey: "rice")
        }
    }
    
    var waterCount: Int{
        get{
            return userDefaults.integer(forKey: "water")
        }
        set{
            return userDefaults.setValue(newValue, forKey: "water")
        }
    }
}

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
    
    var damagochi = Damagochi()
    
    let damagochiMessage: [String] = ["배고파요.. 밥 주세요!", "밥 먹을 시간이에요!", "목이 너무 말라요.. 물 주세요!", "물 한잔만 주세요!", "오늘 깃허브 푸시 하셨어요?", "블로그 작성하셨어요?", "공부는 하고 계신가요?", "오늘 하루 코딩 열심히 해봐요!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateDamagochi()
    }
    
    private func configure(){
        view.backgroundColor = UIColor.background
        
        EditProfileBarButton.image = UIImage(systemName: "person.crop.circle")?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        
        damagochiTextLabel.backgroundColor = UIColor.background
        
        damagochiBubbleImageView.image = UIImage.bubble
        
        damagochiTextLabel.numberOfLines = 0
        damagochiTextLabel.textAlignment = .center
        
        damagochiBubbleImageView.contentMode = .scaleToFill
        
        damagochiNameView.backgroundColor = UIColor.background
        damagochiNameView.layer.borderColor = UIColor.lightGray.cgColor
        damagochiNameView.layer.borderWidth = 1.0
        damagochiNameView.layer.cornerRadius = 5
        
        damagochiNameLabel.text = "방실방실 다마고치"
        
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
    
    func updateDamagochi(){
        let user = self.damagochi
        title = "\(user.name)님의 다마고치"
        let level = user.level
        let riceCount = user.riceCount
        let waterCount = user.waterCount
        let message = damagochiMessage.randomElement() ?? "안녕하세요!"
        damagochiTextLabel.text = "\(user.name)님, \(message)"
        damagochiInfoLabel.text = "LV\(level) · 밥알\(riceCount)개 · 물방울 \(waterCount)개"
        damagochiImageView.image = UIImage(named: "2-\(min(level, 9))")
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let check = UIAlertAction(title: "확인", style: .default)
        alert.addAction(check)
        
        self.present(alert, animated: true)
    }
    
    func levelUp(){
        let exp = ((self.damagochi.riceCount / 5) + (
            self.damagochi.waterCount / 2
        )) / 10
        self.damagochi.level = min(max(1, exp), 10)
    }

    @IBAction func eatButtonClicked(_ sender: UIButton) {
        guard let text = inputTextFields[sender.tag].text, !text.isEmpty else {
            if sender.tag == 0{
                self.damagochi.riceCount += 1
            }else{
                self.damagochi.waterCount += 1
            }
            levelUp()
            //잘 먹었다는 문구 보여주기
            updateDamagochi()
            return
        }
        
        guard let intValue = Int(text) else {
            showAlert(title: "실패", message: "질못된 형식의 값을 입력하였습니다.")
            return
        }
        
        //밥먹기
        if sender.tag == 0{
            if intValue > 99{
                damagochiTextLabel.text = "\(damagochi.name)님 한번에 \(intValue)개의 밥은 먹을 수가 없어요.."
                return
            }else{
                self.damagochi.riceCount += intValue
            }
        }else if sender.tag == 1{
            if intValue > 49{
                damagochiTextLabel.text = "\(damagochi.name)님 한번에 \(intValue)개의 물은 마실 수가 없어요.."
                return
            }else{
                self.damagochi.waterCount += intValue
            }
        }
        
        levelUp()
        updateDamagochi()
    }
    
    @IBAction func viewTapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

