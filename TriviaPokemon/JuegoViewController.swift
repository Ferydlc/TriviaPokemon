//
//  JuegoViewController.swift
//  TriviaPokemon
//
//  Created by Carolina Gonzalez on 25/03/25.
//

import UIKit

class JuegoViewController: UIViewController {
    
    @IBOutlet weak var imgPregunta: UIImageView!
    @IBOutlet weak var lblPregunta: UILabel!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet var btnRespuestas: [UIButton]!
    @IBOutlet weak var imgVida1: UIImageView!
    @IBOutlet weak var imgVida2: UIImageView!
    @IBOutlet weak var lblPuntaje: UILabel!
    @IBOutlet weak var imgVida3: UIImageView!
    @IBOutlet weak var btnTerminarPartida: UIButton!
    
    @IBOutlet weak var ViewJuego: UIView!
    
    let imagenes = [
        "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg",
        "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg",
        "21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg", "26.jpg", "27.jpg", "28.jpg", "29.jpg", "30.jpg",
        "31.jpg", "32.jpg", "33.jpg", "34.jpg", "35.jpg", "36.jpg", "37.jpg", "38.jpg", "39.jpg", "40.jpg",
        "41.jpg", "42.jpg", "43.jpg", "44.jpg", "45.jpg", "46.jpg", "47.jpg", "48.jpg", "49.jpg", "50.jpg"
    ];
    
    let preguntas = [
        "¿Cuál es el Pokémon número 25 en la Pokédex Nacional?",
        "¿De qué tipo es Charmander?",
        "¿Cuál es la evolución de Bulbasaur?",
        "¿Qué objeto se usa para evolucionar a Eevee en Vaporeon?",
        "¿Cuál de estos Pokémon es de tipo Eléctrico?",
        "¿Cuál de estos Pokémon es una evolución de Pichu?",
        "¿Qué tipo de Pokémon es Gyarados?",
        "¿Cómo se llama el profesor que entrega el primer Pokémon en la región de Kanto?",
        "¿Cuántos Pokémon puede llevar un entrenador en su equipo en los juegos principales?",
        "¿Cuál de estos Pokémon no es inicial?",
        "¿Cuál es el Pokémon legendario de la versión Pokémon Oro?",
        "¿De qué tipo es Jigglypuff?",
        "¿Cuál es la evolución de Magikarp?",
        "¿Cuántas generaciones de Pokémon existen hasta la fecha?",
        "¿Qué objeto se usa para evolucionar a Scyther en Scizor?",
        "¿Cuál de estos Pokémon no es de tipo Dragón?",
        "¿Cuál es la evolución de Rhyhorn?",
        "¿Qué tipo de Pokémon es Togekiss?",
        "¿Qué tipo de Pokémon es Lapras?",
        "¿Cuál de estos Pokémon puede aprender Surf?",
        "¿Cómo se llama la pre-evolución de Lucario?",
        "¿Qué Pokémon se dice que tiene ADN de todos los Pokémon?",
        "¿Cuál es la velocidad base de Electrode?",
        "¿Qué habilidad tiene Ditto que le permite transformarse automáticamente en el Pokémon rival?",
        "¿Cuál de estos Pokémon es de tipo Fantasma?",
        "¿Qué objeto se necesita para evolucionar a Poliwhirl en Politoed?",
        "¿Cuál de estos Pokémon es un fósil revivido?",
        "¿De qué tipo es el Pokémon Metagross?",
        "¿Qué Pokémon es la evolución de Trapinch?",
        "¿Cuál de estos Pokémon es un legendario de la región de Sinnoh?",
        "¿Qué tipo de Pokémon es Torkoal?",
        "¿Cómo se llama la evolución de Togepi?",
        "¿Cuál es el Pokémon número 1 en la Pokédex Nacional?",
        "¿Qué Pokémon se obtiene al evolucionar un Slowpoke con Roca del Rey?",
        "¿Cuál de estos Pokémon es un Pokémon inicial de la región de Kalos?",
        "¿Cuál es el nombre del Pokémon de tipo Planta inicial en la región de Alola?",
        "¿Cuál de estos Pokémon es un Ultraente?",
        "¿Cuál de estos Pokémon es un tipo Acero puro?",
        "¿De qué tipo es Alakazam?",
        "¿Cuál es la evolución de Porygon2?",
        "¿Cuál de estos Pokémon tiene una forma Gigamax?",
        "¿Qué Pokémon tiene la habilidad Llovizna?",
        "¿Cuál es el nombre del Pokémon de la región de Galar que es de tipo Dragón/Fantasma?",
        "¿Cuál de estos Pokémon tiene la habilidad Levitación?",
        "¿Cuál de estos Pokémon evoluciona con Amistad durante la noche?",
        "¿Cuál de estos Pokémon es de tipo Tierra?",
        "¿Cuál de estos Pokémon es la forma evolucionada de Cosmoem?",
        "¿Cuál es el Pokémon singular de la región de Unova?",
        "¿Cuál de estos Pokémon tiene una evolución regional en Hisui?",
        "¿Cuál de estos Pokémon puede evolucionar a Froslass?"
    ]
    
