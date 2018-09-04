package presentacion.comandos.imp;

import presentacion.ListaComandos;
import presentacion.comandos.Comando;
import presentacion.controlador.Contexto;

public class VistaBotoneraEmpleadoComando implements Comando {

	@Override
	public Contexto execute(Object datos) {
		return new Contexto(ListaComandos.VENTANA_PRINCIPAL_EMPLEADO, datos);
	}
}
