/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Conexion;
import Modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Yisus
 */
public class Controlador extends Conexion {

    public int validar(String user, String password) throws SQLException {
        int total = 0;
        if (!hayConexion()) {
            throw new SQLException(" No existe conexion abierta ");
        }

        PreparedStatement pst = null;
        ResultSet rst = null;

        try {
            String query;
            query = "SELECT COUNT(nombre) AS i FROM usuario WHERE email ='" + user + "'"
                    + " AND contraseña = '" + password + "' ";                   //Definir la consulta
            pst = con.prepareStatement(query);                      //Prepararla

            rst = pst.executeQuery();                               //Ejecutarla 

            while (rst.next()) {
                total = rst.getInt(1);
            }

        } finally {
            if (pst != null) {
                pst.close();
                pst = null;
            }
            if (rst != null) {
                rst.close();
                rst = null;
            }
        }

        return total;
    }

    public void addUSer(Usuario usuario) throws SQLException {
        //SELECT * FROM productos 
        if (!hayConexion()) {
            throw new SQLException(" No existe conexion abierta ");
        }
        
        
        LinkedList lista = new LinkedList();
        PreparedStatement pst = null;
        ResultSet rst = null;
        try {
            String query;
            query = " INSERT INTO `usuario`\n"
                    + " ( `nombre`, `apellido`, `contraseña`, `email`)\n"
                    + " VALUES\n"
                    + " (?, ?, ?, ?) ";                    //Definir la consulta
            pst = con.prepareStatement(query);                      //Prepararla

            pst.setString(1, usuario.getNombre());
            pst.setString(2, usuario.getApellido());
            pst.setString(3, usuario.getContraseña());
            pst.setString(4, usuario.getEmail());

            pst.execute();                               //Ejecutarla 

        } finally {
            if (pst != null) {
                pst.close();
                pst = null;
            }
            if (rst != null) {
                rst.close();
                rst = null;
            }
        }

    }
}
