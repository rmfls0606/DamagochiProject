//
//  SettingTableViewController.swift
//  DamagochiProject
//
//  Created by 이상민 on 7/9/25.
//

import UIKit

class SettingTableViewController: UITableViewController {

    let settingSectionHeaders = ["전체 설정", "개인 설정", "기타"]
    let settingTableCellTexts = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingSectionHeaders.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingSectionHeaders[section]
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTableCellTexts[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "settingCell",
            for: indexPath
        )
        
        tableView.separatorColor = .gray
        
        cell.textLabel?.text = settingTableCellTexts[indexPath.section][indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
