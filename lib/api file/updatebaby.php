<?php
header('Content-Type: application/json');
require_once('config.php');

$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


          
$stmt = $db->prepare( 'UPDATE babyhatch SET bhName = :bhName, bhState = :bhState, bhAdress = :bhAdress, bhHotline = :bhHotline, mapLatitude = :mapLatitude, mapLongitude = :mapLongitude WHERE bhID = :bhID' ); 

$stmt->bindValue( ':bhID', $_POST['id'] );
$stmt->bindValue( ':bhName', $_POST['name'] );
$stmt->bindValue( ':bhState', $_POST['state'] );
$stmt->bindValue( ':bhAdress', $_POST['address'] );
$stmt->bindValue( ':bhHotline', $_POST['hotline'] );
$stmt->bindValue( ':mapLatitude', $_POST['lat'] );
$stmt->bindValue( ':mapLongitude', $_POST['long'] );

// more binds here
$result =$stmt->execute();
echo json_encode([
'status' => $result,
'message' => "",
'mesejlog' => "",
'msgtxt' => "Successfull Update data.",  
'mesejayat' => "Successfull Update data.",
'count_result' => "1",
'data' => []
]);

















?>