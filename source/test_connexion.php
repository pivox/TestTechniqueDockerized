<?php
$myPDO = new PDO('pgsql:host=database;dbname=smart_tribune_haythem_mabrouk;port=5432', 'postgres', 'postgres');
$result = $myPDO->query('SELECT datname FROM pg_database');
print_r($result->fetchAll());