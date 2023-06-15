<?php
define('BASEPATH', true);
require_once('config.php');


$db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$user_phone  = "333333";
        $user_password ="wwewewe";
        $user_email ="dddddd";
        $user_tnc ="true";


    //check if login form is submitted
    if(isset($_POST['action']) && $_POST['action']=="newinfo"){
         $title  = $_POST['title'];
        $img  = $_POST['img'];
        $desc =$_POST['desc'];
        
    	           
               $sql = "INSERT INTO infographic (igID, igName,igImage, igDesc, igCategory) VALUES (?,?,?,?,?)";
            $stmt = $db->prepare($sql);
            if($stmt->execute([uniqid(), $title,$img, $desc,uniqid()])){
                    $status=true;
                    $message="successful";
                    $msglog="Successful add new data";
                   // $msgtxt="User register successful.\nOTP will send to this $user_phone number for reset password";
                $msgtxt="successful add new record.";
     
   }
            else{
                    $status=false;
                    $message="unsuccessful";
                    $msglog="unsuccessful";
                    $msgtxt="Error server : contact technical department";
   }
         
            
             echo json_encode([
                    'status' =>$status,
                    'message' =>$message,
                    'mesejlog' =>$msglog,
                    'msgtxt' =>$msgtxt,
                    'count_result' =>0,
                    'data' =>[]
                    ], JSON_PRETTY_PRINT);
        
   
        
          

 
    }
    else{
        
        
         echo json_encode([
                    'status' => false,
                    'message' =>"Invalid token Api access",
                    'mesejlog' =>"Invalid token Api access",
                    'msgtxt' =>"Invalid token Api access",
                    'count_result' => 0,
                    'data' =>[]
                    ], JSON_PRETTY_PRINT);

        
    }

















?>