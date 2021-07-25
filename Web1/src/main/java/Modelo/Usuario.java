/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Yisus
 */
public class Usuario {

    
    private String nombre;
    private String apellido;
    private String contraseña;
    private String email;

    public Usuario() {
    }

    public Usuario(String nombre, String apellido, String contraseña, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.email = email;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    @Override
    public String toString() {
        return super.toString(); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static Usuario load(ResultSet rs)throws SQLException{
        Usuario usuario= new Usuario();
        
        
        usuario.setNombre(rs.getString(1));
        usuario.setApellido(rs.getString(2));
        usuario.setContraseña(rs.getString(3));
        usuario.setEmail(rs.getString(4));
        
                       
        return usuario;
    }

}


