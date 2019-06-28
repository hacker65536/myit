
## download ci

https://www.codeigniter.com/

## docker-compose 



```yml
version: "3.7"

services:
  web:
    image: php:7.2-apache
    ports:
      - 80:80
    volumes:
      - ./CodeIgniter-3.1.10:/var/www/html
```


```console
$ docker-compose up -d 
```



## login page

`application/config/autoload.php`

```php
$autoload['libraries'] = array('session');
$autoload['helper'] = array('url','html','file');
```

`application/config/config.php` 

```php
$config['sess_save_path'] = sys_get_temp_dir();
```
for mkdir error


`application/controllers/Login.php`

```php
<?php  
defined('BASEPATH') OR exit('No direct script access allowed');  
  
class Login extends CI_Controller {  
      
    public function index()  
    {  
        $this->load->view('login_view');  
    }  
    public function process()  
    {  
        $user = $this->input->post('user');  
        $pass = $this->input->post('pass');  
        if ($user=='juhi' && $pass=='123')   
        {  
            //declaring session  
            $this->session->set_userdata(array('user'=>$user));  
            $this->load->view('welcome_view');  
        }  
        else{  
            $data['error'] = 'Your Account is Invalid';  
            $this->load->view('login_view', $data);  
        }  
    }  
    public function logout()  
    {  
        //removing session  
        $this->session->unset_userdata('user');  
        redirect("Login");  
    }  
  
}  
?>
```

`application/views/login_view.php`
```php
<!DOCTYPE html>  
<html>  
<head>  
    <title>Login Page</title>  
</head>  
<body>  
    <?php echo isset($error) ? $error : ''; ?>  
    <form method="post" action="<?php echo site_url('Login/process'); ?>">  
        <table cellpadding="2" cellspacing="2">  
            <tr>  
                <td><th>Username:</th></td>  
                <td><input type="text" name="user"></td>  
            </tr>  
            <tr>  
                <td><th>Password:</th></td>  
                <td><input type="password" name="pass"></td>  
            </tr>  
  
            <tr>  
                <td> </td>  
                <td><input type="submit" value="Login"></td>  
            </tr>  
        </table>  
    </form>  
</body>  
</html>
```

`application/views/welcome_view.php`
```php
<!DOCTYPE html>  
<html>  
<head>  
    <title></title>  
</head>  
<body>  
    Welcome <?php echo $this->session->userdata('user'); ?>   
<br>  
    <?php echp phpversion(); ?>
<br>
   <?php echo CI_VERSION; ?>
    <?php echo anchor('Login/logout', 'Logout'); ?>  
  
  
</body>  
</html>
```

localhost/index.php/Login

