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
/* ---------------------------------------------------------+
  |                     INCLUDES                             |
  +--------------------------------------------------------- */


/* ---------------------------------------------------------+
  |                    DEFINICIONES                          |
  +--------------------------------------------------------- */
session_start();
error_reporting(7);
$url_raiz = "..";
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];
$assoc = $_SESSION['assoc'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */

//Modificado Idrd 29-abr-2008 descomentariar session-start
$krd = $krd;
$dep_sel = $_POST['dep_sel'];
$depeBuscada = $_POST['depeBuscada'];
$filtroSelect = $_POST['filtroSelect'];
$tpAnulacion = $_POST['tpAnulacion'];
$usua_nomb = $_SESSION['usua_nomb'];
$depe_nomb = $_SESSION['depe_nomb'];
$checkValue = $_POST['checkValue'];

include_once "$dir_raiz/include/db/ConnectionHandler.php";
//require_once("$dir_raiz/class_control/AplExternaError.php");
require_once("$dir_raiz/class_control/ControlAplIntegrada.php");
require_once("$dir_raiz/config.php");

$db = new ConnectionHandler("$dir_raiz");

if (!$_SESSION["dependencia"])
    include_once "$dir_raiz/rec_session.php";
error_reporting(7);
$url_raiz = "..";
//$db->conn->debug = true;
$objCtrlAplInt = new ControlAplIntegrada($db);
?>
<html>
    <head>
        <title>Enviar Datos</title>
        <link href="<?= '..' . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
        <?php
        /*  FILTRO DE DATOS
         *  @$setFiltroSelect  Contiene los valores digitados por el usuario separados por coma.
         *  @$filtroSelect Si SetfiltoSelect contiene algunvalor la siguiente rutina realiza el arreglo de la condición para la consulta a la base de datos y lo almacena en whereFiltro.
         *  @$whereFiltro  Si filtroSelect trae valor la rutina del where para este filtro es almacenado aqui.
         *  
         */
        if ($checkValue) {
            $num = count($checkValue);
            $i = 0;
            while ($i < $num) {
                $record_id = key($checkValue);
                $setFiltroSelect .= $record_id;
                //Validacion de anulaciÃ³n respecto de aplicativos externos  
//                $puedeContinuar = $objCtrlAplInt->contiInstancia($record_id, $MODULO_ANULACION, 1);
//
//                if ($puedeContinuar != 1) {
//                    $objError = new AplExternaError();
//                    $objError->setMessage($puedeContinuar);
//                    $mensaje_error = $objError->getMessage();
//                    $mensaje_error = "<center><table class='borde_tab' width=100% CELSPACING=5><tr class=titulosError><td><center> < $mensaje_error > <BR> $record_id</CENTER></td></tr></table><center>";
//                    die($mensaje_error);
//                }

                if ($i <= ($num - 2)) {
                    $setFiltroSelect .= ",";
                }
                next($checkValue);
                $i++;
            }
            if ($radicadosSel) {
                $whereFiltro = " and b.radi_nume_radi in($setFiltroSelect)";
            }
        }
        if ($setFiltroSelect) {
            $filtroSelect = $setFiltroSelect;
        }
        if ($filtroSelect) {
// En este proceso se utilizan las variabels $item, $textElements, $newText que son temporales para esta operacion.
            $filtroSelect = trim($filtroSelect);
            $textElements = preg_split("/[\s,]+/", $filtroSelect);
            $newText = "";
            foreach ($textElements as $item) {
                $item = trim($item);
                if (strlen($item) != 0) {
                    if (strlen($item) <= 6) {
                        $sec = str_pad($item, 6, "0", STR_PAD_left);
                        //$item = date("Y") . $dep_sel . $sec;
                    } else {
                        
                    }
                    $whereFiltro .= " b.radi_nume_radi = '$item' or";
                }
            }
            if (substr($whereFiltro, -2) == "or") {
                $whereFiltro = substr($whereFiltro, 0, strlen($whereFiltro) - 2);
            }
            if (trim($whereFiltro)) {
                $whereFiltro = "and ( $whereFiltro ) ";
            }
        }
        /*
         * OPERACIONES EN JAVASCRIPT 
         * @marcados Esta variable almacena el numeo de chaeck seleccionados.
         * @document.formAnulados  Este subNombre de variable me indica el formulario principal del listado generado.
         * @tipoAnulacion Define si es una solicitud de anulacion  o la Anulacion Final del Radicado.
         *
         * Funciones o Metodos EN JAVA SCRIPT
         * Anular()  Anula o solicita esta dependiendo del tipo de anulacin.  Previamente verifica que este seleccionado algun  radicado.
         * markAll() Marca o desmarca los check de la pagina.
         *
         */
        ?>
        <script>
                function Anular(tipoAnulacion) {                 marcados = 0;
                    if (document.formAnulados.observa.value.length <= 6) {                     alert("Por favor escriba un comentario.");
                    return;
                }
                if (document.formAnulados.observa.value.length >= 250) {
                        alert("Por favor revise su comentario, debe ser de maximo 250 caracteres.");
                    return;
                }
                for (i = 4; i < document.formAnulados.elements.length; i++) {
                    if (document.formAnulados.elements[i].checked == 1) {
                        marcados++;
                    }
                }
                if (marcados >= 1) {
                    document.formAnulados.submit();
                } else {
                    alert("Debe marcar un elemento");
                }
            }
<!-- Funcion que activa el sistema de marcar o desmarcar todos los check  -->

            function markAll(){
                if (document.formAnulados.elements['checkAll'].checked)
                    for (i = 1; i < document.formAnulados.elements.length; i++)
                        document.formAnulados.elements[i].checked = 1;
                else
                    for (i = 1; i < document.formAnulados.elements.length; i++)
                        document.formAnulados.elements[i].checked = 0;
            }
        </script>
        <?php
        /**
         * Inclusion de archivos para utiizar la libreria ADODB 
         *
         */
//error_reporting(E_ALL); # reporta todos los errores
//ini_set("display_errors", "1"); # pero no los muestra en la pantalla
//define('ADODB_ERROR_LOG_TYPE', 3);
        /*
         * Generamos el encabezado que envia las variable a la paginas siguientes.
         * Por problemas en las sesiones enviamos el usuario.
         * @$encabezado  Incluye las variables que deben enviarse a la singuiente pagina. 
         * @$linkPagina  Link en caso de recarga de esta pagina.
         */
        $encabezado = "" . session_name() . "=" . session_id() . "&krd=$krd&dep_sel= $dep_sel &depeBuscada=$depeBuscada&filtroSelect=$filtroSelect&tpAnulacion=$tpAnulacion";
        $linkPagina = "$PHP_SELF?$encabezado&orderTipo=$orderTipo&orderNo=";
        ?>
    </head><style type="text/css">
        <!--
        .textoOpcion {  font-family: Arial, Helvetica, sans-serif; font-size: 8pt; color: #000000; text-decoration: underline}
        -->
    </style>
    <body bgcolor="#FFFFFF" topmargin="0" onLoad="markAll();">

        <table border=0 width=100% cellpadding="0" cellspacing="0">
            <tr >
                <td width=100%>
                    <br>
                    <form action='enviarReporte.php?<?= $encabezado ?>' method=post name=formAnulados>
                        <input type='hidden' name=depsel value='160'>
                        <input type=hidden name=enviara value='9'>
                        <input type=hidden name=EnviaraV value=''>
                        <table BORDER=0 WIDTH=98% cellspace=1 align="center" class="borde_tab">
                            <tr>
                                <td width=30% class="titulos2"><span class='titulos2'>Usuario</span>
                                </td>
                                <td  width='30%' class="titulos2"><span class='titulos2'> Dependencia</span>
                                </td>
                                <td class="titulos2" rowspan="2" >
                                    Solicitar anulacion de documento<BR>
                                </td>
                                <td width='5' class="titulos2" rowspan="2">
                                    <input type=button value=REALIZAR name=enviardoc align=bottom class=botones id=REALIZAR onclick="Anular(2);">
                                </td>
                            </tr>
                            <tr>
                                <td width=30% class="titulos2">
                                    <span class='titulos2'><?= $usua_nomb ?></span>
                                </td>
                                <td  width='30%' class="titulos2">
                                    <span class=titulos2><?= $depe_nomb ?></span><br>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="4" class="celdaGris">
                                    <span class="leidos">
                                        <br>Se solicita la anulaci&oacute;n de los radicados seleccionados. Por favor diligencie el motivo de la anulaci&oacute;n</span><br>
                                    <textarea name=observa cols=70 rows=2 class=tex_area></textarea>
                                    <input type=hidden name=enviar value=enviarsi>
                                    <input type=hidden name=enviara value='9'>
                                    <input type=hidden name=depsel value=$depsel>
                                    <input type=hidden name=EnviaraV value=''>
                                    <input type=hidden name=carpeta value=12><input type=hidden name=carpper value=10001>
                                </td>
                            </tr>
                        </TABLE>
                        <br>
                        <?php
                        /*  GENERACION LISTADO DE RADICADOS
                         *  Aqui utilizamos la clase adodb para generar el listado de los radicados
                         *  Esta clase cuenta con una adaptacion a las clases utiilzadas de orfeo.
                         *  el archivo original es adodb-pager.inc.php la modificada es adodb-paginacion.inc.php
                         */
                        error_reporting(7);
                        if (!$orderNo)
                            $orderNo = 0;
                        $order = $orderNo + 1;
                        if ($orden_cambio == 1) {
                            if (!$orderTipo) {
                                $orderTipo = "desc";
                            } else {
                                $orderTipo = "";
                            }
                        }
                        $sqlFecha = $db->conn->SQLDate("d-m-Y H:i A", "b.RADI_FECH_RADI");
                        include ($dir_raiz . "/include/query/anulacion/querySolAnulacion.php");
                        $db->debug = true;

                        $pager = new ADODB_Pager($db, $isql, 'adodb', true, $orderNo, $orderTipo, "..");
                        $pager->checkAll = true;
                        $pager->checkTitulo = true;
                        $pager->toRefLinks = $linkPagina;
                        $pager->toRefVars = $encabezado;
                        $pager->Render($rows_per_page = 20, $linkPagina, $checkbox = chkAnulados);
//$e = ADODB_Pear_Error();
                        ?>

                        <input type=hidden name=depsel value='160'>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
