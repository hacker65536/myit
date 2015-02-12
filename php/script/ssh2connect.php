<?php
/**
 *
 * exec command on ssh
 * @author s.hacker
 *
 */
class ssh2 {
    public $connection;
    public $stdin;
    public $stder;
    public $port = "22";
    public $pri_key = "~/id_rsa";
    public $pub_key = "~/id_rsa.pub";
    public $user;
    public $host;
	
    /**
     *
     * parse user@host
     * @param string $con
     */
	 
    function __construct($sshcon) {
        if (preg_match("/@/", $sshcon)) {
            list($this->user, $this->host) = explode("@", $sshcon);
            if (preg_match("/:/", $this->host)) {
                list($this->host, $this->port) = explode(":", $this->host);
            }
        } else {
            die("unknow host");
        }
        $this->connect();
    }
    /**
     *
     * connect
     */
    private function connect() {
        $this->connection = ssh2_connect($this->host, $this->port, array(
            'hostkey' => 'ssh-rsa'
        ));
        $this->auth_pubkey($this->user);
    }
    /**
     *
     * exec command on ssh session
     * @param string $cmd
     */
    public function ssh2exec($cmd) {
        $stream = ssh2_exec($this->connection, $cmd);
        // return $this->stream($stream);
        $this->stream($stream);
    }
    /**
     *
     * catch stream
     * @param resource $stream
     */
    private function stream($stream) {
        $errorStream = ssh2_fetch_stream($stream, SSH2_STREAM_STDERR);
        stream_set_blocking($errorStream, true);
        stream_set_blocking($stream, true);
        while (!feof($stream)) {
            $buffer = fread($stream, 48);
            echo $buffer;
            ob_flush();
            flush();
        }
        $this->stdin = stream_get_contents($stream);
        $this->stder = stream_get_contents($errorStream);
        fclose($errorStream);
        fclose($stream);
        //if ($this->stder) {
        //return $this->stder;
        //}
        //return $this->stdin;

    }
    /**
     *
     * set path of keyfile
     * @param string $pubkey
     * @param string $prikey
     */
    function set_pubkey_path($pubkey, $prikey) {
        $this->pub_key = $pubkey;
        $this->pri_key = $prikey;
    }
    /**
     *
     * Authenticate using a public key read from a file
     * @param string $username
     */
    function auth_pubkey($username) {
        if (!ssh2_auth_pubkey_file($this->connection, $username, $this->pub_key, $this->pri_key, 'secret')) {
            die('Public Key Authentication Failed');
        }
    }
    /**
     * not use   because owner will be change to root
     * get dir for path of key
     */
    function getownerdir() {
        $ary = posix_getpwuid(fileowner($_SERVER['PHP_SELF']));
        $dir = $ary['dir'] . DIRECTORY_SEPARATOR;
        $this->pri_key = $dir . $this->pri_key;
        $this->pub_key = $dir . $this->pub_key;
    }
}

$sshcon = new ssh2('USER@HOST');
//@ob_flush();
//echo "<pre>";
$sshcon->ssh2exec("ls");
//echo "</pre>";

?>
