<?php defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
    <html lan="pt-br">
<head>
    <title>Importa Fornecedor pelo XML </title>

</head>
<body>
<?php echo form_open_multipart('administracao/fornecedor'); ?>
XML File <input type="file" name="xmlFile">
<br>
<input type="submit" value="Import" >
<?php echo form_close(); ?>
</body>
</html>
