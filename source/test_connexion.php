<?php
$myPDO = new PDO('pgsql:host=127.0.0.1;dbname=smart_tribune_haythem_mabrouk;port=5435', 'postgres', 'postgres');
// $myPDO = new PDO('pgsql:host=127.0.0.1;dbname=postgres;port=5435', 'postgres', 'postgres');
$result = $myPDO->query('SELECT datname FROM pg_database');
print_r($result->fetchAll());