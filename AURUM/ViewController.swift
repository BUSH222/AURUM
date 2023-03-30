//
//  ViewController.swift
//  AURUM
//
//  Created by Ted Vtorov on 30.07.2022.
//

import UIKit


func simpleGetUrlRequest(action: String){
        let url = URL(string: "http://172.20.10.2:5100/\(action)")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print("The response is : ",String(data: data, encoding: .utf8)!)
            
        }
        task.resume()
    }

class ViewController: UIViewController {
    var paused = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        paused = !paused
        if paused{
            simpleGetUrlRequest(action: "pause")
            playButtonOutlet.setImage(UIImage(systemName:"play.fill"), for: .normal)
        } else {
            simpleGetUrlRequest(action: "play")
            playButtonOutlet.setImage(UIImage(systemName:"pause.fill"), for: .normal)
        }
    }
    @IBAction func plus15(_ sender: UIButton) {
        simpleGetUrlRequest(action: "plus15")
    }
    
    @IBAction func minus15(_ sender: UIButton) {
        simpleGetUrlRequest(action: "minus15")
    }
    
}

