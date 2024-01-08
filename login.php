<form method="POST">

Email: <input type="email" name="email" required />
<br>
password : <input type="password" name="password" required />
<br>
<button name="login" type="submit">login</button>
</form>

<?php
if(isset($_POST ['login'] )){
$username = "root";
$password = "123";
$database = new PDO("mysql:host=localhost; dbname=e-perscription;",$username,$password);

$login = $database->prepare("SELECT * FROM Users WHERE Email = :email AND Password = : password");
$login->bindparm("email",$POST['email']);
$login>bindparm("password",$POST['password']);
$login>excute(); 





  if( $login->rowCount()===1)
{
  session_start();
  $user = $login->fetchObject();
  $session['user']=$user;
  echo "تم تسجيل الدخول";

if($user->Experise=="Doctor"){
header("locatin : user/index.php,true");

}else if($user->Expertise=="pharmacist"){
  header("locatin : super-admin/index.php,true");
}

}else{
    echo "كلمةالمرور أو البريد غير صحيح";
}
}
?>
