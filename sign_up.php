
<form method="POST">

Name : <input type="text" name="name" required />
<br>
Age : <input type="text" name="age" required />
<br>
Email : <input type="email" name="email" />
<br>
password : <input type="password" name="password"/>
<br>
phone : <input type="phone" name="phone"/>
<br>
Certificate : <input type="text" name="Certificate"/>
<br>
Expertise : <input type="text" name="Expertise"/>
<br>
Adddress : <input type="text" name="Adddress "/>
<br>
Gender : <input type="text" name="Gender"/>
<br>
<button name="login" type="submit" name="register">login</button>
</form>

<?php
$username = "root";
$password = "123";
$database = new PDO("mysql:host=localhost; dbname=e_prescription;",$username,$password);

if (isset($_POST['register'])){
    $checkEmail= $database->prepare("SELECT * FROM Users WHERE EMAIL = :EMAIL ");
$email = $_POST['email'];
$checkEmail->bindparm("EMAIL",$email);
$checkEmail->execute();

if($checkEmail->rowcount()>0){

    echo "الحساب مستخدم مسبقاً";
}else{

$name=$_POST['name'];
$password=$_POST['password'];
$phone=$POST['phone'];
$Certificate=$POST['Certificate'];
$Expertise=$POST['Expertise'];
$Adddress=$POST['Adddress'];
$Gender=$POST['Gender'];
$email=$_POST['email'];
$age=$_POST['age'];

$addUser = $database->prepare("INSERT INTO Users(  User_Name , AGE , PASSWORD , EMAIL , phone ,Certificate ,Expertise, Adddress, Gender  ) VALUES(:NAME , :AGE , :PASSWORD , :EMAIL ,:phone  ,:Certificate ,:Expertise ,:Adddress ,: Gender ) " );

$addUser->bindparm("NAME",$name);
$addUser->bindparm("AGE ",$age);
$addUser->bindparm("PASSWORD",$password);
$addUser->bindparm("email",$email);
$addUser->bindparm("Certificate",$Certificate);
$addUser->bindparm("Adddress",$Adddress);
$addUser->bindparm("Gender",$Gender);
$addUser->bindparm("Expertise",$Expertise);
$addUser->bindparm("phone",$phone);

$addUser->excute();

if($addUser->excute()){
    echo "تم إنشاء الحساب بنجاح";
    session_start();
    $user = $sign_up->fetchObject();
    $session['user']=$user;
  
  if($user->Experise=="Doctor"){
  header("locatin : user/index.php,true");
  
  }else if($user->Expertise=="pharmacist"){
    header("locatin : super-admin/index.php,true");
  }
  
}else{
echo "حدث خطأ غير متوقع";

}



}
}
?>