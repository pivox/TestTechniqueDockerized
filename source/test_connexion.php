<?php
$myPDO = new PDO('pgsql:host=127.0.0.1;dbname=mydatabase;port=5435', 'postgres', 'postgres');
// $myPDO = new PDO('pgsql:host=127.0.0.1;dbname=postgres;port=5435', 'postgres', 'postgres');
try {
	$result = $myPDO->query('select * from question_historic');
	print_r($result->fetchAll());
} catch (Exception $ex) {
	echo $ex->getTraceAsString();
}