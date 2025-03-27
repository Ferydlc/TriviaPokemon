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
    
    // MARK: - Manejo del archivo .plist
    func abrirArchivo() {
        let ruta = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/puntajes.plist"
        let urlArchivo = URL(fileURLWithPath: ruta)
        
        do {
            let archivo = try Data(contentsOf: urlArchivo)
            let objeto = try PropertyListSerialization.propertyList(from: archivo, format: nil)
            
            // Manejar migración desde formato antiguo
            if let array = objeto as? [[String: Any]] {
                self.puntajes = array
            } else if let diccionarioAntiguo = objeto as? [String: Any] { // Formato antiguo (1 jugador)
                let jugador = diccionarioAntiguo["jugador"] as? String ?? ""
                let puntaje = diccionarioAntiguo["puntaje"] as? Int ?? 0
                self.puntajes = [["jugador": jugador, "puntaje": puntaje]]
            }
            
            print("✅ Archivo CARGADO desde: \(urlArchivo)")
            print("📝 Contenido actual: \(self.puntajes)")
            
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
            print("💾 Archivo GUARDADO en: \(urlArchivo)")
        } catch {
            print("⛔️ Error al guardar: \(error)")
        }
    }
    
    // MARK: - Lógica para agregar y ordenar puntajes
    func agregarPuntaje(jugador: String, puntaje: Int) {
        let nuevoPuntaje = ["jugador": jugador, "puntaje": puntaje] as [String : Any]
        
        // 1. Agregar a la lista
        self.puntajes.append(nuevoPuntaje)
        
        // 2. Ordenar DESC por puntaje
        self.puntajes.sort { ($0["puntaje"] as! Int) > ($1["puntaje"] as! Int) }
        
        // 3. Limitar a 5 elementos
        if self.puntajes.count > 5 {
            self.puntajes = Array(self.puntajes[0..<5])
        }
        
        // 4. Guardar cambios
        self.guardarArchivo()
    }
}
