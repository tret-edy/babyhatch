<?php
header('Content-Type: application/json');
require_once('config.php');


$conn = new mysqli($db_server, $db_user, $db_pass, $db_name);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

 //$_POST['action']="login";
    //check if login form is submitted
    if(isset($_POST['action']) && $_POST['action']=="login"){
        //assign variables to post values
        $user_email = $_POST['user_phone'];//"webforsoho";//
        $user_password =$_POST['user_password'];//"0000000000";/
        $data = array();
 
       
 $sql = "SELECT * FROM user WHERE username='".$user_email."' AND user_password='".$user_password."'";
        $result = $conn->query($sql);
        //get the user with email
       // $stmt = $db->prepare('SELECT * FROM user WHERE user_email = :user_email AND user_active=1');
        //echo $stmt;
 
   
            //check if email exist
            if ($result->num_rows > 0) {
                
                while($row = mysqli_fetch_assoc($result)) {
                    $username=$row['username'];
                $user_type=$row['user_type'];
  }
                 
                   
                $status=true;
                    $message="successful";
                    $msglog="User login successful";
                    $msgtxt="User verification successful";
               
 
               
                
            }
            else{
                   $status=false;
                    $message="unsuccessful";
                    $msglog="User login unsuccessful";
                    $msgtxt="User verification unsuccessful wrong email or password.";
            }
 
    
        
         echo json_encode([
                    'username' =>$username,
                     'user_type' =>$user_type,
                     'status' =>$status,
                    'message' =>$message,
                    'mesejlog' =>$msglog,
                    'msgtxt' =>$msgtxt,
                    'count_result' =>$result->num_rows,
                    'data' =>$data
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