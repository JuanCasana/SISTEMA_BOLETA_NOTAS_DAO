package Reporte;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;

public class GeneradorJasper {
    public static void main(String[] args) {
        try {
            // Ruta del archivo .jrxml
            String rutaJrxml = "src/Reporte/ImprimirBoletaNotas.jrxml";
            // Ruta donde se guardará el archivo .jasper
            String rutaJasper = "src/Reporte/ImprimirBoletaNotas.jasper";

            // Compila el archivo jrxml y genera el archivo jasper
            JasperReport reporte = JasperCompileManager.compileReport(rutaJrxml);

            // Guarda el archivo jasper en el sistema
            JasperCompileManager.compileReportToFile(rutaJrxml, rutaJasper);

            System.out.println("Reporte compilado correctamente: " + rutaJasper);
        } catch (Exception e) {
            System.err.println("Error al compilar el reporte: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

