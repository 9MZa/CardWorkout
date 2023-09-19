//
//  CardSelectionViewController.swift
//  CardWorkout
//
//  Created by Bandit Silachai on 19/9/23.
//

import UIKit

class CardSelectionViewController: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomimage), userInfo: nil, repeats: true)
    }

    
    @objc func showRandomimage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "4S")
    }
}
