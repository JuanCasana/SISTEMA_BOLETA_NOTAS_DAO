
package Controlador;

public class BoletaNotasControlador {
    private String Dni;
    private String IdAlumnoBN;
    private String IdMatriculaBN;
    private String NombreProgramaEstudioBN;
    private String IdPeriodoAcademicoBN;
    private String NombreCompletoBN;

    public BoletaNotasControlador() {
    }

    public BoletaNotasControlador(String Dni, String IdAlumnoBN, String IdMatriculaBN, String NombreProgramaEstudioBN, String IdPeriodoAcademicoBN, String NombreCompletoBN) {
        this.Dni = Dni;
        this.IdAlumnoBN = IdAlumnoBN;
        this.IdMatriculaBN = IdMatriculaBN;
        this.NombreProgramaEstudioBN = NombreProgramaEstudioBN;
        this.IdPeriodoAcademicoBN = IdPeriodoAcademicoBN;
        this.NombreCompletoBN = NombreCompletoBN;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
    }

    public String getIdAlumnoBN() {
        return IdAlumnoBN;
    }

    public void setIdAlumnoBN(String IdAlumnoBN) {
        this.IdAlumnoBN = IdAlumnoBN;
    }

    public String getIdMatriculaBN() {
        return IdMatriculaBN;
    }

    public void setIdMatriculaBN(String IdMatriculaBN) {
        this.IdMatriculaBN = IdMatriculaBN;
    }

    public String getNombreProgramaEstudioBN() {
        return NombreProgramaEstudioBN;
    }

    public void setNombreProgramaEstudioBN(String NombreProgramaEstudioBN) {
        this.NombreProgramaEstudioBN = NombreProgramaEstudioBN;
    }

    public String getIdPeriodoAcademicoBN() {
        return IdPeriodoAcademicoBN;
    }

    public void setIdPeriodoAcademicoBN(String IdPeriodoAcademicoBN) {
        this.IdPeriodoAcademicoBN = IdPeriodoAcademicoBN;
    }

    public String getNombreCompletoBN() {
        return NombreCompletoBN;
    }

    public void setNombreCompletoBN(String NombreCompletoBN) {
        this.NombreCompletoBN = NombreCompletoBN;
    }
    
    
}
