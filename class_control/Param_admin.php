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
session_start();
error_reporting(7);
$url_raiz="..";
$dir_raiz=$_SESSION['dir_raiz'];
$ESTILOS_PATH2 =$_SESSION['ESTILOS_PATH2'];

        /*---------------------------------------------------------+
        |                       MAIN                               |
        +---------------------------------------------------------*/


require_once("$dir_raiz/include/db/ConnectionHandler.php");

class Param_admin {
	public $con;
	public $PARAM_CODIGO;
	public $PARAM_NOMBRE;
	public $PARAM_VALOR;
	public $PARAM_DESC;
	
	public function Param_admin($db){
		$this->con = & $db;
	}
	
	public static function getObject($con, $PARAM_CODIGO = '%', $PARAM_NOMBRE = '%'){
		$query = "SELECT * FROM SGD_PARAM_ADMIN 
			WHERE PARAM_CODIGO LIKE '$PARAM_CODIGO' AND PARAM_NOMBRE LIKE '$PARAM_NOMBRE' ";
        $rs = $con->query ( $query );
		if (count ( $rs ) > 0) {
			while ( ! $rs->EOF ) {
                $param = new Param_admin ( $con );
                $param->PARAM_CODIGO = $rs->fields ['PARAM_CODIGO'];
                $param->PARAM_NOMBRE = $rs->fields ['PARAM_NOMBRE'];
                $param->PARAM_VALOR = $rs->fields ['PARAM_VALOR'];
                $param->PARAM_DESC = $rs->fields ['PARAM_DESC'];
                             
                return $param;
			}	
		} else {
			return "";
		}
	}
	
	public function getPARAM_CODIGO() {
        return $this->PARAM_CODIGO;
	}
	
	public function setPARAM_CODIGO($PARAM_CODIGO) {
        $this->PARAM_CODIGO = $PARAM_CODIGO;
	}
	
	
	public function getPARAM_DESC() {
        return $this->PARAM_DESC;
	}
	
	public function setPARAM_DESC($PARAM_DESC) {
        $this->PARAM_DESC = $PARAM_DESC;
	}
	
	public function getPARAM_NOMBRE() {
        return $this->PARAM_NOMBRE;
	}
	
	public function setPARAM_NOMBRE($PARAM_NOMBRE) {
        $this->PARAM_NOMBRE = $PARAM_NOMBRE;
	}
		
 	public function setPARAM_VALOR($PARAM_VALOR) {
        $this->PARAM_VALOR = $PARAM_VALOR;
	}
	public function getPARAM_VALOR() {
        return $this->PARAM_VALOR;
	}
}
?>
