//
//  DatosPuntajes.swift
//  TriviaPokemon
//
//  Created by mac on 25/03/25.
//

import UIKit

class DatosPuntajes: NSObject {
    
    // Cambiar a un arreglo de diccionarios para múltiples jugadores
    var puntajes: [[String: Any]] = []
    static var datos: DatosPuntajes!
    
    override init() {
        super.init()
    }
    
    static func sharedDatos() -> DatosPuntajes {
        if datos == nil {
            datos = DatosPuntajes()
            datos.abrirArchivo()
        }
        return datos
    }
    
    func abrirArchivo() {
        let ruta = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/puntajes.plist"
        let urlArchivo = URL(fileURLWithPath: ruta)
        
        do {
            let archivo = try Data(contentsOf: urlArchivo)
            let objeto = try PropertyListSerialization.propertyList(from: archivo, format: nil)
            
            if let array = objeto as? [[String: Any]] {
                self.puntajes = array
            } else if let diccionarioAntiguo = objeto as? [String: Any] {
                let jugador = diccionarioAntiguo["jugador"] as? String ?? ""
                let puntaje = diccionarioAntiguo["puntaje"] as? Int ?? 0
                self.puntajes = [["jugador": jugador, "puntaje": puntaje]]
            }
            
            print("Archivo CARGADO desde: \(urlArchivo)")
            print("Contenido actual: \(self.puntajes)")
            
        } catch {
            print("⚠️ El archivo no existe. Se inicia con datos vacíos. Error: \(error)")
            self.puntajes = []
        }
    }
    
    func guardarArchivo() {
        let ruta = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/puntajes.plist"
        let urlArchivo = URL(fileURLWithPath: ruta)
        
        do {
            let archivo = try PropertyListSerialization.data(
                fromPropertyList: self.puntajes,
                format: .xml,
                options: 0
            )
            try archivo.write(to: urlArchivo)
            print("Archivo GUARDADO en: \(urlArchivo)")
        } catch {
            print("Error al guardar: \(error)")
        }
    }
    
    func agregarPuntaje(jugador: String, puntaje: Int) {
        let nuevoPuntaje = ["jugador": jugador, "puntaje": puntaje] as [String: Any]
        
        // Insertar en la posición correcta para mantener orden
        var insertado = false
        for (index, puntajeExistente) in puntajes.enumerated() {
            if let puntajeActual = puntajeExistente["puntaje"] as? Int, puntaje > puntajeActual {
                puntajes.insert(nuevoPuntaje, at: index)
                insertado = true
                break
            }
        }
        
        if !insertado && puntajes.count < 5 {
            puntajes.append(nuevoPuntaje)
        }
        
        // Limitar a 5 elementos
        if puntajes.count > 5 {
            puntajes = Array(puntajes[0..<5])
        }
        
        guardarArchivo()
    }
    
    func esNuevoRecord(puntaje: Int) -> Bool {
        if puntajes.count < 5 {
            return true
        } else {
            guard let menorPuntaje = puntajes.last?["puntaje"] as? Int else {
                return false
            }
            return puntaje > menorPuntaje
        }
    }
}
