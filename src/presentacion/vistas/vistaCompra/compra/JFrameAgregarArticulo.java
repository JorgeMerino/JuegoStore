package presentacion.vistas.vistaCompra.compra;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.JButton;
import presentacion.ListaComandos;
import presentacion.controlador.Contexto;
import presentacion.controlador.Controlador;

/**
 * Clase de la capa presentaci�n que permite la implementaci�n de la ventana de agregar un articulo
 */
public class JFrameAgregarArticulo extends JFrame {
	
	private static final long serialVersionUID = 1L;
	private JTextField idProducto;
	private JTextField cantidadProducto;
	private JButton enviar;
	private JButton volver;
	
	public JFrameAgregarArticulo(){
		Dimension pantalla = Toolkit.getDefaultToolkit().getScreenSize();
		
		this.setTitle("Agregar articulo");
		this.setLayout(new FlowLayout());
		this.setResizable(false);
		this.addWindowListener(new WindowAdapter(){ public void windowClosing(WindowEvent evt) {cerrar();}}); 
		
		JPanel buttonPanel = new JPanel(new GridLayout(4, 1));

		idProducto = new JTextField("Id producto");
		cantidadProducto = new JTextField("Cantidad de producto");
		enviar = new JButton("Enviar");
		volver = new JButton("Volver");
		
		idProducto.setPreferredSize(new Dimension(320, 35));
		
		enviar.addActionListener(new ActionListenerAgregarArticuloCompra());
		
		volver.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent e){
				cerrar();
			}
		});
		
		buttonPanel.add(idProducto);
		buttonPanel.add(cantidadProducto);
        buttonPanel.add(enviar);
        buttonPanel.add(volver);
		this.getContentPane().add(buttonPanel);
		this.pack();
		
		Dimension ventana = this.getSize();
		this.setLocation((pantalla.width-ventana.width) / 2, (pantalla.height-ventana.height) / 2);
		this.setLocationRelativeTo(null);
	    this.setDefaultCloseOperation(this.EXIT_ON_CLOSE);
	}
	
	public class ActionListenerAgregarArticuloCompra implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent arg0){
			try{
				Controlador.getInstance().accion(ListaComandos.NEGOCIO_AGREGAR_ARTICULO_COMPRA, new Contexto(Integer.parseInt(idProducto.getText()), Integer.parseInt(cantidadProducto.getText())));
			}
			catch(NumberFormatException e){
				JOptionPane.showMessageDialog(null, "Formato articulo incorrecto", "Informacion", JOptionPane.INFORMATION_MESSAGE);
			}
		}
	}
	
	public void cerrar()
	{
		idProducto.setText("Id producto");
		cantidadProducto.setText("Cantidad de producto");
		this.setVisible(false);
		Controlador.getInstance().accion(ListaComandos.VENTANA_GESTION_CARRITO_COMPRA, null);
	}
}