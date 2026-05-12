<?php
declare(strict_types=1);

session_start();

$host = getenv('DB_HOST') ?: 'db';
$dbname = getenv('DB_NAME') ?: 'gestion_collectes';
$username = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASSWORD') ?: 'root';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
    ]);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>