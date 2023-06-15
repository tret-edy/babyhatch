<?php
header('Content-Type: application/json');
require_once('config.php');

$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    


$stmt = $db->prepare( 'UPDATE infographic SET igName = :igName, igImage = :igImage, igDesc = :igDesc WHERE igID = :igID' ); 

$stmt->bindValue( ':igID', $_POST['igID'] );
$stmt->bindValue( ':igName', $_POST['igName'] );
$stmt->bindValue( ':igImage', $_POST['igImage'] );
$stmt->bindValue( ':igDesc', $_POST['igDesc'] );

// more binds here
$result =$stmt->execute();
echo json_encode([
'status' => $result,
'message' => "",
'mesejlog' => "",
'mesejayat' => "Successfull Update data.",
'count_result' => "1",
'data' => []
]);

















?>