    let opciones = [
        ["a) Bulbasaur", "b) Charmander", "c) Pikachu", "d) Squirtle"],
        ["a) Agua", "b) Planta", "c) Eléctrico", "d) Fuego"],
        ["a) Ivysaur", "b) Venusaur", "c) Charmeleon", "d) Wartortle"],
        ["a) Piedra Agua", "b) Piedra Fuego", "c) Piedra Trueno", "d) Piedra Hoja"],
        ["a) Geodude", "b) Magnemite", "c) Machop", "d) Sandshrew"],
        ["a) Togepi", "b) Pikachu", "c) Cleffa", "d) Plusle"],
        ["a) Agua/Volador", "b) Agua/Dragón", "c) Agua/Psíquico", "d) Agua/Lucha"],
        ["a) Profesor Oak", "b) Profesor Elm", "c) Profesor Birch", "d) Profesor Rowan"],
        ["a) 4", "b) 5", "c) 6", "d) 7"],
        ["a) Torchic", "b) Mudkip", "c) Zubat", "d) Chikorita"],
        ["a) Lugia", "b) Ho-Oh", "c) Rayquaza", "d) Mewtwo"],
        ["a) Normal/Hada", "b) Psíquico", "c) Agua", "d) Lucha"],
        ["a) Gyarados", "b) Feebas", "c) Wailmer", "d) Sharpedo"],
        ["a) 6", "b) 7", "c) 9", "d) 10"],
        ["a) Revestimiento Metálico", "b) Piedra Día", "c) Piedra Hoja", "d) Roca del Rey"],
        ["a) Dragonair", "b) Salamence", "c) Garchomp", "d) Charizard"],
        ["a) Rhydon", "b) Rhyperior", "c) Onix", "d) Aggron"],
        ["a) Volador/Hada", "b) Normal/Psíquico", "c) Volador/Normal", "d) Hada/Psíquico"],
        ["a) Agua/Hielo", "b) Agua/Roca", "c) Agua/Psíquico", "d) Hielo/Dragón"],
        ["a) Geodude", "b) Pikachu", "c) Gyarados", "d) Beedrill"],
        ["a) Riolu", "b) Hitmontop", "c) Tyrogue", "d) Meditite"],
        ["a) Mew", "b) Mewtwo", "c) Arceus", "d) Ditto"],
        ["a) 100", "b) 120", "c) 140", "d) 200"],
        ["a) Mutatipo", "b) Impostor", "c) Cambio Color", "d) Ilusión"],
        ["a) Gengar", "b) Golem", "c) Gyarados", "d) Gardevoir"],
        ["a) Roca del Rey", "b) Revestimiento Metálico", "c) Piedra Agua", "d) Piedra Día"],
        ["a) Aerodactyl", "b) Arcanine", "c) Altaria", "d) Ampharos"],
        ["a) Acero/Psíquico", "b) Acero/Siniestro", "c) Acero/Dragón", "d) Acero/Lucha"],
        ["a) Vibrava", "b) Flygon", "c) Garchomp", "d) Salamence"],
        ["a) Giratina", "b) Suicune", "c) Rayquaza", "d) Mew"],
        ["a) Fuego", "b) Agua", "c) Roca", "d) Eléctrico"],
        ["a) Togetic", "b) Togekiss", "c) Jigglypuff", "d) Cleffa"],
        ["a) Bulbasaur", "b) Charmander", "c) Squirtle", "d) Pikachu"],
        ["a) Slowking", "b) Slowbro", "c) Slaking", "d) Snorlax"],
        ["a) Froakie", "b) Piplup", "c) Cyndaquil", "d) Treecko"],
        ["a) Rowlet", "b) Chespin", "c) Grookey", "d) Turtwig"],
        ["a) Nihilego", "b) Xerneas", "c) Diancie", "d) Zygarde"],
        ["a) Registeel", "b) Aggron", "c) Steelix", "d) Mawile"],
        ["a) Psíquico", "b) Fantasma", "c) Hada", "d) Dragón"],
        ["a) Porygon-Z", "b) Porygon", "c) Porygon-X", "d) Porygon4"],
        ["a) Snorlax", "b) Sudowoodo", "c) Arcanine", "d) Lanturn"],
        ["a) Kyogre", "b) Groudon", "c) Rayquaza", "d) Zapdos"],
        ["a) Dragapult", "b) Haxorus", "c) Salamence", "d) Druddigon"],
        ["a) Latios", "b) Tyranitar", "c) Donphan", "d) Excadrill"],
        ["a) Umbreon", "b) Espeon", "c) Glaceon", "d) Sylveon"],
        ["a) Flygon", "b) Gardevoir", "c) Charizard", "d) Milotic"],
        ["a) Lunala", "b) Necrozma", "c) Zygarde", "d) Jirachi"],
        ["a) Victini", "b) Celebi", "c) Darkrai", "d) Manaphy"],
        ["a) Qwilfish", "b) Voltorb", "c) Tentacool", "d) Joltik"],
        ["a) Snorunt", "b) Glalie", "c) Spheal", "d) Sealeo"]
    ]
    
