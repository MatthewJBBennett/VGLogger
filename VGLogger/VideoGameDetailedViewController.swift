//
//  VideoGameDetailedViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class VideoGameDetailedViewController: UIViewController {

    var videogame: VideoGame?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleLabel.text! = getName
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let a = videogame {
            self.titleLabel.text = a.videoGameName()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func videoGameForThisView(_ videogame: VideoGame) {
        self.videogame = videogame
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
