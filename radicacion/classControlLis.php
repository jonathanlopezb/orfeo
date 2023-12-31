<?php
/**
 * En este frame se van cargado cada una de las funcionalidades del sistema
 *
 * Descripcion Larga
 *
 * @category
 * @package      SGD Orfeo
 * @subpackage   Main
 * @author       Community
 * @author       Skina Technologies SAS (http://cco.gov.co)
 * @license      GNU/GPL <http://www.gnu.org/licenses/gpl-2.0.html>
 * @link         http://www.orfeolibre.org
 * @version      SVN: $Id$
 * @since
 */

        /*---------------------------------------------------------+
        |                     INCLUDES                             |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                    DEFINICIONES                          |
        +---------------------------------------------------------*/


        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


   class CONTROL_ORFEO
   {
   var $cursor;
   var $db;
   var $num_expediente;  // Almacena el nume del expediente
   var $estado_expediente; // Almacena el estado 0 para organizaci�n y 1 para indicar ke ya esta clasificado fisicamente en archivo
   var $exp_titulo;
   var $exp_asunto;
   var $campos_tabla;
   var $campos_vista;
   var $campos_width;
   var $campos_align;
   var $tabla_html;
   var $tabla_htmlE;
     
	 function CONTROL_ORFEO(& $db)
	 {
	 $this->cursor = & $db;
	 $this->db = & $db;	 
	 }
	 
	 function tabla_sql($query,$fecha_ini,$fecha_fin)
	 {
	    error_reporting(7);
	    $jh_db = $this->cursor->query($query);
	
	    $tabla_htmlE = "<table border=1 width=100%>";
	    echo "<table class='borde_tab' border='2' width=100%>";
		if ($jh_db)
			{
			echo "<tr class='tpar'>";
			$tabla_htmlE .= "<tr bgcolor='#D0D0FF'>";
			$iii = 0;
			foreach($this->campos_vista as $campos_d)
			{
	        		$width = $this->campos_width[$iii];
					$tabla_htmlE .=  "<td width='$width' bgcolor='#CCCCCC'><center>$campos_d</td>";
					echo "<td class='titulos3'  ><center>$campos_d</td>";
					$iii++;
			}
			$tabla_htmlE .=  "</tr>";
			echo "</tr>";
			}
	$tabla_htmlE .=  "</table>";
	$this->tabla_htmlE .= $tabla_htmlE;

	return $nextval;
    }
	
    function tabla_Cuerpo()
	 {
	   $tabla_html = "<table border=1 width=100%>";
	    error_reporting(7);
		$tabla_html .=  "<tr>";
		echo "<tr class=paginacion>";
		$iii = 0;
		foreach($this->campos_tabla as $campos_d)
				{
				    switch  ($this->campos_align[$iii])
					{
					case "L":
						$align = "Left";
						break;
					case "C":
						$align = "Center";
						break;
					case "R":
						$align = "Right";
						break;
					default:
						$align = "Left";
						break;
				     }
				error_reporting(7);
			
				$width = $this->campos_width[$iii];
				$width_max = intval(36 * $width / 250);	
	
				//by skina evaluo NULL o espacios vacios if(!$campos_d or $campos_d=='') $dato = "-"; else $dato=substr($campos_d,0,$width_max);
				if(!$campos_d or $campos_d==''or $campos_d==' ' or $campos_d=='NULL' or strlen($campos_d)==0) $dato = "-";
				 else $dato=substr($campos_d,0,$width_max);
				$tabla_html .=  "<td  align=$align width=".$this->campos_width[$iii]." height=27>$dato</td>";
				echo "<td align=$align>".$campos_d."</td>";
				$iii++;
			}
			$tabla_html .=  "</tr>";
			echo "</tr>";
	$tabla_html .=  "</table>";
	$this->tabla_html .= $tabla_html;
	return $nextval;
    }
}
?>
