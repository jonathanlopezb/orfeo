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
$url_raiz = "../..";
$dir_raiz = $_SESSION['dir_raiz'];
$ESTILOS_PATH2 = $_SESSION['ESTILOS_PATH2'];
$assoc = $_SESSION['assoc'];
/* ---------------------------------------------------------+
  |                       MAIN                               |
  +--------------------------------------------------------- */


/**
 * Se añadio compatibilidad con variables globales en Off
 * @autor Jairo Losada 2009-05
 * @licencia GNU/GPL V 3
 */
/*
 * Se incluye archivo config.php con ruta dinámica para evitar 
 * errores si se incluye este archivo en otro
 */
include dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . 'config.php';   // incluir configuracion.
/*
 * Se incluye archivo ConnectionHandler.php con ruta dinámica para evitar 
 * errores si se incluye este archivo en otro
 */
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "include/db/ConnectionHandler.php";
//Creo nueva instancia de conexión a Base de datos.
$db = new ConnectionHandler("$dir_raiz");
include($ADODB_PATH . '/adodb.inc.php');
$ADODB_FETCH_MODE = ADODB_FETCH_NUM;
$ADODB_COUNTRECS = true;
$error = 0;
//$dsn = $driver."://".$usuario."/".$contrasena."@".$servidor."/".$db;
//$db = NewADOConnection($dsn);
//$db->conn->debug = true;

foreach ($_GET as $key => $valor)
    ${$key} = $valor;
foreach ($_POST as $key => $valor)
    ${$key} = $valor;

function valueToJsValue($value, $encoding = false) {
    if (!is_numeric($value)) {
        $value = str_replace('\\', '\\\\', $value);
        $value = str_replace('"', '\"', $value);
        $value = '"' . $value . '"';
    }
    if ($encoding) {
        switch ($encoding) {
            case 'utf8' : return iconv("ISO-8859-2", "UTF-8", $value);
                break;
        }
    } else {
        return $value;
    }
}

function arrayToJsArray($array, $name, $nl = "\n", $encoding = false) {
    if (is_array($array)) {
        $jsArray = $name . ' = new Array();' . $nl;
        foreach ($array as $key => $value) {
            switch (gettype($value)) {
                case 'unknown type':
                case 'resource':
                case 'object': break;
                case 'array': $jsArray .= arrayToJsArray($value, $name . '[' . valueToJsValue($key, $encoding) . ']', $nl);
                    break;
                case 'NULL': $jsArray .= $name . '[' . valueToJsValue($key, $encoding) . '] = null;' . $nl;
                    break;
                case 'boolean': $jsArray .= $name . '[' . valueToJsValue($key, $encoding) . '] = ' . ($value ? 'true' : 'false') . ';' . $nl;
                    break;
                case 'string': $jsArray .= $name . '[' . valueToJsValue($key, $encoding) . '] = ' . valueToJsValue($value, $encoding) . ';' . $nl;
                    break;
                case 'double':
                case 'integer': $jsArray .= $name . '[' . valueToJsValue($key, $encoding) . '] = ' . $value . ';' . $nl;
                    break;
                default: trigger_error('Hoppa, egy Ãºj tÃ­pus a PHP-ben?' . __CLASS__ . '::' . __FUNCTION__ . '()!', E_USER_WARNING);
            }
        }
        return $jsArray;
    } else {
        return false;
    }
}

