package Modelo;

import Controlador.BoletaNotasControlador;
import Controlador.Conexion;
import Controlador.EstudianteControlador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoletaNotasDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<BoletaNotasControlador> CargarEstudianteBN(String dni) {
        List<BoletaNotasControlador> ListaEstudianteBN = new ArrayList<>();

        String sql = "SELECT * FROM VistaAlumnoMatricula WHERE Dni = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, dni);  // Establecer el DNI como parámetro de búsqueda
            rs = ps.executeQuery();
            while (rs.next()) {
                BoletaNotasControlador estudianteBN = new BoletaNotasControlador();
                estudianteBN.setIdAlumnoBN(rs.getString("IdAlumno"));
                estudianteBN.setDni(rs.getString("Dni"));
                estudianteBN.setIdMatriculaBN(rs.getString("IdMatricula"));
                estudianteBN.setNombreCompletoBN(rs.getString("NombreCompleto"));
                estudianteBN.setNombreProgramaEstudioBN(rs.getString("NombreProgramaEstudio"));
                estudianteBN.setIdPeriodoAcademicoBN(rs.getString("IdPeriodoAcademico"));

                ListaEstudianteBN.add(estudianteBN);
            }
        } catch (SQLException e) {
            System.err.println("Error al ejecutar la consulta: " + e.getMessage());
        }
        return ListaEstudianteBN;
    }

}
