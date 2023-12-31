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


/**
 * Modificacion Variables Globales Infometrika 2009-05
 * Licencia GNU/GPL 
 */
foreach ($_GET as $key => $valor) ${$key} = $valor;
foreach ($_POST as $key => $valor) ${$key} = $valor;


$krd = $_SESSION["krd"];
$dependencia = $_SESSION["dependencia"];
$usua_doc = $_SESSION["usua_doc"];
$codusuario = $_SESSION["codusuario"];
$tpNumRad = $_SESSION["tpNumRad"];
$tpPerRad = $_SESSION["tpPerRad"];
$tpDescRad = $_SESSION["tpDescRad"];
$tpDepeRad = $_SESSION["tpDepeRad"];
$dependenciaSalida =  $_SESSION["dependenciaSalida"];

if (!isset($_SESSION['dependencia']))
    include "../rec_session.php";

include_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "config.php";
include_once "$dir_raiz/include/db/ConnectionHandler.php";

$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
$db = new ConnectionHandler($dir_raiz);
$db->conn->SetFetchMode(ADODB_FETCH_ASSOC);

include "$dir_raiz/include/query/expediente/queryExcluirRadicado.php";

$dep_sel = $_POST['dep_sel'];
//echo '************* '.$dep_sel;

//if (!$dep_sel)
//    $dep_sel = $dependencia;

$buscar_rad = $_POST['buscar_rad'];

if (!isset($tipo_archivo))
    $tipo_archivo = 0;

function fnc_date_calcm($this_date, $num_month) {
    $my_time = strtotime($this_date); //converts date string to UNIX timestamp
    $timestamp = $my_time - ($num_month * 2678400 ); //calculates # of days passed ($num_days) * # seconds in a day (86400)
    $return_date = date("Y-m-d", $timestamp);  //puts the UNIX timestamp back into string format
    return $return_date; //exit function and return string
}

function fnc_date_calc($this_date, $num_day) {
    $my_time = strtotime($this_date); //converts date string to UNIX timestamp
    $timestamp = $my_time + ($num_day * 86400 ); //calculates # of days passed ($num_days) * # seconds in a day (86400)
    $return_date = date("Y-m-d", $timestamp);  //puts the UNIX timestamp back into string format
    return $return_date; //exit function and return string
}

/*
 *  Modificado: 22-Septiembre-2006 Supersolidaria
 *  Ajuste para eliminar el registro correspondiente al radicado excluido del expediente en
 * la tabla SGD_EXP_EXPEDIENTE.
 */
// Si confirma la exlusi� del radicado
if (isset($_GET['excluir']) && $_GET['excluir'] == 1 && $_GET['radExcluido'] != "" && $_GET['expedienteExcluir'] != "") {
    include "$dir_raiz/include/query/expediente/queryExcluirRadicado.php";
    //$db->conn->debug = true;
    $rsExcluirRadicado = $db->conn->query($sqlExcluirRadicado);
}

if (!isset($fechai))
    $fechai = fnc_date_calcm(date('Y-m-d'), '1');
?>

<html>
    <head>
        <meta http-equiv="Cache-Control" content="cache">
        <meta http-equiv="Pragma" content="public">
        <?php
        if (!isset($estado_sal)) {
            $estado_sal = 2;
        }
        if (!isset($estado_sal_max))
            $estado_sal_max = 3;
        if (!isset($Buscar))
            $Buscar = 1;
        if ($tipo_archivo == 0) {
            
        }
        if (!isset($dep_sel))
            $dep_sel = "";
        if ($dep_sel == 0)
            $dep_sel = "%";
        $accion_sal = "Marcar como Archivado Fisicamente";
        $pagina_sig = "envio.php";

        if (isset($buscar_exp))
            $buscar_exp = trim($buscar_exp);
        else
            $buscar_exp = "";

        if (isset($buscar_rad))
            $buscar_rad = trim($buscar_rad);
        else
            $buscar_rad = "";
        if (!isset($fechafi))
            $fechafi = "";
        $fechf = fnc_date_calc($fechafi, 1);

        switch ($db->driver) {
            case 'mssql':
                $dependencia_busq1 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%')";
                $dependencia_busq2 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%') ";

                $dependencia_busq1 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai' ";
                $dependencia_busq2 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai'";
                break;
            case 'mysql':
                $dependencia_busq1 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%')";
                $dependencia_busq2 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%') ";

                $dependencia_busq1 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai' ";
                $dependencia_busq2 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai'";
                break;
            case 'postgres':
                $dependencia_busq1 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(cast(d.RADI_NUME_RADI as varchar)) like '%$buscar_rad%')";
                $dependencia_busq2 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and and radi_depe_actu='$dependenciaSalida' (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(cast(d.RADI_NUME_RADI as varchar)) like '%$buscar_rad%') ";

                $dependencia_busq1 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai' ";
                $dependencia_busq2 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai'";
                break;
            case 'ocipo':
            case 'oci8':
            case 'oracle':
                $dependencia_busq1 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and radi_depe_actu='$dependenciaSalida' and (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%')";

                $dependencia_busq2 = " and d.sgd_exp_estado=$tipo_archivo and d.depe_codi like '$dep_sel' and and radi_depe_actu='$dependenciaSalida' (upper(d.sgd_exp_numero) like '%$buscar_exp%' and upper(d.RADI_NUME_RADI) like '%$buscar_rad%') ";

                $dependencia_busq1 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai' ";
                $dependencia_busq2 .= " and d.sgd_exp_fech <= '$fechf' and d.sgd_exp_fech >= '$fechai'";
                break;
        }

        $fechah = date("dmy") . "_" . time();
        $encabezado = session_name() . "=" . session_id() . "&buscar_exp=$buscar_exp&buscar_rad=$buscar_rad&krd=$krd&tipo_archivo=$tipo_archivo&nomcarpeta=$nomcarpeta&fechai=$fechai&fechafi=$fechafi";
        $tbbordes = "#CEDFC6";
        $tbfondo = "#FFFFCC";
        if (!$orno) {
            $orno = 1;
        }
        $imagen = "flechadesc.gif";
        ?>
        <script>

            function sel_dependencia()
            {
            document.write("<form name=forma_b_correspondencia action='cuerpo_exp.php?<?= $encabezado ?>'  method=post>");
            depsel = form1.dep_sel.value;
            document.write("<input type=hidden name=depsel value=" + depsel + ">");
            document.write("<input type=hidden name=estado_sal  value=3>");
            document.write("<input type=hidden name=estado_sal_max  value=3>");
            document.write("<input type=hidden name=fechah value='<?= $fechah ?>'>");
            document.write("</form>");
            forma_b_correspondencia.submit();
            }