    let respuestasCorrectas = [
        "c) Pikachu",  // Pregunta 1
        "d) Fuego",  // Pregunta 2
        "a) Ivysaur",  // Pregunta 3
        "a) Piedra Agua",  // Pregunta 4
        "b) Magnemite",  // Pregunta 5
        "b) Pikachu",  // Pregunta 6
        "a) Agua/Volador",  // Pregunta 7
        "a) Profesor Oak",  // Pregunta 8
        "c) 6",  // Pregunta 9
        "c) Zubat",  // Pregunta 10
        "b) Ho-Oh",  // Pregunta 11
        "a) Normal/Hada",  // Pregunta 12
        "a) Gyarados",  // Pregunta 13
        "c) 9",  // Pregunta 14
        "a) Revestimiento Metálico",  // Pregunta 15
        "d) Charizard",  // Pregunta 16
        "a) Rhydon",  // Pregunta 17
        "a) Volador/Hada",  // Pregunta 18
        "a) Agua/Hielo",  // Pregunta 19
        "c) Gyarados",  // Pregunta 20
        "a) Riolu",  // Pregunta 21
        "a) Mew",  // Pregunta 22
        "c) 140",  // Pregunta 23
        "b) Impostor",  // Pregunta 24
        "a) Gengar",  // Pregunta 25
        "a) Roca del Rey",  // Pregunta 26
        "a) Aerodactyl",  // Pregunta 27
        "a) Acero/Psíquico",  // Pregunta 28
        "a) Vibrava",  // Pregunta 29
        "a) Giratina",  // Pregunta 30
        "a) Fuego",  // Pregunta 31
        "a) Togetic",  // Pregunta 32
        "a) Bulbasaur",  // Pregunta 33
        "a) Slowking",  // Pregunta 34
        "a) Froakie",  // Pregunta 35
        "a) Rowlet",  // Pregunta 36
        "a) Nihilego",  // Pregunta 37
        "a) Registeel",  // Pregunta 38
        "a) Psíquico",  // Pregunta 39
        "a) Porygon-Z",  // Pregunta 40
        "a) Snorlax",  // Pregunta 41
        "a) Kyogre",  // Pregunta 42
        "a) Dragapult",  // Pregunta 43
        "a) Latios",  // Pregunta 44
        "a) Umbreon",  // Pregunta 45
        "a) Flygon",  // Pregunta 46
        "a) Lunala",  // Pregunta 47
        "a) Victini",  // Pregunta 48
        "a) Qwilfish",  // Pregunta 49
        "a) Snorunt"   // Pregunta 50
    ]
    
    var indicePreguntaActual = 0
    var vidas = 3
    var tiempoPregunta = 15
    var timerPregunta: Timer?
    var puntaje = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarPregunta()
        iniciarTimerPregunta()
        lblPuntaje.text = "\(puntaje)"
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        for boton in btnRespuestas
        {
            boton.layer.cornerRadius = 10
        }
        
        ViewJuego.layer.cornerRadius = 20
        imgPregunta.layer.cornerRadius = 20
        
