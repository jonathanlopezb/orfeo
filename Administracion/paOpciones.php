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


?>
<table><tr><td> </td></tr></table>
  <table BORDER=2  cellpad=2 cellspacing='2' WIDTH=100%  align='center' class="borde_tab" cellpadding="2">
     <tr> 
	   <?
       if (isset($swListar))  {
	   ?>
       <td width='50%'   class="titulos2" >
         <table cellpadding="0" cellspacing="0" border="2" width="100%" >
           <tr>
		        <td width='30%' align='left' height="40" class="titulos2" ><b>Listar Por </b>
		        <a href='<?= $pagina_actual?>?<?=$encabezado?>98&ordcambio=1' alt='Ordenar Por Leidos' >
		        <span class='leidos'>Impresos</span></a>
                <?=$img7 ?> <a href='<?=$pagina_actual?>?<?=$encabezado?>99&ordcambio=1'  alt='Ordenar Por Leidos'><span class='no_leidos'>
                    Por Imprimir</span></a>
		        </td>
		   </tr>
         </table>
       </td>
	   <?
       } 
	   ?>
       <td width='50%' align="center" class="titulos2" > 
		<a href='<?=$pagina_sig?>?<?=$encabezado?>'></a>
           <input type=submit value="<?=$accion_sal?>" name=Enviar id=Enviar valign='middle' class='botones' onclick="Marcar(2);">			
       </td>
     </tr>
   </table>

<script>
function Marcar(tipoAnulacion)
{
	marcados = 0;

	for(i=0;i<document.formEnviar.elements.length;i++)
	{
	
			if(document.formEnviar.elements[i].checked==1)
			{
				
				marcados++;
			}
	}
	if(marcados>=1)
	{

	  document.formEnviar.submit();
	}
	else
	{
		alert("Debe seleccionar un usuario");
	}
}
		<!-- Funcion que activa el sistema de marcar o desmarcar todos los check  -->
		
		function markAll()
		
		{
		if(document.formEnviar.elements['checkAll'].checked)
		for(i=1;i<document.formEnviar.elements.length;i++)
		document.formEnviar.elements[i].checked=1;
		else
				for(i=1;i<document.formEnviar.elements.length;i++)
				document.formEnviar.elements[i].checked=0;
		}
</script>