if ($db) {
    $db->conn->SetFetchMode(ADODB_FETCH_ASSOC);

    if (isset($_POST['btn_accion'])) {
        $record = array();
        $record['SGD_FENV_CODIGO'] = $_POST['id_fenv'];  //forma de envio.
        $record['SGD_TAR_CODIGO'] = $_POST['txt_idTar']; //cdigo de la tarifa.
        $record['SGD_CLTA_CODSER'] = $_POST['slc_TipoTar']; //tipo de tarifa.
        $record['SGD_CLTA_DESCRIP'] = $_POST['txt_desc']; //descripcion de tarifa
        $record['SGD_CLTA_PESDES'] = $_POST['txt_lim1']; //limite inferior peso
        $record['SGD_CLTA_PESHAST'] = $_POST['txt_lim2']; //limite superior peso
        switch ($_POST['btn_accion']) {
            Case 'Agregar':
            Case 'Modificar': {
                    $db->conn->BeginTrans();
                    $ok = $db->conn->Replace('SGD_CLTA_CLSTARIF', $record, array('SGD_FENV_CODIGO', 'SGD_TAR_CODIGO', 'SGD_CLTA_CODSER'), $autoquote = true);
                    if ($ok) {
                        $record = array_slice($record, 0, 3, true);
                        if ($_POST['slc_TipoTar'] == 1) {
                            $record['SGD_TAR_VALENV1'] = $_POST['txt_v1'];  //valor envio (local/grupo1)
                            $record['SGD_TAR_VALENV2'] = $_POST['txt_v2'];  //valor envio (nacional/grupo2)
                            $record['SGD_TAR_VALENV1G1'] = 0;    //valor envio (grupo1)
                            $record['SGD_TAR_VALENV2G2'] = 0;    //valor envio (grupo2)
                        } else {
                            $record['SGD_TAR_VALENV1'] = 0;     //valor envio (local/grupo1)
                            $record['SGD_TAR_VALENV2'] = 0;     //valor envio (nacional/grupo2)
                            $record['SGD_TAR_VALENV1G1'] = $_POST['txt_v1']; //valor envio (grupo1)
                            $record['SGD_TAR_VALENV2G2'] = $_POST['txt_v2']; //valor envio (grupo2)
                        }
                        $ok = $db->conn->Replace('SGD_TAR_TARIFAS', $record, array('SGD_FENV_CODIGO', 'SGD_TAR_CODIGO', 'SGD_CLTA_CODSER'), $autoquote = true);
                    }
                    if ($ok) {
                        $db->conn->CommitTrans();
                        $error = $ok;
                    } else {
                        $db->conn->RollbackTrans();
                        $error = 3;
                    }
                }break;
            Case 'Eliminar': {
                    $record = array_slice($record, 0, 3);
                    $db->conn->BeginTrans();
                    //$db->conn->debug=true;
                    $ADODB_COUNTRECS = true;
                    $query = "SELECT sgd_renv_codigo from sgd_renv_regenvio where sgd_fenv_codigo = (";
                    $query .= 'SELECT SGD_FENV_CODIGO FROM SGD_CLTA_CLSTARIF WHERE SGD_FENV_CODIGO=' . $record['SGD_FENV_CODIGO'] . ' AND SGD_TAR_CODIGO=' . $record['SGD_TAR_CODIGO'] . ' AND SGD_CLTA_CODSER=' . $record['SGD_CLTA_CODSER'] . ')';
                    $rs = $db->conn->Execute($query);
                    //	echo $query;
                    $ADODB_COUNTRECS = false;
                    if ($rs->RecordCount() == 0) {
                        $ok1 = $db->conn->Execute('DELETE FROM SGD_TAR_TARIFAS WHERE SGD_FENV_CODIGO=' . $record['SGD_FENV_CODIGO'] . ' AND SGD_TAR_CODIGO=' . $record['SGD_TAR_CODIGO'] . ' AND SGD_CLTA_CODSER=' . $record['SGD_CLTA_CODSER']);
                        $ok2 = $db->conn->Execute('DELETE FROM SGD_CLTA_CLSTARIF WHERE SGD_FENV_CODIGO=' . $record['SGD_FENV_CODIGO'] . ' AND SGD_TAR_CODIGO=' . $record['SGD_TAR_CODIGO'] . ' AND SGD_CLTA_CODSER=' . $record['SGD_CLTA_CODSER']);
                        if ($ok1 && $ok2) {
                            $db->conn->CommitTrans();
                            $error = 4;
                        } else {
                            $db->conn->RollbackTrans();
                            $error = 3;
                        }
                    } else {
                        $db->conn->RollbackTrans();
                        $error = 5;
                    }
                }break;
            Default: break;
        }
        unset($record);
    }

    $sql_fenv = "SELECT SGD_FENV_DESCRIP, SGD_FENV_CODIGO FROM SGD_FENV_FRMENVIO ORDER BY SGD_FENV_DESCRIP";
    $Rs_fenv = $db->conn->CacheExecute(1, $sql_fenv);  //Query en cache por 24 horas.
    //$Rs_fenv = $db->conn->CacheExecute(1,$sql_fenv); 	//Query en cache por 24 horas.

    if (!($Rs_fenv)) {
        $error = 3;
        $nomTabla = "Formas de Envio";
    }


    if (isset($_POST['id_fenv']) and isset($_POST['slc_TipoTar'])) {
        if ($_POST['slc_TipoTar'] == '1') {
            $sql_val = " SGD_TAR_TARIFAS.SGD_TAR_VALENV1 AS VAL1, SGD_TAR_TARIFAS.SGD_TAR_VALENV2 AS VAL2 ";
        } else {
            $sql_val = " SGD_TAR_TARIFAS.SGD_TAR_VALENV1G1 AS VAL1, SGD_TAR_TARIFAS.SGD_TAR_VALENV2G2 AS VAL2 ";
        }

        $sql_clta = "SELECT SGD_CLTA_CLSTARIF.SGD_CLTA_DESCRIP AS DESCCONSTAR, SGD_CLTA_CLSTARIF.SGD_TAR_CODIGO AS IDCONSTAR, " .
                "SGD_CLTA_CLSTARIF.SGD_CLTA_PESDES AS LIMPESOINF, SGD_CLTA_CLSTARIF.SGD_CLTA_PESHAST AS LIMPESOSUP, " .
                $sql_val . "FROM  SGD_CLTA_CLSTARIF, SGD_TAR_TARIFAS " .
                "WHERE SGD_CLTA_CLSTARIF.SGD_FENV_CODIGO = SGD_TAR_TARIFAS.SGD_FENV_CODIGO AND " .
                "SGD_CLTA_CLSTARIF.SGD_TAR_CODIGO = SGD_TAR_TARIFAS.SGD_TAR_CODIGO AND " .
                "SGD_CLTA_CLSTARIF.SGD_CLTA_CODSER = SGD_TAR_TARIFAS.SGD_CLTA_CODSER AND " .
                "SGD_CLTA_CLSTARIF.SGD_FENV_CODIGO = " . $_POST['id_fenv'] . " AND SGD_CLTA_CLSTARIF.SGD_CLTA_CODSER = " . $_POST['slc_TipoTar'] .
                " ORDER BY SGD_CLTA_CLSTARIF.SGD_CLTA_DESCRIP, SGD_CLTA_CLSTARIF.SGD_FENV_CODIGO";
        $Rs_clta = $db->conn->Execute($sql_clta);
        //modificado skina
        //$db->conn->debug=true;
        if ($Rs_clta) {
            $it = 1;
            $vcltav = array();
            while (!$Rs_clta->EOF) {
                $vcltav[$it]['IdConsTar'] = $assoc == 0 ? $Rs_clta->fields['idconstar'] : $Rs_clta->fields['IDCONSTAR'];
                $vcltav[$it]['DescConsTar'] = $assoc == 0 ? $Rs_clta->fields['descconstar']: $Rs_clta->fields['DESCCONSTAR'];
                $vcltav[$it]['LimPesoInf'] = $assoc == 0 ? $Rs_clta->fields['limpesoinf']: $Rs_clta->fields['LIMPESOINF'];
                $vcltav[$it]['LimPesoSup'] = $assoc == 0 ? $Rs_clta->fields['limpesosup']: $Rs_clta->fields['LIMPESOSUP'];
                $vcltav[$it]['Val1'] = $assoc == 0 ? $Rs_clta->fields['val1']: $Rs_clta->fields['VAL1'];
                $vcltav[$it]['Val2'] = $assoc == 0 ? $Rs_clta->fields['val2']: $Rs_clta->fields['VAL2'];
                $it += 1;
                $Rs_clta->MoveNext();
            }
            //$Rs_clta->Move(0);
            $Rs_clta = $db->conn->Execute($sql_clta);
        } else {
            $error = 3;
            $nomTabla = "Clasificacin de tarifas";
        }
    }
} else {
    $error = 3;
}

