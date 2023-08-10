<?php
session_start();
error_reporting(7);
$url_raiz = "../..";
$dir_raiz = $_SESSION['dir_raiz'];

include "$dir_raiz/config.php";
include_once 'funciones.php';
?>
<html>
    <head>
        <title>.: Modulo total :.</title>
        <link href="<?= $url_raiz . $ESTILOS_PATH2 ?>bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<?= $url_raiz . $_SESSION['ESTILOS_PATH_ORFEO'] ?>">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(document).ready(function () {
//                var myObject;
//                myObject = new ActiveXObject("Scripting.FileSystemObject");
//                if (myObject.FileExists('/var/www/html/pruebas/bodega/tmp/usuarios/usuarios_masiva.csv')) {
//                    alert("File Exists");
//                } else {
//                    alert("File doesn't exist");
//                }
//                $("#processFiles").css("display", "none");
//                $("#processFiles").css("display", "block");
            });
        </script>
    </head>
    <body bgcolor="#FFFFFF" topmargin="0" >
        <div class="container" >
            <div class="panel panel-body">
                <div id="titulo" style="" align="center" >Carga masiva e inactivaci&oacute;n de usuarios</div>
                <div class="form-group"><br>
                    Desde esta opción se puede hacer la carga e inactivación masiva de usuarios, por favor realizar los siguientes pasos:
                    <br><br>
                    &nbsp;&nbsp;&nbsp;1. Para <strong> cargar usuarios </strong> abrir el archivo <strong><a href="<?= $entidad_contacto . $ambiente . '/bodega/tmp/usuarios_masiva.csv' ?>">usuarios_masiva.csv</a></strong>
                    o para <strong> inactivar usuarios </strong> abrir el archivo <strong><a href="<?= $entidad_contacto . $ambiente . '/bodega/tmp/usuarios_masiva_inactivar.csv' ?>">usuarios_masiva_inactivar.csv</a></strong><br>
                    &nbsp;&nbsp;&nbsp;2. Ingresar la información de los usuarios en el archivo anteriormente descargado.<br>
                    &nbsp;&nbsp;&nbsp;3. Una vez ya se tenga el archivo diligenciado, se debe guardar con el nombre <strong>usuarios_masiva.csv</strong> en formato CSV delimitado por (,)<br>
                </div>
                <div class="form-group" id="archivoCarga">
                    <form name="form1" id="form1" method="post" action="upload.php" enctype="multipart/form-data">
                        <div class="col-sm-8">
                            <input type="file" class="form-control" id="archivo[]" name="archivo[]" required="">
                        </div>
                        <button type="submit" name="archivoCarga" class="btn btn-primary" >Enviar archivo  <span class="glyphicon glyphicon-upload" ></span></button>
                    </form>
                </div>
                <div class="form-group">
                    <?php
                    if (isset($_POST['processFiles'])) {
                        cargar_usuarios($ambiente);
                    }
                    if (isset($_POST['inactivar'])) {
                        inactivar_usuarios($ambiente);
                    }
                    ?>
                    <form class="" action="" method="POST">
                        <button type="submit" class="btn btn-primary" name="processFiles" id="processFiles">Cargar Usuarios</button>
                        <button type="submit" class="btn btn-primary" name="inactivar" id="inactivar">Inactivar Usuarios</button>
                    </form>
                </div>
            </div>
        </div>
    </body>

    <script type="text/javascript">
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 164000);
    </script>

<!--    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/alert.js"></script>-->
</html>