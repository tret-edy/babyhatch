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
    if(isset($_POST['action']) && $_POST['action']=="register"){
         $nama  = $_POST['nama'];
        $email  = $_POST['email'];
        $username =$_POST['username'];
        $password =$_POST['password'];
       // echo $user_tnc;
        if($nama!="" && $email!="" && $username!="" && $password!=""){
                 try {

          $hash=password_hash($user_password, PASSWORD_DEFAULT);
         $stmt = $db->prepare("SELECT COUNT(user_email) AS num FROM user WHERE user_email = :user_email");

         $stmt->bindValue(':user_email', $email);
         $stmt->execute();
         $row = $stmt->fetch(PDO::FETCH_ASSOC);
         if($row['num'] > 0){
             if($user_tnc){}
                    $status=false;
                    $message="unsuccessful";
                    $msglog="User register unsuccessful";
                    $msgtxt="Email already exists";
        }
        
       else{
           $six_digit= random_int(100000, 999999);
          //$json = sms_verification($user_phone,$six_digit);
           //$keys = array_keys(json_decode($json, TRUE));
           $keysx="success";
    //print_r($json);
           
           if($keysx=="success"){
               
               $sql = "INSERT INTO user (user_id, username,user_nama, user_password, user_email, user_active, user_verification) VALUES (?,?,?,?,?,?,?)";
            $stmt = $db->prepare($sql);
            if($stmt->execute([uniqid(), $username,$nama, $password, $email, "1",$six_digit])){
                    $status=true;
                    $message="successful";
                    $msglog="User register successful";
                   // $msgtxt="User register successful.\nOTP will send to this $user_phone number for reset password";
                $msgtxt="User register successful.";
     
   }
            else{
                    $status=false;
                    $message="unsuccessful";
                    $msglog="User register server error";
                    $msgtxt="Error server : contact technical department";
   }
           }
           
           else{
               $status=false;
                    $message="unsuccessful";
                    $msglog="sms verification error";
                    $msgtxt="Phone number is invalid for the region.";
               
           }
           
           
           
           
           
           
}
}
           catch(PDOException $e){
                    $status=0;
                    $message=$e->getMessage();
                    $msglog=$e->getMessage();
                    $msgtxt=$e->getMessage();
        }
        
       echo json_encode([
                    'status' =>$status,
                    'message' =>$message,
                    'mesejlog' =>$msglog,
                    'msgtxt' =>$msgtxt,
                    'count_result' =>$stmt->rowCount(),
                    'data' =>[]
                    ], JSON_PRETTY_PRINT);
            
        }
        else{
             $status=false;
                    $message="unsuccessful";
                    $msglog="User register unsuccessful cz not fill all detail";
                    $msgtxt="Please fill all detail and tnc ";
            
             echo json_encode([
                    'status' =>$status,
                    'message' =>$message,
                    'mesejlog' =>$msglog,
                    'msgtxt' =>$msgtxt,
                    'count_result' =>0,
                    'data' =>[]
                    ], JSON_PRETTY_PRINT);
        }
   
        
          

 
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