<!--
/*
*  Modificado: 02-Octubre-2006 Supersolidaria
  *  Funci� para confirmar la exclusi� de radicados.
  */
  -->
  function confirmaExcluir( radicado, expediente )
{
                    confirma = confirm('Confirma que el radicado ' + radicado + ' ya fue excluido fisicamente del expediente ' + expediente + '?');
            if (confirma)
            {
            document.form1.action = "cuerpo_exp.php?<?= $encabezado ?>&radExcluido=" + radicado + "&expedienteExcluir=" + expediente + "&excluir=1";
            document.form1.submit();
 }
 }
        </script>
    <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
<body bgcolor="#FFFFFF">
    <div id="spiffycalendar" class="text"></div>
    <link rel="stylesheet" type="text/css" href="../js/spiffyCal/spiffyCal_v2_1.css">
    <script language="JavaScript" src="../js/spiffyCal/spiffyCal_v2_1.js"></script>


    <script>
            setRutaRaiz ('<?= $dir_raiz ?>');

<!-- Esta funcion esconde el combo de las dependencia e inforados Se activan cuando el menu envie una seal de cambio.-->
function window_onload(){
            form1.depsel.style.display = ''; form1.enviara.style.display = '';
            form1.depsel8.style.display = 'none'; form1.carpper.style.display = 'none';
            setVariables();
            setupDescriptions();
    }
    <!-- Cuando existe una sean de cambio el program ejecuta esta funcion mostrando el combo selecc
            
ionado -->
            function changedepesel(){
                    form1.depsel.style.display = 'none';
            form1.carpper.style.display = 'none';
            form1.depsel8.style.display = 'none';
            if (form1.enviara.value == 10)
            {
            form1.depsel.style.display = 'none'; form1.carpper.style.display = '';
            form1.depsel8.style.display = 'none';
}
if(form1.enviara.value==9     )
{
                    form1.depsel.style.display = '';
            form1.carpper.style.display = 'none';
            form1.depsel8.style.display = 'none';
}
if(form1.enviara.value==8 )
{
                    form1.depsel.style.display = 'none';
            form1.depsel8.style.display = '';
            form1.carpper.style.display = 'none';
}
}

<!-- Funcion que activa el sistema de marcar o desmarcar todos los check  -->
    function markAll()
    {
                    if (form1.marcartodos.checked == 1)
                    for (i = 4; i < form1.elements.length; i++)
    form1.elements[i].checked=1;
    else
        for(i=4;i<form1.elements.length;i++)
            form1.elements[i].checked=0;
    }
            <?php

            function tohtml($strValue) {
                return htmlspecialchars($strValue);
            }
            ?>
        </script>
    </head>