if ($error) {
    $msg_error = "<tr bordercolor='#FFFFFF'><td width='3%' align='center' class='titulosError' colspan='5' bgcolor='#FFFFFF'>";
    // Implementado por si desean mostrar errores o mensajes personalizados.
    switch ($error) {
        case 1: $msg_error .= "Informaci&oacute;n actualizada!!";
            break;    //ACUTALIZACION REALIZADA
        case 2: $msg_error .= "Tarifa creada satisfactoriamente!!";
            break;   //INSERCION REALIZADA
        case 3: $msg_error .= "Error al gestionar datos, comun&iacute;quese con el Administrador de sistema !!";
            break; //ERROR EJECUCCI�N SQL
        case 4: $msg_error .= "<blink>Tarifa eliminada exitosamente</blink>";
            break; // EXITO EN LA ELIMINACIN
        case 5: $msg_error .= "Error. No se puede eliminar registro. Existe hist&oacute;rico.";
            break; // ERROR EN LA ELIMINACIN
    }
    $msg_error .= "</td></tr>";
}
?>
<html>
    <script language="JavaScript">

        function Actualiza()
        {
            var Obj = document.getElementById('id_clta');
            var i = Obj.selectedIndex;
            if (i > 0)
            {
                document.getElementById('txt_idTar').value = vp[i]['IdConsTar'];
                document.getElementById('txt_desc').value = vp[i]['DescConsTar'];
                document.getElementById('txt_lim1').value = vp[i]['LimPesoInf'];
                document.getElementById('txt_lim2').value = vp[i]['LimPesoSup'];
                document.getElementById('txt_v1').value = vp[i]['Val1'];
                document.getElementById('txt_v2').value = vp[i]['Val2'];
            } else
            {
                document.getElementById('txt_idTar').value = '';
                document.getElementById('txt_desc').value = '';
                document.getElementById('txt_lim1').value = '';
                document.getElementById('txt_lim2').value = '';
                document.getElementById('txt_v1').value = '';
                document.getElementById('txt_v2').value = '';
            }
        }

        function rightTrim(sString)
        {
            while (sString.substring(sString.length - 1, sString.length) == ' ')
            {
                sString = sString.substring(0, sString.length - 1);
            }
            return sString;
        }

        function addOpt(oCntrl, iPos, sTxt, sVal)
        {
            var selOpcion = new Option(sTxt, sVal);
            eval(oCntrl.options[iPos] = selOpcion);
        }

        function cambia(oCntrl)
        {
            while (oCntrl.length)
            {
                oCntrl.remove(0);
            }
            $indice = 0;
            addOpt(oCntrl, $indice, "<< Seleccione Tarifa >>", $indice);
            for ($x = 0; $x < vp.length; $x++)
            {
                if (vp[$x]["IdConsTar"] == document.form1.id_fenv.options[document.form1.id_fenv.selectedIndex].value)
                {
                    $indice += 1;
                    addOpt(oCntrl, $indice, vp[$x]["DescConsTar"], vp[$x]["id_pais"]);
                }
            }
        }

        function validarinfo(form)
        {
            for (i = 0; i < form.length; i++)
            {
                switch (form.elements[i].type)
                {
                    case 'text':
                    case 'textarea':
                    case 'select-multiple':
                        {
                            if (rightTrim(form.elements[i].value) == '')
                            {
                                alert("Por favor complete todos los campos del registro");
                                form.elements[i].focus();
                                return false;
                            }
                            if ((form.elements[i].name != 'txt_desc') && ((parseInt(form.elements[i].value) < 0) || isNaN(parseInt(form.elements[i].value)) || (parseInt(form.elements[i].value) > 9999999)))
                            {
                                alert("Digite cantidad numerica");
                                form.elements[i].focus();
                                return false;
                            }
                        }
                        break;
                    case 'checkbox':
                        {
                            alert(form.elements[i].checked);
                        }
                        break;
                    case 'select-one':
                        {
                            if ((form.elements[i].name != 'id_clta') && (form.elements[i].value == '0'))
                            {
                                alert("Por favor complete todos los campos del registro");
                                form.elements[i].focus();
                                return false;
                            }
                        }
                        break;
                }
            }
            form.submit();
        }

        function val_borrar(valor)
        {
            if (valor == null || valor == 0)
            {
                alert("Por favor seleccione Tarifa.");
                return false;
            }
        }

        function ver_listado(que)
        {
            window.open('listados.php?var=tar', '', 'scrollbars=yes,menubar=no,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
        }

        function anula_todo()
        {
            document.form1.slc_TipoTar.value = 0;
            document.form1.id_clta.value = 0;
            Actualiza();
        }

        function anula_datos()
        {
            document.form1.txt_idTar.value = "";
            document.form1.txt_lim1.value = "";
            document.form1.txt_lim2.value = "";
            document.form1.txt_desc.value = "";
            document.form1.txt_v1.value = "";
            document.form1.txt_v2.value = "";
        }

<?php if (isset($vcltav)) echo arrayToJsArray($vcltav, 'vp'); ?>

    </script>
    <head>
        <title>Orfeo - Admor de Tarifas.</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
    </head>
    <body>
        <br>
        <br>
        <form name="form1" id="form1" method="post" action="<?= $_SERVER['PHP_SELF'] ?>">
            <input type="hidden" id="hdBandera" name="hdBandera" value="">
            <center>
                <div id="titulo" style="width: 75%;" align="center">Administraci&oacute;n de tarifas</div>
                <table width="75%" align="center" border="1" cellspacing="0" class="tablas">
                    <?php if (isset($msg_error)) echo $msg_error ?>

                    <tr bordercolor="#FFFFFF">
                        <td align="center" valign="middle" class="titulos2">1.</td>
                        <td align="left" class="titulos2"><label for="id_fenv">Forma del env&iacute;o</label></td>
                        <td colspan="4" class="listado2">
                            <?php
                            // Listamos los continentes.
                            if (isset($_POST['id_fenv'])) {
                                $id_fenv = $_POST['id_fenv'];
                            } else {
                                $id_fenv = '';
                            }
                            echo $Rs_fenv->GetMenu2('id_fenv', $id_fenv, "0:&lt;&lt; SELECCIONE &gt;&gt;", false, 0, " id=\"id_fenv\" class='select' title='Listado con las formas de envío registradas' Onchange='anula_todo();' ");
                            $Rs_fenv->Close();
                            ?>
                        </td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td width="5%" align="center" valign="middle" class="titulos2">2.</td>
                        <td width="26%" align="left" class="titulos2"><label for="slc_TipoTar">Localizaci&oacute;n del Env&iacute;o</label> </td>
                        <td colspan="4" class="listado2">
                            <select name="slc_TipoTar" class="select" id="slc_TipoTar" onChange="if (id_fenv.value == 0) {
                                        alert('Seleccione Forma de Envio');
                                        slc_TipoTar.value = 0;
                                    } else
                                        this.form.submit()" title="Tipos de destino del envío">
                                <option value="0">&lt;&lt; seleccione &gt;&gt;</option>
                                <option value="1" <?php if (isset($_POST['slc_TipoTar'])) ($_POST['slc_TipoTar'] == '1') ? print "selected" : print "" ?>>Nacional</option>
                                <option value="2" <?php if (isset($_POST['slc_TipoTar'])) ($_POST['slc_TipoTar'] == '2') ? print "selected" : print "" ?>>Internacional</option>
                            </select>
                        </td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td align="center" valign="middle" class="titulos2">3.</td>
                        <td align="left" class="titulos2"><label for="id_clta">Seleccione Tarifa</label> </td>
                        <td colspan="4" class="listado2">
                            <?php
