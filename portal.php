
<?php

include_once 'database.php';

class portal extends database {

  public function f_Login($mParam) {
    $mResult = [];
    $sUsuario = $mParam["usuario"];
    $sContras = sha1($mParam["contrasenia"]);

    $sUsuarios = "SELECT * ";
    $sUsuarios .= "FROM usuarios ";
    $sUsuarios .= "WHERE email = \"{$sUsuario}\" ";
    $sUsuarios .= "OR nickname = \"{$sUsuario}\" ";
    $objResult = $this->connect()->query($sUsuarios);
    if (!$objResult->rowCount()) {
      array_push($mResult, array("mensaje" => "El usuario no existe, por favor verifique"));
    } else {
      $vAssRes = $objResult->fetch(PDO::FETCH_ASSOC);
      if ($vAssRes["password"] != $sContras) {
        array_push($mResult, array("mensaje" => "Contraseña errada, por favor verifique"));
      } else {
        unset($vAssRes["password"]);
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }
  public function f_ListarSecciones() {
    $mResult = [];
    $sSecciones = "SELECT id_seccion, nombre_seccion ";
    $sSecciones .= "FROM secciones ";
    $sSecciones .= "WHERE estado = \"ACTIVO\" ";
    $sSecciones .= "ORDER BY id_seccion ASC ";
    $objResult = $this->connect()->query($sSecciones);
    if (!$objResult->rowCount()) {
      array_push($mResult, array("mensaje" => "No hay secciones cargadas"));
    } else {
      while ($vAssRes = $objResult->fetch(PDO::FETCH_ASSOC)) {
        array_push($mResult, $vAssRes);
      }
    }
    return $mResult;
  }

  public function f_CrearNoticia($mDatos) {
    $mResult = [];

    $oForm = json_decode($mDatos["form"]);
    $sTitulo = $oForm->titulo;
    $sContenido = $oForm->contenido;
    $nSeccion = $oForm->seccion;
    $sAutor = $oForm->autor;

    $sNomArc = $mDatos["archivo"]["nombreArchivo"];
    $archivo = $mDatos["archivo"]["base64textString"];
    $archivo = base64_decode($archivo);

    $filePath = $_SERVER['DOCUMENT_ROOT'] . "/files_portal/" . $sNomArc;
    file_put_contents($filePath, $archivo);

    $nUser = 0;
    $sUsuarios = "SELECT id_usuario ";
    $sUsuarios .= "FROM usuarios ";
    $sUsuarios .= "WHERE cedula = \"{$mDatos["token"]}\" ";
    $objResult = $this->connect()->query($sUsuarios);
    if ($objResult->rowCount()) {
      $vAssRes = $objResult->fetch(PDO::FETCH_ASSOC);
      $nUser = $vAssRes["id_usuario"];
    }

    $sInsNoti = "INSERT INTO noticias (titulo, ruta_imagen, contenido, seccion, autor, usuario_creacion, fecha_creacion, hora_creacion, usuario_modificacion, fecha_modificacion, hora_modificacion, estado) ";
    $sInsNoti .= "VALUES (\"{$sTitulo}\", \"{$filePath}\", \"{$sContenido}\", \"{$nSeccion}\", \"{$sAutor}\", {$nUser}, CURDATE(), CURTIME(), {$nUser}, CURDATE(), CURTIME(), \"ACTIVO\")";
    $objResult = $this->connect()->query($sInsNoti);
    if ($objResult->rowCount()) {
      array_push($mResult, array("mensaje" => "Noticia creada con exito"));
    }
    return $mResult;
  }
}
