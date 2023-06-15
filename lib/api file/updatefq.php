<?php
header('Content-Type: application/json');
require_once('config.php');

$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    


$stmt = $db->prepare( 'UPDATE faq SET fqQuestion = :fqQuestion, fqAnswer = :fqAnswer WHERE fqID = :fqID' ); 

$stmt->bindValue( ':fqID', $_POST['fqID'] );
$stmt->bindValue( ':fqQuestion', $_POST['fqQuestion'] );
$stmt->bindValue( ':fqAnswer', $_POST['fqAnswer'] );

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