// Listamos las tarifas.

                            if (isset($_POST['slc_TipoTar']) && $_POST['slc_TipoTar'] > 0) {
                                echo $Rs_clta->GetMenu2('id_clta', false, "0:&lt;&lt; SELECCIONE &gt;&gt;", false, 0, " id=\"id_clta\" onchange=\"Actualiza()\" class='select' title='Listado de tarifas de acuerdo al medio de envío seleccionado'");
                                $Rs_clta->Close();
                            } else
                                echo "<select name='id_clta' id='id_clta' class='select' title='Listado de envíos de acuerdo a la forma de envío seleccionada'></select>";
                            ?>
                        </td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td width="5%" rowspan="5" align="center" valign="middle" class="titulos2">4.</td>
                        <td width="26%" class="titulos2"><label for="txt_idTar">C&oacute;digo</label></td>
                        <td colspan="4" align="center" class="listado2">
                            <input name="txt_idTar" id="txt_idTar" type="text" size="5" maxlength="5" title="C&oacute;digo de la forma de env&iacute;o">
                        </td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td width="26%" rowspan="2" class="titulos2">Peso</td>
                        <td width="16%" align="center" class="titulos2"> <label for="txt_lim1">L&iacute;mite Inferior</label></td>
                        <td width="16%" align="center" class="titulos2"><label for="txt_lim2">L&iacute;mite Superior</label> </td>
                        <td colspan="2" align="center" class="titulos2"><label for="txt_desc">Descripci&oacute;n</label></td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td width="16%" align="center" class="listado2"><input name="txt_lim1" id="txt_lim1" type="text" size="5" maxlength="5" title="Peso mínimo de los elementos a enviar en la forma de envío"></td>
                        <td align="center" class="listado2"><input name="txt_lim2" id="txt_lim2" type="text" size="5" maxlength="5" title="Peso máximo de los elementos a enviar en la forma de envío"></td>
                        <td colspan="2" align="center" class="listado2">
                            <input name="txt_desc" id="txt_desc" type="text" size="50" maxlength="150">
                        </td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td width="26%" rowspan="2" class="titulos2"><?= utf8_decode("Valor Envío"); ?></td>
                        <td colspan="2" align="center" class="titulos2"><label for="txt_v1">Local / Grupo 1 *</label></td>
                        <td colspan="2" align="center" class="titulos2"><label for="txt_v2">Nacional / Grupo 2 *</label></td>
                    </tr>
                    <tr bordercolor="#FFFFFF">
                        <td colspan="2" class="listado2">
                    <center><input name="txt_v1" id="txt_v1" type="text" size="5" maxlength="5" title="Costo monetario del envío dentro de la misma ciudad"></center>
                    </td>
                    <td colspan="2" class="listado2">
                    <center><input name="txt_v2" id="txt_v2" type="text" size="5" maxlength="5" title="Costo monetario del envío a otras ciudades"></center>
                    </td>
                    </tr>
                    <tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                        <td colspan="6"><font color="Gray">
                            <b>NOTA: </b> El valor del Env&iacute;o es relacional al punto 2, Si &eacute;ste es a nivel Nacional entonces los valores ser&aacute;n
                            Local y Nacional; sino (internacional) Grupo 1 y Grupo 2 se refiere al valor en caso que el pa&iacute;s destino se encuentre o no
                            en Am&eacute;rica respectivamente.
                            </font></td>
                    </tr>
                    <?php //if (isset($msg_error)) echo $msg_error  ?>
                </table>
                <table width="75%" border="0" align="center" cellpadding="0" cellspacing="0" class="tablas">
                    <tr class="cajaBotonesMedio">
                        <td width="10%" class="listado1">&nbsp;</td>
                        <td width="20%"  class="listado1">
                            <span class="celdaGris"><center>
                                    <input name="btn_accion" type="button" class="botones" id="btn_accion" value="Listado" onClick="ver_listado('tarifas');" aria-label="Listar en una nueva ventana las tarifas existentes">
                                </center></span>	</td>
                        <td width="20%" class="listado1">
                            <span class="e_texto1"><center>
                                    <input name="btn_accion" type="submit" class="botones" id="btn_accion" value="Agregar" onClick="document.form1.hdBandera.value = 'A'; return validarinfo(this.form);" aria-label="Agregar nueva tarifa">
                                </center></span>	</td>
                        <td width="20%" class="listado1">
                            <span class="e_texto1"><center>
                                    <input name="btn_accion" type="submit" class="botones" id="btn_accion" value="Modificar" onClick="document.form1.hdBandera.value = 'M';
                                            return validarinfo(this.form);" aria-label="Guardar cambios de la tarifa seleccionada">
                                </center></span>	</td>
                        <td width="20%" class="listado1">
                            <span class="e_texto1"><center>
                                    <input name="btn_accion" type="submit" class="botones" id="btn_accion" value="Eliminar" onClick="document.form1.hdBandera.value = 'E'; return val_borrar(document.form1.txt_idTar.value);" aria-label="Eliminar tarifa seleccionada">
                                </center></span>	</td>
                        <td width="10%" class="listado1">&nbsp;</td>
                    </tr>
                </table>
            </center>
        </form>
    </body>
</html>
