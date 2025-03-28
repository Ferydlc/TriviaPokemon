//
//  RecordsViewController.swift
//  TriviaPokemon
//
//  Created by Carolina Gonzalez on 26/03/25.
//

import UIKit

class RecordsViewController: UIViewController {

    @IBOutlet weak var scrRecordsJugadores: UIScrollView!
    
    let imagenes = ["arceus.jpg","dialga.jpg","giratina.jpg","palkia.jpg","rayquaza.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datos = DatosPuntajes.sharedDatos()
        datos.abrirArchivo()
        dibujarRecords()
    }
    
    func dibujarRecords() {
        let datos = DatosPuntajes.sharedDatos()
        let puntajes = datos.puntajes
        
        let w = scrRecordsJugadores.frame.width * 0.9
        let h = 100.0
        let k = 10.0
        let x = (scrRecordsJugadores.frame.width - w)/2.0
        var y = k
        
        for vista in scrRecordsJugadores.subviews {
            vista.removeFromSuperview()
        }
        
        for i in 0..<puntajes.count {
            let jugador = puntajes[i]["jugador"] as? String ?? "Anónimo"
            let puntaje = puntajes[i]["puntaje"] as? Int ?? 0
            
            let vwJugador = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
            vwJugador.backgroundColor = nil
            vwJugador.layer.cornerRadius = 12
            
            let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: w, height: h))
            backgroundImage.image = UIImage(named: "TextBox.png")
            backgroundImage.contentMode = .scaleToFill
            vwJugador.addSubview(backgroundImage)
            
            let imvPokemon = UIImageView(frame: CGRect(x: 5, y: 5, width: 90, height: 90))
            imvPokemon.image = UIImage(named: imagenes[i])
            vwJugador.addSubview(imvPokemon)
            
            let lblNombre = UILabel(frame: CGRect(x: 100, y: 15, width: vwJugador.frame.width - 105, height: 30))
            lblNombre.text = "\(i+1). \(jugador)"
            lblNombre.font = .boldSystemFont(ofSize: 22)
            vwJugador.addSubview(lblNombre)
            
            let lblPuntaje = UILabel(frame: CGRect(x: 100, y: 40, width: vwJugador.frame.width - 105, height: 50))
            lblPuntaje.text = "⚡️ \(puntaje) puntos"
            lblPuntaje.font = .systemFont(ofSize: 28, weight: .medium)
            vwJugador.addSubview(lblPuntaje)
            
            scrRecordsJugadores.addSubview(vwJugador)
            y += h + k
        }
        
        scrRecordsJugadores.contentSize = CGSize(width: 0, height: y)
    }
}