<body bgcolor="#FFFFFF" topmargin="0" >
    <div id="object1" style="position:absolute; visibility:show; left:10px; top:-50px; width:80%; z-index:2" >
        <p>Cuadro de Historico</p>
    </div>
    <?php
    /*
      PARA EL FUNCIONAMIENTO CORRECTO DE ESTA PAGINA SE NECESITAN UNAS VARIABLE QUE DEBEN VENIR
      carpeta  "Codigo de la carpeta a abrir"
      nomcarpeta "Nombre de la Carpeta"
      tipocarpeta "Tipo de Carpeta  (0,1)(Generales,Personales)"


      seleccionar todos los checkboxes
     */

    $img1 = "";
    $img2 = "";
    $img3 = "";
    $img4 = "";
    $img5 = "";
    $img6 = "";
    $img7 = "";
    $img8 = "";
    $img9 = "";
    if (!isset($ascdesc))
        $ascdesc = "";
    if (!isset($data))
        $data = "";
    IF (!isset($ordcambio))
        $ordcambio = "";
    {
        IF ($ascdesc == "DESC") {
            $ascdesc = "";
            $imagen = "flechaasc.gif";
        } else {
            $ascdesc = "DESC";
            $imagen = "flechadesc.gif";
        }
    }
    if ($orno == 1) {
        $order = " d.sgd_exp_numero $ascdesc";
        $img1 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 2) {
        $order = " a.radi_nume_radi $ascdesc";
        $img2 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 3) {
        $order = " a.radi_fech_radi $ascdesc";
        $img3 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 4) {
        $order = " a.ra_asun $ascdesc";
        $img4 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 5) {
        $order = " d.sgd_exp_estado $ascdesc,a.radi_nume_radi ";
        $img5 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 6) {
        $order = " f.usua_nomb $ascdesc";
        $img6 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 7) {
        $order2 = " RADI_USUA_ARCH $ascdesc";
        $order = "a.radi_nume_radi ";
        $img5 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 8) {
        $order2 = " SGD_EXP_EDIFICIO $ascdesc";
        $order = "a.radi_nume_radi ";
        $img5 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 9) {
        $order = " f.usua_nomb $ascdesc";
        $img9 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 11) {
        $order = " d.sgd_exp_fech $ascdesc";
        $img11 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($orno == 12) {
        $order = " d.sgd_exp_fech_arch $ascdesc";
        $img12 = "<img src='$dir_raiz/iconos/$imagen' border=0 alt='$data'>";
    }
    if ($tipo_archivo == 0) {
        $img7 = " <img src='$dir_raiz/iconos/flechanoleidos.gif' border=0 alt='$data'> ";
    }

    if ($tipo_archivo == 1) {
        $img7 = " <img src='$dir_raiz/iconos/flechanoleidos.gif' border=0 alt='$data'> ";
    }
    if ($tipo_archivo == 2) {
        $img7 = " <img src='$dir_raiz/iconos/flechanoleidos.gif' border=0 alt='$data'> ";
    }
    if (!isset($tipo_carp))
        $tipo_carp = "";
    if (!isset($sel))
        $sel = "";
    $datosaenviar = "buscar_exp=$buscar_exp&buscar_rad=$buscar_rad&fechaf=$fechaf&tipo_carp=$tipo_carp&ascdesc=$ascdesc&orno=$orno&fechai=$fechai&fechafi=$fechafi";
    $encabezado = session_name() . "=" . session_id() . "&buscar_exp=$buscar_exp&buscar_rad=$buscar_rad&krd=$krd&fechah=$fechah&ascdesc=$ascdesc&dep_sel=$dep_sel&tipo_archivo=$tipo_archivo&nomcarpeta=$nomcarpeta&fechai=$fechai&fechafi=$fechafi&sel=$sel&Buscar=$Buscar&orno=";
    $encabezado2 = session_name() . "=" . session_id() . "&buscar_exp=$buscar_exp&buscar_rad=$buscar_rad&krd=$krd&fechah=$fechah&ascdesc=$ascdesc&dep_sel=$dep_sel&tipo_archivo=$tipo_archivo&nomcarpeta=$nomcarpeta&fechai=$fechai&fechafi=$fechafi&sel=$sel&Buscar=$Buscar&orno=";
    $fechah = date("dmy") . "_" . time();

    $check = 1;
    $fechaf = date("dmy") . "_" . time();
    $numeroa = 0;
    $numero = 0;
    $numeros = 0;
    $numerot = 0;
    $numerop = 0;
    $numeroh = 0;
    ?>
    <br>
    <?php
    /** Instruccion que realiza la consulta de radicados segun criterios
     * Tambien observamos que se encuentra la varialbe $carpetaenviar que maneja la carpeta 11.
     */
    $limit = "";
    $sqlfecha = $db->conn->SQLDate("d-m-Y H:i A", "a.RADI_FECH_RADI");
    $fecha_hoy = Date("Y-m-d");
    $sqlFechaHoy = $db->conn->DBDate($fecha_hoy);
    include "$url_raiz/include/query/expediente/queryCuerpo_exp.php";
    // $db->conn->debug = true;
    $rs = $db->conn->query($isql);

    $nombusuario = $assoc == 0 ? $rs->fields["usua_nomb"] : $rs->fields["USUA_NOMB"];
    $dependencianomb = $assoc == 0 ? $rs->fields["depe_nomb"] : $rs->fields["DEPE_NOMB"];
    $carpeta = 200;
    $nomcarpeta = "Expedientes";
    include "../envios/paEncabeza.php";
    ?>
    <table  width='95%' border="0" class='borde_tab'align="center">
        <tr class="tablas">
        <form name='form1' action='cuerpo_exp.php?<?= session_name() . "=" . session_id() . "&krd=$krd&fechah=$fechah&$encabezado&$orno" ?>' method="post">

            <?PHP //if($tipo_archivo==0 or $tipo_archivo==2){
            ?>
            <td width='20%' align="left" >
                <label for="buscar_exp">Expediente</label>
                <input id="buscar_exp" type=text name=buscar_exp value='<?= $buscar_exp ?>' class="tex_area" title="Campo para buscar por expediente">
            </td>
            <td width='18%'>    
                <label for="buscar_rad"> Radicado</label>
                <input id="buscar_rad" type=text name=buscar_rad value='<?= $buscar_rad ?>' class="tex_area" title="Campo para buscar por radicado">
            </td>
            <td rowspan="2" width='18%'>
                <label for="fechafi">Fecha Inclusion</label><br>
                <label for="fechai">Inicio</label>
                <?php
                if (!$fechai)
                    $fechai = fnc_date_calcm(date('Y-m-d'), '1');
                ?>
                <script language="javascript">

                    var dateAvailable1 = new ctlSpiffyCalendarBox("dateAvailable1", "form1", "fechai", "btnDate1", "<?= $fechai ?>", scBTNMODE_CUSTOMBLUE);
                </script>

                <script language="javascript">
                    dateAvailable1.date = "<?= date('Y-m-d'); ?>";
                    dateAvailable1.writeControl();
                    dateAvailable1.dateFormat = "yyyy-MM-dd";
                </script>
                <br>
                <label for="fechai">Fin&nbsp;&nbsp;</label>

                <script language="javascript">
                    <?php
                    if (!$fechafi)
                        $fechafi = date('Y-m-d');
                    ?>
                    var dateAvailable2 = new ctlSpiffyCalendarBox("dateAvailable2", "form1", "fechafi", "btnDate2", "<?= $fechafi ?>", scBTNMODE_CUSTOMBLUE);
                </script>

                <script language="javascript">
                    dateAvailable2.date = "<?= date('Y-m-d'); ?>";
                    dateAvailable2.writeControl();
                    dateAvailable2.dateFormat = "yyyy-MM-dd";
                </script>
            </td>
            <td width='9%' align="left" rowspan="2">
                <input type=submit value='Buscar' name=Buscar valign='middle' class='botones'>
            </td>
            <td width='30%' align="rigth" rowspan="2">
                <?php
                if ($tipo_archivo == 1) {
                    ?>
                    <br> 
                    &nbsp;
                    <a href='../archivo/busqueda_archivo.php?<?= session_name() . "=" . session_id() . "&dep_sel=$dep_sel&krd=$krd&fechah=$fechah&$orno&adodb_next_page&nomcarpeta&tipo_archivo=$tipo_archivo&carpeta" ?>' style="color: white;"> Busqueda Avanzada</a><br><br>
                <?php } ?>

                <b><label for="dep_sel">Dependencia</label></b>

                <?php
                error_reporting(0);
                $sqlConcat = $db->conn->Concat('depe_codi', "'-'", 'depe_nomb');
                $query = "select $sqlConcat,depe_codi from DEPENDENCIA ORDER BY DEPE_NOMB";
                $rs1 = $db->conn->query($query);
                print $rs1->GetMenu2('dep_sel', $dep_sel, "0:--- TODAS LAS DEPENDENCIAS ---", false, "", "  class='select form-control' style='wi' id='dep_sel'");
                ?>

            </td>
        </form>
    </tr>
</table>
<table><tr><td></td></tr></table>
<table><tr><td></td></tr></table>

<table width='95%' border="1" class='borde_tab'align="center">
    <tr>
        <td  align='left' height="40" class=titulos2 >Listar Por:
            <a href='cuerpo_exp.php?<?= $encabezado . $orno ?>&tipo_archivo=0' aria-label="Ordenar por documentos en espera de ser archivados"><span class='leidos'>
                    <?php
                    if ($tipo_archivo == 0)
                        echo "$img7";
                    ?>
                    Por Archivar</span></a>
            <?php if ($tipo_archivo == 1) echo "$img7"; ?> <a href='cuerpo_exp.php?<?= $encabezado . $orno ?>&tipo_archivo=1' class="no_leidos" aria-label="Ordenar por documentos archivados"><span class='tpar' style="color: #fff;">
            <?php
            if ($tipo_archivo == 1)
                echo "<b>";
            else
                echo "</b>";
            ?>
                    Archivados</span></a><span class='tparr'>
                <!--
                  * Modificado: 21-Septiembre-2006 Supersolidaria
                  * Ajuste para ver los radicados excluidos de un expediente.
                -->
                <a href='cuerpo_exp.php?<?= $encabezado . $orno ?>&tipo_archivo=2' aria-label="Ordenar por documentos en espera de ser excluídos"><span class='porExcluir'>
                        <?php
                        if ($tipo_archivo == 2)
                            echo "$img7";
                        ?>
                        Por Excluir</span></a>
                <br>
                </td>
                </tr>
                </table>


                </td>
                </tr>
                <tr>
                    <td class="grisCCCCCC">
                        <table cellspacing="3"  WIDTH=95% border=1"" class='borde_tab' align='center' >
                            <tr  class="titulos5">
                                <td  align="center" class="titulos3" >
                                    <a href='cuerpo_exp.php?<?= $encabezado2 ?>1&ordcambio=1' alt='Seleccione una busqueda'>                    </a><a href='cuerpo_exp.php?<?= $encabezado ?>2&ordcambio=1' class='textoOpcion' alt='Seleccione una busqueda'>
                                        <?= $img2 ?>
                                        Radicado Entrada</a><a href='cuerpo_exp.php?<?= $encabezado2 ?>1&ordcambio=1' alt='Seleccione una busqueda'>
                                    </a></td>
                                <td  width='18%' align="center" class="titulos3"><a href='cuerpo_exp.php?<?= $encabezado2 ?>3&ordcambio=1'  alt='Seleccione una busqueda'>
                                    <?= $img3 ?> Fecha Radicado</a></td>
                                <td width='10%' align="center" class="titulos3"> <a href='cuerpo_exp.php?<?= $encabezado2 ?>2&ordcambio=1'  alt='Seleccione una busqueda'>
                                    </a><a href='cuerpo_exp.php?<?= $encabezado2 ?>1&ordcambio=1' class='textoOpcion' alt='Seleccione una busqueda'>
                                        <?= $img1 ?>
                                        Expediente</a> </td>
                                <td width='10%' align="center" class="titulos3"> <a href='cuerpo_exp.php?<?= $encabezado2 ?>2&ordcambio=1' alt='Seleccione una busqueda'>
                                    </a><a href='cuerpo_exp.php?<?= $encabezado2 ?>11&ordcambio=1' alt='Seleccione una busqueda'>
                                        <?= $img11 ?>
                                        Fecha Incluci&oacute;n </a> </td>
                                <td  width='20%' align="center" class="titulos3"> <a href='cuerpo_exp.php?<?= $encabezado2 ?>4&ordcambio=1'alt='Seleccione una busqueda'>
                                <?= $img4 ?> Tipo Documental </a></td>
                                <?php
                                if ($tipo_archivo == 0) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">  <a href='cuerpo_exp.php?<?= $encabezado2 ?>5&ordcambio=1' alt='Seleccione una busqueda'>
                                    <?= $img5 ?>
                                            Archivado ? </a></td>
                                    <?php
                                }
                                if ($tipo_archivo == 1) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">  <a href='cuerpo_exp.php?<?= $encabezado2 ?>7&ordcambio=1'  alt='Seleccione una busqueda'>
                                    <?= $img5 ?>
                                            Archivado Por: </a></td>
                                    <?php
                                }
                                if ($tipo_archivo == 2) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">  <a href='cuerpo_exp.php?<?= $encabezado2 ?>8&ordcambio=1'   alt='Seleccione una busqueda'>
                                    <?= $img5 ?>
                                            Ubicacion :</a></td>
                                    <?php
                                }
                                if ($tipo_archivo == 0) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">  <a href='cuerpo_exp.php?<?= $encabezado2 ?>8&ordcambio=1'   alt='Seleccione una busqueda'>
                                        <?= $img12 ?>
                                        Ubicacion </a></td>

                                    <?php
                                }
                                if ($tipo_archivo == 1 or $tipo_archivo == 2) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">  <a href='cuerpo_exp.php?<?= $encabezado2 ?>12&ordcambio=1'   alt='Seleccione una busqueda'>
                                    <?= $img12 ?>
                                            Fecha de Archivo </a></td>
                                    <?php } ?>
                                <!--
                                /*
                                 *  Modificado: 22-Septiembre-2006 Supersolidaria
                                 *  Ajuste para incluir un bot� que permite confirmar la exclusi� de un radicado.
                                 */
                                -->
                                <?php
                                if ($tipo_archivo == 2) {
                                    ?>
                                    <td  width='15%' align="center" class="titulos3">
                                        EXCLUIR
                                    </td>
                                    <?php
                                }
                                ?>
                            </tr>
                            <?php
                            if ($Buscar == 'Buscar') {

//                                $rs->debug = true;
                                $row = array();
                                $i = 1;
                                $ki = 0;
                                // Comienza el ciclo para mostrar los documentos de la carpeta predeterminada.
                                $registro = $pagina * 15;
//                                echo '<pre>';
//                                print_r($rs->fields);
//                                echo '</pre>';
                                while (!$rs->EOF) {
                                    if ($ki >= $registro and $ki < ($registro + 15)) {
                                        $data = trim($rs->fields["RADI_NUME_RADI"]);
                                        $numdata = trim($rs->fields["CARP_CODI"]);
                                        $plg_codi = $rs->fields["plg_codi"];
                                        $plt_codi = $rs->fields["plt_codi"];
                                        $num_expediente = $assoc == 0 ? $rs->fields["sgd_exp_numero"] : $rs->fields["SGD_EXP_NUMERO"];
                                        $imagen_rad = $rs->fields["radi_path"];
                                        $usuario_actual = $rs->fields["usua_nomb"];
                                        $dependencia_actual = $rs->fields["depe_nomb"];
                                        $estado = $assoc == 0 ? $rs->fields["sgd_exp_estado"] : $rs->fields["SGD_EXP_ESTADO"];
                                        $fecha_archivo = $assoc == 0 ? $rs->fields["sgd_exp_fech_arch"] : $rs->fields["SGD_EXP_FECH_ARCH"];
                                        $fecha_clasificacion = $assoc == 0 ? $rs->fields["sgd_exp_fech"] : $rs->fields["SGD_EXP_FECH"];
                                        include "$dir_raiz/include/query/expediente/queryCuerpo_exp.php";
                                        $rse = $db->query($sqle);
//                                        echo '***************** '.$sqle;
                                        $estan = $rse->fields["sgd_exp_estante"];
                                        $entre = $rse->fields["sgd_exp_entrepa"];
                                        $caja = $rse->fields["sgd_exp_caja"];
                                        $piso = $rse->fields["sgd_exp_isla"];
                                        $edifi = $rse->fields["sgd_exp_edificio"];
                                        $zona = $rse->fields["sgd_exp_ufisica"];
                                        $carro = $rse->fields["sgd_exp_carro"];
                                        $usua_arch = $rse->fields["radi_usua_arch"];
                                        include "$dir_raiz/include/query/expediente/queryCuerpo_exp.php";
                                        $rs1 = $db->conn->Execute($tm);
                                        $ed = $rs1->fields['sgd_eit_sigla'];
                                        $rs7 = $db->conn->Execute($tm6);
                                        $pi = $rs7->fields['sgd_eit_sigla'];


                                        if ($edifi == "" and $estan == "" and $entre == "" and $caja == "" and $carro == "" and $zona == "")
                                            $ubicacion = "";
                                        else {
                                            $ubicacion = $ed . "-" . $pi;
                                            //$db->conn->debug=true;
                                            $rs5 = $db->conn->Execute($tm4);
                                            if ($zona != "") {
                                                $zo = $rs5->fields['sgd_eit_sigla'];
                                                $ubicacion .= "-" . $zo;
                                            }
                                            $rs4 = $db->conn->Execute($tm3);
                                            if ($carro != "") {
                                                $ca = $rs4->fields['sgd_eit_sigla'];
                                                $ubicacion .= "-" . $ca;
                                            }
                                            $rs2 = $db->conn->Execute($tm1);
                                            if ($estan != "") {
                                                $es = $rs2->fields['sgd_eit_sigla'];
                                                $ubicacion .= "-" . $es;
                                            }
                                            $rs3 = $db->conn->Execute($tm2);
                                            if ($entre != "") {
                                                $et = $rs3->fields['sgd_eit_sigla'];
                                                $ubicacion .= "-" . $et;
                                            }
                                            $rs6 = $db->conn->Execute($tm5);
                                            if ($caja != "") {
                                                $cj = $rs6->fields['sgd_eit_sigla'];
                                                $ubicacion .= "-" . $cj;
                                            }
                                        }
                                        include "$dir_raiz/include/query/expediente/queryCuerpo_exp.php";
//                                        $db->conn->debug=true;
                                        $rsd = $db->query($sqlr);
//                                        echo '****************** '.$rsd->fields['sgd_tpr_descrip'].' ******* '.$rsd->fields['SGD_TPR_DESCRIP'].' ***** '.$rsd->fields[11];
                                        $tipoDoc = $assoc == 0 ? $rsd->fields['sgd_tpr_descrip'] : $rsd->fields['SGD_TPR_DESCRIP'];
                                        /*
                                         *  Modificado: 22-Septiembre-2006 Supersolidaria
                                         *  Ajuste para determinar si un radicado hab� sido archivado antes de ser excluido de
                                         *  un expediente.
                                         */
                                        if ($estado == 0) {
                                            $estado_nomb = "No";
                                        } else if ($estado == 2 && $fecha_archivo != "") {
                                            $estado_nomb = "Si";
                                        } else if ($estado == 2 && $fecha_archivo == "") {
                                            $estado_nomb = "No";
                                        } else {
                                            $estado_nomb = "Si";
                                        }

                                        if ($plt_codi == 2) {
                                            $img_estado = "<img src='../$imagenes/docRadicado.gif'  border=0>";
                                        }
                                        if ($plt_codi == 3) {
                                            $img_estado = "<img src='../$imagenes/docImpreso.gif'  border=0>";
                                        }
                                        if ($plt_codi == 4) {
                                            $img_estado = "<img src='../$imagenes/docEnviado.gif ' border=0>";
                                        }

                                        // By Skinatech - 14/08/2018
                                        // Para la construcción del número de radicado, esto indica la parte inicial del radicado.
                                        if ($estructuraRad == 'ymd') {
                                            $num = 8;
                                        } elseif ($estructuraRad == 'ym') {
                                            $num = 6;
                                        } else {
                                            $num = 4;
                                        }

                                        if ($rs->fields["SGD_TPR_CODIGO"] == 9999) {
                                            if ($plt_codi == 2) {
                                                $img_estado = "<img src=../$imagenes/docRecibido.gif  border=0>";
                                            }
                                            if ($plt_codi == 2) {
                                                $img_estado = "<img src=../$imagenes/docRadicado.gif  border=0>";
                                            }
                                            if ($plt_codi == 3) {
                                                $img_estado = "<img src=../$imagenes/docImpreso.gif  border=0>";
                                            }
                                            if ($plt_codi == 4) {
                                                $img_estado = "<img src=../$imagenes/docEnviado.gif  border=0>";
                                            }

                                            $dep_radicado = substr($rs->fields["RADI_NUME_RADI"], $num, $longitud_codigo_dependencia);
                                            $ano_radicado = substr($rs->fields["RADI_NUME_RADI"], 0, 4);

                                            $ref_pdf = "bodega/$ano_radicado/$dep_radicado/docs/$ref_pdf";
                                            $tipo_sal = "Archivo";
                                            $ref_pdf_salida = "<a href='../bodega/$ano_radicado/$dep_radicado/docs/$ref_pdf' alt='Radicado de Salida $rad_salida'>$img_estado</a>";
                                        } else {
                                            $tipo_sal = "Plantilla";
                                            $ref_pdf_salida = "<a href='../$ref_pdf' alt='Radicado de Salida $rad_salida'>$img_estado</a>";
                                        }

                                        //$ref_pdf_salida = "<a href='imprimir_pdf_frame?".session_name()."=".session_id() . "&ref_pdf=$ref_pdf&numrad=$numrad'>$img_estado </a>";
                                        if ($data == "")
                                            $data = "NULL";
                                        error_reporting(0);
                                        $numerot = $row1["num"];
                                        if ($estado == 0) {
                                            $leido = "";
                                        } else {
                                            $leido = "";
                                        }
                                        if ($i == 1) {
                                            $leido = "listado1";
                                            $i = 2;
                                        } else {
                                            $leido = "listado2";
                                            $i = 1;
                                        }
                                        /*
                                         *  Modificado: 22-Septiembre-2006 Supersolidaria
                                         *  Ajuste para identifiar con otro color los radicados excluidos de un expediene.
                                         */
                                        // Por Archivar
                                        if ($estado == 0) {
                                            $class = "leidos";
                                        } else if ($estado == 1) {
                                            $class = "no_leidos";
                                        }
                                        // Por Excluir
                                        else if ($estado == 2) {
                                            $class = "porExcluir";
                                        }
                                        if ($estado == 2 and $estado_nomb == "Si") {
                                            if ($rs->fields["RADI_PATH"] != " " && $rs->fields["RADI_PATH"] != null) {
                                                $urlimagen = "<a href='../bodega/" . $rs->fields["RADI_PATH"] . "?fechah=$fechah'><span class='" . $class . "'>$data</span></a>";
                                            } else {
                                                $urlimagen = "<span class='" . $class . "'>$data</span>";
                                            }
                                            ?>
                                            <tr class='<?= $leido ?>'>
                                                <?php
                                                $radi_tipo_deri = $rs->fields["RADI_TIPO_DERI"];
                                                $radi_nume_deri = $rs->fields["RADI_NUME_DERI"];
                                                ?>
                                                <td class='<?= $leido ?>' align="right" width="12%"><span class='<?php print $class; ?>'><?= $urlimagen ?></span>
                                                    <?php
                                                    //		$isql3 ="select to_char(HIST_FECH,'DD/MM/YY HH12:MI:SSam')as HIST_FECH,HIST_FECH AS HIST_FECH1,HIST_OBSE from hist_eventos where radi_nume_radi='$data' order by HIST_FECH1 desc ";
                                                    $radi_nomb = $rs->fields["NOMBRES"];
                                                    ?>

                                                </td>
                                                <td class='<?= $leido ?>' width="10%"  align="center"><? $dir_raiz = ".."; ?>
                                                    <span class='<?php print $class; ?>'>
                                                        <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' >
                                                            <span class='<?php print $class; ?>'>
                <?= $rs->fields["FECHA"] ?></span>
                                                        </a></span> </td>
                                                <td class='<?= $leido ?>' width="18%">
                                                    <span class='<?php print $class; ?>'>
                                                        <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' > </a></span>
                                                    <span class='<?php print $class; ?>'>
                <?= $num_expediente ?></span> </td>
                                                <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $fecha_clasificacion ?></span></td>
                                                <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $tipoDoc ?> </span>
                                                </td>
                                                <td class='<?= $leido ?>' width="20%">
                                                    <span class='<?php print $class; ?>'><?= $ubicacion ?> </span>
                                                </td>
                                                <td  class='<?= $leido ?>' width="15%" align="center">
                                                    <a href='../archivo/datos_expediente.php?<?= $encabezado . "&num_expediente=$num_expediente&ent=1&nurad=$data" ?>' class='vinculos'>
                                                        <span class='<?php print $class; ?>'><?= $usua_arch ?></span>
                                                    </a>
                                                </td>
                                    <td class='<?= $leido ?>' width="20%">
                                        <span class='<?php print $class; ?>'>
                                            <div align="center">
                                                <!--
                                                  <a href="cuerpo_exp.php?radExcluido=<?php print $data; ?>&expedienteExcluir=<?php print $num_expediente; ?>&excluir=1">
                                                -->
                                                <a href="javascript:confirmaExcluir( '<?php print $data; ?>', '<?php print $num_expediente; ?>' );">
                                                    <img src="<?php print $dir_raiz; ?>/iconos/rad_excluido.png" border="0" height="14" width="25">
                                                </a>
                                            </div>
                                        </span>
                                    </td>
                                    <?php
                                    if ($check <= 15) {
                                        $check = $check + 1;
                                    }
                                } elseif ($estado == 1) {
                                    if ($rs->fields["RADI_PATH"] != " " && $rs->fields["RADI_PATH"] != null) {
                                        $urlimagen = "<a href='../bodega/" . $rs->fields["RADI_PATH"] . "?fechah=$fechah'><span class='" . $class . "'>$data</span></a>";
                                    } else {
                                        $urlimagen = "<span class='" . $class . "'>$data</span>";
                                    }
                                    ?>
                                <tr class='<?= $leido ?>'>
                                    <?php
                                    $radi_tipo_deri = $rs->fields["RADI_TIPO_DERI"];
                                    $radi_nume_deri = $rs->fields["RADI_NUME_DERI"];
                                    ?>
                                    <td class='<?= $leido ?>' align="right" width="12%"><span class='<?php print $class; ?>'><?= $urlimagen ?></span>
                                        <?php
                                        //		$isql3 ="select to_char(HIST_FECH,'DD/MM/YY HH12:MI:SSam')as HIST_FECH,HIST_FECH AS HIST_FECH1,HIST_OBSE from hist_eventos where radi_nume_radi='$data' order by HIST_FECH1 desc ";
                                        $radi_nomb = $rs->fields["NOMBRES"];
                                        ?>

                                    </td>
                                    <td class='<?= $leido ?>' width="10%"  align="center"><? $dir_raiz = ".."; ?>
                                        <span class='<?php print $class; ?>'>
                                            <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' >
                                                <span class='<?php print $class; ?>'>
                <?= $rs->fields["FECHA"] ?></span>
                                            </a></span> </td>
                                    <td class='<?= $leido ?>' width="18%">
                                        <span class='<?php print $class; ?>'>
                                            <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' > </a></span>
                                        <span class='<?php print $class; ?>'>
                <?= $num_expediente ?></span> </td>
                                    <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $fecha_clasificacion ?></span></td>
                                    <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $tipoDoc ?> </span>
                                    </td>
                                    <td class='<?= $leido ?>' width="20%">
                                        <span class='<?php print $class; ?>'>
                                            <?= $usua_arch ?> </span>
                                    </td>
                                    <td  class='<?= $leido ?>' width="15%" align="center">
 <center>
                                    <a href='../archivo/datos_expediente.php?<?= $encabezado . "&num_expediente=$num_expediente&ent=1&nurad=$data&car=$car" ?>' class='vinculos'>
                                        <span class='<?php print $class; ?>'><?= $fecha_archivo ?></span>
                                    </a>
                                </center>

                        </td>
                        <?php
                        if ($check <= 15) {
                            $check = $check + 1;
                        }
                    } elseif ($estado == 0) {
                        if ($rs->fields["RADI_PATH"] != " " && $rs->fields["RADI_PATH"] != null) {
                            $urlimagen = "<a href='../bodega/" . $rs->fields["RADI_PATH"] . "?fechah=$fechah'><span class='" . $class . "'>$data</span></a>";
                        } else {
                            $urlimagen = "<span class='" . $class . "'>$data</span>";
                        }
                        ?>
                    <tr class='<?= $leido ?>'>
                        <?php
                        $radi_tipo_deri = $rs->fields["RADI_TIPO_DERI"];
                        $radi_nume_deri = $rs->fields["RADI_NUME_DERI"];
                        ?>
                        <td class='<?= $leido ?>' align="right" width="12%"><span class='<?php print $class; ?>'><?= $urlimagen ?></span>
                            <?
                            //		$isql3 ="select to_char(HIST_FECH,'DD/MM/YY HH12:MI:SSam')as HIST_FECH,HIST_FECH AS HIST_FECH1,HIST_OBSE from hist_eventos where radi_nume_radi='$data' order by HIST_FECH1 desc ";
                            $radi_nomb = $rs->fields["NOMBRES"];
                            ?>

                        </td>
                        <td class='<?= $leido ?>' width="10%"  align="center"><? $dir_raiz = ".."; ?>
                            <span class='<?php print $class; ?>'>
                                <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' >
                                    <span class='<?php print $class; ?>'>
                <?= $rs->fields["FECHA"] ?></span>
                                </a></span> </td>
                        <td class='<?= $leido ?>' width="18%">
                            <span class='<?php print $class; ?>'>
                                <a href='../verradicado.php?<?= $encabezado . "&num_expediente=$num_expediente&verrad=$data&carpeta_per=0&carpeta=8&nombcarpeta=Expedientes" ?>' > </a></span>
                            <span class='<?php print $class; ?>'>
                <?= $num_expediente ?></span> </td>
                        <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $fecha_clasificacion ?></span></td>
                        <td class='<?= $leido ?>' width="20%"> <span class='<?php print $class; ?>'><?= $tipoDoc ?> </span>
                        </td>
                        <td  class='<?= $leido ?>' width="15%" align="center">

                    <center>
                        <a href='../archivo/datos_expediente.php?<?= $encabezado . "&num_expediente=$num_expediente&ent=1&nurad=$data" ?>' class='vinculos'>
                            <span class='<?php print $class; ?>'><?= $estado_nomb ?></span>
                        </a>
                    </center>

                </td>
                <td class='<?= $leido ?>' width="20%">
                    <span class='<?php print $class; ?>'>
                <?= $ubicacion ?> </span>
                </td>

                <?php
                if ($check <= 15) {
                    $check = $check + 1;
                }
            }
            ?> </tr>
            <?php
        }
        $ki = $ki + 1;
        $rs->MoveNext();
    }
    ?>
    </table>
    </TD>
    </tr>
    </TABLE>
    </form>
    <table border=0 cellspace=2 cellpad=2 WIDTH=100% class='borde_tab' align='center'>
        <tr align="center">
            <td> <?php
                // Se calcula el numero de | a mostrar
                $rs = $db->query($isqlCount);
                $numerot = $rs->fields["CONTADOR"];
                $paginas = ($numerot / 15);
                ?><span class='vinculos'>Paginas </span> <?php
                if (intval($paginas) <= $paginas) {
                    $paginas = $paginas;
                } else {
                    $paginas = $paginas - 1;
                }
                // Se imprime el numero de Paginas.
                for ($ii = 0; $ii < $paginas; $ii++) {
                    if ($pagina == $ii) {
                        $letrapg = "<font color=green size=3>";
                    } else {
                        $letrapg = "";
                    }
                    echo " <a href='cuerpo_exp.php?pagina=$ii&$encabezado2$orno'><span class=leidos>$letrapg" . ($ii + 1) . "</span></font></a>\n";
                }
                echo "<input type=hidden name=check value=$check>";
            }
            ?> </td>
    </tr></table>
<form name=jh >
    <input type=hidDEN name=jj value=0>
    <input type=hidDEN name=dS value=0>
</form>
</body>
</html>
