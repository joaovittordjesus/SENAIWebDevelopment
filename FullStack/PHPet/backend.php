<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$action = isset($_GET['action']) ? $_GET['action'] : '';

if ($action === 'carregarItens') {
    carregarItens($conn);
} elseif ($action === 'excluirItens') {
    excluirItens($conn);
} elseif ($action === 'comprarItens') {
    comprarItens($conn);
} elseif ($action === 'limparCarrinho') {
    limparCarrinho($conn);
}

$conn->close();

function carregarItens($conn) {
    $result = $conn->query("SELECT * FROM produto");
    $itens = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $itens[] = array(
                'id' => $row['id_produto'],
                'nome' => $row['nome'],
                'preco' => $row['preco']
            );
        }
    }

    echo json_encode($itens);
}

function excluirItens($conn) {
    $data = json_decode(file_get_contents("php://input"));

    if (!empty($data->itens)) {
        $itens = implode(',', $data->itens);
        $conn->query("DELETE FROM produto WHERE id_produto IN ($itens)");
        echo json_encode(array('mensagem' => 'Itens excluídos com sucesso.'));
    } else {
        echo json_encode(array('mensagem' => 'Nenhum item selecionado para exclusão.'));
    }
}

function comprarItens($conn) {
    $data = json_decode(file_get_contents("php://input"));

    if (!empty($data->itens)) {
        $carrinhoId = criarCarrinho($conn);
        adicionarItensCarrinho($conn, $carrinhoId, $data->itens);
        echo json_encode(array('mensagem' => 'Itens comprados com sucesso.'));
    } else {
        echo json_encode(array('mensagem' => 'Nenhum item selecionado para compra.'));
    }
}

function criarCarrinho($conn) {
    $conn->query("INSERT INTO carrinho (valorTotal, codigo) VALUES (0, 'CODIGO_GERADO_PELO_SISTEMA')");
    return $conn->insert_id;
}

function adicionarItensCarrinho($conn, $carrinhoId, $itens) {
    foreach ($itens as $itemId) {
        $conn->query("INSERT INTO carrinho_produto (carrinho_id_carrinho, produto_id_produto) VALUES ($carrinhoId, $itemId)");
    }
}

function limparCarrinho() {
    // Certifique-se de incluir seu arquivo de conexão
    require_once 'conexao.php';

    // Inicialize a resposta padrão como erro, caso algo dê errado
    $response = array('mensagem' => 'Erro ao limpar carrinho.');

    try {
        // Verifique se o carrinho está definido na sessão
        if (!isset($_SESSION['carrinho_id'])) {
            // Se o carrinho não estiver definido, envie uma resposta JSON indicando que o carrinho já está vazio
            $response = array('mensagem' => 'Carrinho já está vazio.');
        } else {
            // Inicie uma transação para garantir a consistência do banco de dados
            $pdo->beginTransaction();

            // Exemplo de lógica para limpar o carrinho
            $query = "DELETE FROM carrinho_produto WHERE carrinho_id_carrinho = :carrinho_id";
            $stmt = $pdo->prepare($query);
            $stmt->bindParam(':carrinho_id', $_SESSION['carrinho_id']);
            $stmt->execute();

            // Verifique se a exclusão foi bem-sucedida
            if ($stmt->rowCount() > 0) {
                // Se a exclusão foi bem-sucedida, commit da transação e atualize a resposta JSON
                $pdo->commit();
                $response = array('mensagem' => 'Itens excluídos com sucesso.');
            } else {
                // Se nenhum item foi excluído, rollback da transação e envie uma mensagem de erro
                $pdo->rollBack();
                $response = array('mensagem' => 'Erro ao excluir itens do carrinho.');
            }
        }
    } catch (PDOException $e) {
        // Em caso de exceção, rollback da transação e envie uma mensagem de erro
        $pdo->rollBack();
        $response = array('mensagem' => 'Erro ao limpar carrinho: ' . $e->getMessage());
    }

    // Resposta JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}




?>