        btnTerminarPartida.layer.cornerRadius = 10
    }
        
    func iniciarTimerPregunta() {
        tiempoPregunta = 15
        lblTiempo.text = "15"
        timerPregunta?.invalidate()
        
        timerPregunta = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.tiempoPregunta -= 1
            self.lblTiempo.text = "\(self.tiempoPregunta)"
            
            if self.tiempoPregunta <= 0 {
                self.timerPregunta?.invalidate()
                self.tiempoAgotado()
            }
        }
    }
    
    func tiempoAgotado() {
        for boton in btnRespuestas {
            boton.isEnabled = false
        }
        restarVida()
    }
    
    @IBAction func seleccionarRespuesta(_ sender: UIButton) {
        if vidas <= 0 { return }
        
        let respuestaSeleccionada = sender.currentTitle ?? ""
        timerPregunta?.invalidate()
        
        for boton in btnRespuestas {
            boton.isEnabled = false
        }
        
        if respuestaSeleccionada == respuestasCorrectas[indicePreguntaActual] {
            puntaje += 75 + tiempoPregunta
            lblPuntaje.text = "\(puntaje)"
            sender.backgroundColor = .green
            avanzarPregunta()
        } else {
            sender.backgroundColor = .red
            restarVida()
        }
    }
    
    func mostrarPregunta() {
        guard indicePreguntaActual < preguntas.count else { return }
        
        imgPregunta.image = UIImage(named: imagenes[indicePreguntaActual])
        lblPregunta.text = preguntas[indicePreguntaActual]
        
        for (indice, boton) in btnRespuestas.enumerated() {
            boton.setTitle(opciones[indicePreguntaActual][indice], for: .normal)
            boton.isEnabled = true
            boton.backgroundColor = .systemBlue
        }
        
        iniciarTimerPregunta()
    }
    
    func avanzarPregunta() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.indicePreguntaActual += 1
            if self.indicePreguntaActual < self.preguntas.count {
                self.mostrarPregunta()
            } else {
                self.mostrarPuntajeFinal()
            }
        }
    }
    
    func restarVida() {
        vidas -= 1
        actualizarVidasUI()
        
        if vidas <= 0 {
            mostrarFinDelJuego()
        } else {
            let alerta = UIAlertController(title: "Incorrecto", message: "Te quedan \(vidas) vidas.", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Siguiente", style: .default) { _ in
                self.avanzarPregunta()
            })
            present(alerta, animated: true)
        }
    }
    
    func actualizarVidasUI() {
        if vidas == 3 {
            imgVida1.image = UIImage(named: "pokeball")
            imgVida2.image = UIImage(named: "pokeball")
            imgVida3.image = UIImage(named: "pokeball")
        }
        
        if vidas == 2 {
            imgVida1.image = UIImage(named: "pokeball")
            imgVida2.image = UIImage(named: "pokeball")
            imgVida3.image = UIImage(named: "pokeball_abierta")
        }
        
        if vidas == 1 {
            imgVida1.image = UIImage(named: "pokeball")
            imgVida2.image = UIImage(named: "pokeball_abierta")
            imgVida3.image = UIImage(named: "pokeball_abierta")
        }
        
        if vidas == 0 {
            imgVida1.image = UIImage(named: "pokeball_abierta")
            imgVida2.image = UIImage(named: "pokeball_abierta")
            imgVida3.image = UIImage(named: "pokeball_abierta")
        }
    }
    
    func mostrarFinDelJuego() {
        timerPregunta?.invalidate()
        let alerta = UIAlertController(title: "Juego Terminado", message: "¡Has perdido todas tus vidas!", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Reiniciar", style: .default) { _ in
            self.reiniciarJuego()
        })
        alerta.addAction(UIAlertAction(title: "Volver a pantalla de inicio", style: .default) { _ in
            self.navegarAPantallaDeInicio()
        })
        present(alerta, animated: true)
    }
    
    func reiniciarJuego() {
        indicePreguntaActual = 0
        vidas = 3
        puntaje = 0
        lblPuntaje.text = "\(puntaje)"
        timerPregunta?.invalidate()
        actualizarVidasUI()
        mostrarPregunta()
    }
    
    func mostrarPuntajeFinal() {
        timerPregunta?.invalidate()
        
        if DatosPuntajes.sharedDatos().esNuevoRecord(puntaje: puntaje) {
            mostrarAlertaParaNombre(puntaje: puntaje)
        } else {
            let alerta = UIAlertController(
                title: "Trivia Terminada",
                message: "Has completado todas las preguntas, obtuviste un puntaje de \(puntaje)",
                preferredStyle: .alert
            )
            
            alerta.addAction(UIAlertAction(title: "Regresar al inicio", style: .default) { _ in
                self.navegarAPantallaDeInicio()
            })
            
            present(alerta, animated: true)
        }
    }
    
    func navegarAPantallaDeInicio() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func AcabarPartida(_ sender: Any)
    {
        navegarAPantallaDeInicio()
    }

    func mostrarAlertaParaNombre(puntaje: Int) {
        let alerta = UIAlertController(
            title: "¡Has roto un nuevo récord con un puntaje de: \(puntaje)!",
            message: "Ingresa tu nombre",
            preferredStyle: .alert
        )
        
        alerta.addTextField { textField in
            textField.placeholder = "Nombre"
        }
        
        let guardarAccion = UIAlertAction(title: "Guardar", style: .default) { _ in
            guard let nombre = alerta.textFields?.first?.text, !nombre.isEmpty else {
                self.mostrarAlertaParaNombre(puntaje: puntaje)
                return
            }
            
            DatosPuntajes.sharedDatos().agregarPuntaje(
                jugador: nombre,
                puntaje: puntaje
            )
            
            self.navegarAPantallaDeInicio()
        }
        
        alerta.addAction(guardarAccion)
        present(alerta, animated: true)
    }
}
