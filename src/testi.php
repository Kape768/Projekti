<?php
// Otetaan tietokantayhteys käyttöön
require_once 'yhteys.php';

echo "<br>";

// Testataan yhteyttä ajamalla yksinkertainen kysely tietokantaan
if (isset($pdo)) {
    try {
        $stmt = $pdo->query("SELECT VERSION() AS versio, DATABASE() AS tietokanta");
        $tulos = $stmt->fetch();

        echo "Tietokantapalvelimen versio: " . htmlspecialchars($tulos['versio']) . "<br>";
        echo "Aktiivinen tietokanta: " . htmlspecialchars($tulos['tietokanta']) . "<br>";
    } catch (\PDOException $e) {
        echo "Kysely epäonnistui: " . htmlspecialchars($e->getMessage());
    }
}
?>