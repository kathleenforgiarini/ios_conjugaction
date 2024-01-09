//
//  ConjugationPageViewController.swift
//  ConjugActionApp
//
//  Created by Bruno Lopes on 2023-11-22.
//

import UIKit

class ConjugationPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var sectionToExpand: Int?
    var verb : String?
    var verbFromAPI: FrenchVerb!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblVerb: UILabel!
    @IBOutlet weak var lblFullDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblVerb.text = verb?.capitalized
        lblFullDescription.text = verbFromAPI.fullDescription?.capitalized

        tableView.register(UINib(nibName: SecondTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SecondTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .init(red: 254/255, green: 246/255, blue: 234/255, alpha: 1)
        
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        tableHeaderView.backgroundColor = .init(red: 126/255, green: 178/255, blue: 232/255, alpha: 1)
        tableHeaderView.layer.cornerRadius = 20
        tableHeaderView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableHeaderView.bounds.width - 32, height: tableHeaderView.bounds.height))
                        
        headerLabel.text = "Indicatif"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 22)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        
       tableHeaderView.addSubview(headerLabel)
       tableView.tableHeaderView = tableHeaderView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
          
        cell.backgroundColor = .init(red: 249/255, green: 231/255, blue: 210/255, alpha: 1)
        cell.layer.cornerRadius = 20
        cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        if indexPath.section == 0{
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifPresent(inputVerb: verbFromAPI.indicatif!.present!)
        }else if indexPath.section == 1{
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifPasseSimple(inputVerb: verbFromAPI.indicatif!.passeSimple!)
        }else if indexPath.section == 2{
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifImparfait(inputVerb: verbFromAPI.indicatif!.imparfait!)
        } else if indexPath.section == 3 {
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifPasseCompose(inputVerb: verbFromAPI.indicatif!.passeCompose!)
        } else if indexPath.section == 4 {
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifPasseAnterieur(inputVerb: verbFromAPI.indicatif!.passeAnterieur!)
        } else if indexPath.section == 5 {
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifFuturSimple(inputVerb: verbFromAPI.indicatif!.futurSimple!)
        } else if indexPath.section == 6 {
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifFuturAnterieur(inputVerb: verbFromAPI.indicatif!.futurAnterieur!)
        } else if indexPath.section == 7 {
          cell.lblTableViewCell?.text = VerbProvider.toStringIndicatifPlusQueParfait(inputVerb: verbFromAPI.indicatif!.plusQueParfait!)
        }

        return cell
    }
    
    @objc func showCells(_ sender: UIButton){
        
        if self.sectionToExpand == sender.tag{
            self.sectionToExpand = nil
        }else{
            self.sectionToExpand = sender.tag
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .init(red: 156/255, green: 199/255, blue: 242/255, alpha: 1)
        button.tintColor = .white
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        if section == 0{
            button.setTitle("Present", for: .normal)
        }else if section == 1{
            button.setTitle("Passé Simple", for: .normal)
        }else if section == 2 {
            button.setTitle("Imparfait", for: .normal)
        }else if section == 3 {
            button.setTitle("Passé Composé", for: .normal)
        }else if section == 4 {
            button.setTitle("Passé Anterieur", for: .normal)
        }else if section == 5 {
            button.setTitle("Future Simple", for: .normal)
        }else if section == 6 {
            button.setTitle("Future Anterieur", for: .normal)
        }else if section == 7 {
            button.setTitle("Plus Que Parfait", for: .normal)
        }
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(showCells), for: .touchUpInside)
        button.tag = section
        
        return button
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let sectionToExpand = self.sectionToExpand{
            if sectionToExpand == indexPath.section{
                return 170
            }
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Indicatif"
    }
}
