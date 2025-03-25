<?php
$config = require_once __DIR__ . '/../../config/s0188328_WEB_3.php';

try {
    $conn = new PDO(
        "mysql:host={$config['host']};dbname={$config['dbname']};charset=utf8mb4",
        $config['username'],
        $config['password']
    );
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Включаем режим исключений для ошибок
} catch (PDOException $e) {
    die("Ошибка подключения к базе данных: " . $e->getMessage());
}

// Функция для валидации данных
function validateInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Получение данных из формы
$fio = validateInput($_POST['fio']);
$phone = "8".(str_replace("-", "", validateInput($_POST['phone'])));
$email = validateInput($_POST['email']);
$birthday = validateInput($_POST['birthday']);
$gender = validateInput($_POST['gender']);
$biography = validateInput($_POST['biography']);
$languages = $_POST['languages'];

if (!preg_match('/^[\p{L}\s]+$/u', $fio)){
    die("Неверный формат ФИО");
}
// Валидация email
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("Неверный формат email");
}


// Начало транзакции
$conn->beginTransaction();

try {
    // Проверка существования записи по FIO, Phone_number и Email
    $sql = "SELECT ID FROM Application WHERE FIO = :fio AND Phone_number = :phone AND Email = :email";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':fio', $fio);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        // Если запись существует, обновляем её
        $applicationId = $row['ID'];
        $sql = "UPDATE Application 
                SET FIO = :fio, Phone_number = :phone, Email = :email, Birth_day = :birthday, Gender = :gender, Biography = :biography 
                WHERE ID = :id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $applicationId);
    } else {
        // Если записи нет, вставляем новую
        $sql = "INSERT INTO Application (FIO, Phone_number, Email, Birth_day, Gender, Biography) 
                VALUES (:fio, :phone, :email, :birthday, :gender, :biography)";
        $stmt = $conn->prepare($sql);
    }

    // Привязка параметров
    $stmt->bindParam(':fio', $fio);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':birthday', $birthday);
    $stmt->bindParam(':gender', $gender);
    $stmt->bindParam(':biography', $biography);

    // Выполнение запроса
    $stmt->execute();

    // Если запись вставлялась, получаем её ID
    if (!$row) {
        $applicationId = $conn->lastInsertId();
    }

    // Удаление старых записей из таблицы Favorite_pl
    $sql = "DELETE FROM Favorite_pl WHERE ID = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $applicationId);
    $stmt->execute();

    // Вставка новых записей в таблицу Favorite_pl
    if (!empty($languages)) {
        $sql = "INSERT INTO Favorite_pl (ID, Programming_language) VALUES (:id, :language)";
        $stmt = $conn->prepare($sql);

        foreach ($languages as $language) {
            // Проверка, что $language не пустой и является числом
            if (!empty($language) && is_numeric($language)) {
                $stmt->bindParam(':id', $applicationId);
                $stmt->bindParam(':language', $language, PDO::PARAM_INT); // Явно указываем тип параметра
                $stmt->execute();
            }
        }
    }

    // Завершение транзакции
    $conn->commit();
    echo "Заявка успешно отправлена!";
} catch (PDOException $e) {
    // Откат транзакции в случае ошибки
    $conn->rollBack();
    die("Ошибка при выполнении запроса: " . $e->getMessage());
}

// Закрытие соединения
$conn = null;
?>
