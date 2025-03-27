//
//  ViewController.swift
//  TriviaPokemon
//
//  Created by Carolina Gonzalez on 25/03/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var isPlaying = true
    
    @IBOutlet var btnPantallaInicio: [UIButton]!
    @IBOutlet weak var musicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        for boton in btnPantallaInicio
       {
          boton.layer.cornerRadius = 10
       }
        
        musicButton.layer.cornerRadius = 30
    }
    
    func setupAudio() {
        guard let path = Bundle.main.path(forResource: "Caramelldansen", ofType: "mp3") else {
            print("Error: Archivo de audio no encontrado")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Repetir indefinidamente
            audioPlayer?.play()
            audioPlayer?.volume = 0.05
            updateButtonImage()
        } catch {
            print("Error al cargar el audio: \(error.localizedDescription)")
        }
    }
    
    @IBAction func configMusica(_ sender: UIButton) {
        if let player = audioPlayer {
            if player.isPlaying {
                player.pause()
                isPlaying = false
            } else {
                player.play()
                isPlaying = true
            }
        }
        updateButtonImage()
    }
    
    func updateButtonImage() {
        let imageName = isPlaying ? "sonido.png" : "nosonido.png"
        musicButton.setImage(UIImage(named: imageName), for: .normal)
    }
}

