//
//  GameViewController.swift
//  Google
//
//  Created by Ruslan on 19/05/22.
//

import UIKit

class GameViewController: UIViewController {
    
    var titleText: String!
    var titleForPlayerName: String!
    let ViewVC = ViewController()
    var numberForPlayer = 0
    var numberForCup = 0

    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var firstCardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var secondCardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var firstCardView: UIView = {
        let view = UIView()
        view.addSubview(firstCardImage)
        return view
    }()
    
    lazy var secondCardView: UIView = {
        let view = UIView()
        view.addSubview(secondCardImage)
        return view
    }()
    
    lazy var cardsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstCardView, secondCardView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        return stackView
    }()
    
    var dealButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "dealbutton"), for: .normal)
        return button
    }()
    
    var playerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var playerScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "0"
        label.textColor = UIColor.systemBackground
        return label
    }()
    
    lazy var playerNameScoreView: UIView = {
        let view = UIView()
        view.addSubview(playerNameLabel)
        view.addSubview(playerScoreLabel)
        return view
    }()
    
    var cupNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CUP"
        label.textColor = .orange
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var cupScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "0"
        label.textColor = UIColor.systemBackground
        return label
    }()
    
    lazy var cupNameScoreView: UIView = {
        let view = UIView()
        view.addSubview(cupNameLabel)
        view.addSubview(cupScoreLabel)
        return view
    }()
    
    var drawLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .highlighted)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(cardsStackView)
        view.addSubview(dealButton)
        view.addSubview(playerNameScoreView)
        view.addSubview(cupNameScoreView)
        view.addSubview(drawLabel)
        view.addSubview(resetButton)
        playerNameLabel.text = titleForPlayerName
        backgroundImage.frame = view.bounds
        title = titleText
        allEdits()
    }
    
    func allEdits() {
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        cardsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp_bottomMargin).inset(-70)
            make.width.equalTo(250)
            make.height.equalTo(210)
        }
        
        firstCardView.snp.makeConstraints { make in
            make.height.equalTo(210)
            make.width.equalTo(160)
        }
        
        firstCardImage.snp.makeConstraints { make in
            make.centerX.equalTo(firstCardView)
            make.width.height.equalTo(firstCardView)
            
        }
        
        secondCardView.snp.makeConstraints { make in
            make.height.equalTo(210)
            make.width.equalTo(160)
        }

        secondCardImage.snp.makeConstraints { make in
            make.centerX.equalTo(secondCardView)
            make.width.height.equalTo(secondCardView)
        }
        
        dealButton.snp.makeConstraints { make in
            make.top.equalTo(cardsStackView.snp_bottomMargin).inset(-30)
            make.centerX.equalToSuperview()
            make.width.equalTo(123)
            make.height.equalTo(46.5)
        }
        
        playerNameScoreView.snp.makeConstraints { make in
            make.top.equalTo(dealButton.snp_bottomMargin).inset(-50)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(100)
            make.width.equalTo(80)
        }
        
        playerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(playerNameScoreView).inset(5)
            make.centerX.equalTo(playerNameScoreView)
        }
        
        playerScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(playerNameLabel.snp_bottomMargin).inset(-20)
            make.centerX.equalTo(playerNameScoreView)
        }
        
        cupNameScoreView.snp.makeConstraints { make in
            make.top.equalTo(dealButton.snp_bottomMargin).inset(-50)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(100)
            make.width.equalTo(80)
        }
        
        cupNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(cupNameScoreView)
            make.top.equalTo(cupNameScoreView).inset(5)
        }
        
        cupScoreLabel.snp.makeConstraints { make in
            make.centerX.equalTo(cupNameScoreView)
            make.top.equalTo(cupNameLabel.snp_bottomMargin).inset(-20)
        }
        
        drawLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dealButton.snp_bottomMargin).inset(-75)
            make.width.equalTo(80)
        }
        
        resetButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        dealButton.addTarget(self, action: #selector(onDealButtonTap), for: .touchUpInside)
        
        resetButton.addTarget(self, action: #selector(onResetTap), for: .touchUpInside)
    }
   
    @objc func onDealButtonTap() {
        let randomNumberOne = Int.random(in: 2...14)
        let randomNumberTwo = Int.random(in: 2...14)
        
        
        
        firstCardImage.image = UIImage(named: "card\(randomNumberOne)")
        secondCardImage.image = UIImage(named: "card\(randomNumberTwo)")
        
        if randomNumberOne > randomNumberTwo {
            numberForPlayer += 1
            playerScoreLabel.text = "\(numberForPlayer)"
            drawLabel.text = ""
        } else if randomNumberOne < randomNumberTwo {
            numberForCup += 1
            cupScoreLabel.text = "\(numberForCup)"
            drawLabel.text = ""
        } else {
            drawLabel.text = "Draw"
        }
    }
    
    @objc func onResetTap() {
        alertSetUp()
        
    }
    
    func alertSetUp() {
        if numberForPlayer > numberForCup {
            let alert = UIAlertController(title: "Winner", message: "\(titleForPlayerName ?? "") won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { sth in
                self.navigationController?.popToViewController(self, animated: true)
                self.numberForPlayer = 0
                self.numberForCup = 0
                self.firstCardImage.image = UIImage(named: "back")
                self.secondCardImage.image = UIImage(named: "back")
                
                self.playerScoreLabel.text = "0"
                self.cupScoreLabel.text = "0"
            }))
            alert.addAction(UIAlertAction(title: "Back to main page", style: .destructive, handler: { sth in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            present(alert, animated: true)
            
        } else if numberForPlayer < numberForCup {
            
            let alert = UIAlertController(title: "Loser", message: "CPU won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { sth in
                self.navigationController?.popToViewController(self, animated: true)
                self.numberForPlayer = 0
                self.numberForCup = 0
                self.firstCardImage.image = UIImage(named: "back")
                self.secondCardImage.image = UIImage(named: "back")
                self.playerScoreLabel.text = "0"
                self.cupScoreLabel.text = "0"
            }))
            alert.addAction(UIAlertAction(title: "Back to main page", style: .destructive, handler: { sth in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            present(alert, animated: true)
        } else if (playerScoreLabel.text == "0" && cupScoreLabel.text == "0") {
            let alert = UIAlertController(title: "Alert", message: "Game hasn't started yet 😎", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { sth in
                self.navigationController?.popToViewController(self, animated: true)
            }))
            
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Draw", message: "No winner", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: { sth in
                self.navigationController?.popToViewController(self, animated: true)
                self.numberForPlayer = 0
                self.numberForCup = 0
                self.firstCardImage.image = UIImage(named: "back")
                self.secondCardImage.image = UIImage(named: "back")
                self.playerScoreLabel.text = "0"
                self.cupScoreLabel.text = "0"
            }))
            alert.addAction(UIAlertAction(title: "Back to main page", style: .destructive, handler: { sth in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            present(alert, animated: true)
        }
       
    }

}
