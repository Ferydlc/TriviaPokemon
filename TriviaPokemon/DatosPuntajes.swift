//
//  DatosPuntajes.swift
//  TriviaPokemon
//
//  Created by mac on 25/03/25.
//

import UIKit

class DatosPuntajes: NSObject {
    
    var jugador: String
    var puntaje: Int
    static var datos: DatosPuntajes!
    
    override init() {
        self.jugador = ""
        self.puntaje = 0
    }
    
    static func sharedDatos() -> DatosPuntajes {
         if datos == nil {
             datos = DatosPuntajes.init( )
        }
        return datos
    }
    
    //Abre el archivo persistente plist
    func abrirArchivo()
    {
        let ruta =
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/puntajes.plist"
                
        let urlArchivo = URL(fileURLWithPath: ruta)
        
        do
        {
            let archivo = try Data.init(contentsOf: urlArchivo)
            
            let diccionario = try PropertyListSerialization.propertyList(from: archivo, format:nil) as! [String:Any]
            
            jugador = diccionario["jugador"] as! String
            puntaje = diccionario["puntaje"] as! Int
            
            print(urlArchivo)
            print(diccionario)
        }
        catch
        {
            print("El archivo no existe ")
        }
    }

    //Guarda archivo persistente plist
    func guardarArchivo()
    {
        let ruta =
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/puntajes.plist"
        
        let urlArchivo = URL(fileURLWithPath: ruta)
        
        let diccionario : [String : Any] = ["jugador": self.jugador, "puntaje": self.puntaje]
        
        do
        {
            let archivo = try PropertyListSerialization.data(fromPropertyList: diccionario,format: .xml, options: NSPropertyListWriteStreamError)
            
            try archivo.write(to: urlArchivo)
        }
        catch
        {
            print("algo salio mal :(")
        }
    }
}
