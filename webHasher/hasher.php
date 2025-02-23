<?php
    if (isset($_GET['pass'])) {
        $password = $_GET['pass'];

        // BCRYPT
        $BCRYPT = password_hash($password, PASSWORD_BCRYPT);
        echo "[+] BCRYPT: $BCRYPT\n";

        // MD5  
        $MD5 = md5($password);
        echo "[+] MD5: $MD5\n";

        // SHA-1  
        $SHA1 = sha1($password);
        echo "[+] SHA1: $SHA1\n";

        // SHA-256  
        $SHA256 = hash('sha256', $password);
        echo "[+] SHA256: $SHA256\n";

        // SHA-512  
        $SHA512 = hash('sha512', $password);
        echo "[+] SHA512: $SHA512\n";

        // WHIRLPOOL  
        $WHIRLPOOL = hash('whirlpool', $password);
        echo "[+] WHIRLPOOL: $WHIRLPOOL\n";

        // RIPMD-160  
        $RIPMD160 = hash('ripemd160', $password);
        echo "[+] RIPEMD-160: $RIPMD160\n";

        // TIGER-192  
        $TIGER192 = hash('tiger192,3', $password);
        echo "[+] TIGER-192: $TIGER192\n";

        // CRC32  
        $CRC32 = hash('crc32', $password);
        echo "[+] CRC32: $CRC32\n";

        exit();
    }
?>

