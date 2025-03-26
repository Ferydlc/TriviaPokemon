//
//  SplashViewController.swift
//  TriviaPokemon
//
//  Created by mac on 25/03/25.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imvSplash: UIImageView!
    
    override func viewDidLoad()
    {
       super.viewDidLoad()
       imvSplash.frame.size.width = 0.0
       imvSplash.frame.size.height = 0.0
        DatosPuntajes.sharedDatos( ).abrirArchivo( )
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
       var w = 0.0
       var x = view.frame.width / 2.0
       var y = view.frame.height / 2.0
       imvSplash.frame = CGRect(x: x, y: y, width: w, height: w)
       
       w = view.frame.width * 0.8
       x = (view.frame.width - w)/2.0
       y = (view.frame.height - w)/2.0
       UIView.animate(withDuration: 1.0, delay: 0.5) {
          self.imvSplash.frame = CGRect(x: x, y: y, width: w, height: w)
       } completion: { res in
          Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
             self.performSegue(withIdentifier: "sgSplash", sender: nil)
          }
       }
    }
}
