<?php
// Configurações de conexão ao banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";

// Conexão ao banco de dados usando a classe mysqli
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica se a conexão foi bem-sucedida
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Verifica a ação solicitada na URL
$action = isset($_GET['action']) ? $_GET['action'] : '';

// Executa a função correspondente com base na ação
if ($action === 'carregarItens') {
    carregarItensCarrinho($conn);
} elseif ($action === 'excluirItens') {
    excluirItens($conn);
} elseif ($action === 'comprarItens') {
    comprarItens($conn);
} elseif ($action === 'limparCarrinho') {
    limparCarrinho($conn);
}

// Fecha a conexão com o banco de dados
$conn->close();

// Função para carregar itens no carrinho
function carregarItensCarrinho($conn) {
    // Consulta SQL para obter os produtos no carrinho
    $result = $conn->query("
        SELECT p.id_produto, p.nome, p.preco
        FROM produto p
        INNER JOIN carrinho_produto cp ON p.id_produto = cp.produto_id_produto
        WHERE cp.carrinho_id_carrinho = 1
    ");

    // Inicializa um array para armazenar os itens
    $itens = array();

    // Verifica se há resultados na consulta
    if ($result->num_rows > 0) {
        // Itera sobre os resultados e adiciona os itens ao array
        while ($row = $result->fetch_assoc()) {
            $itens[] = array(
                'id' => $row['id_produto'],
                'nome' => $row['nome'],
                'preco' => $row['preco']
            );
        }
    }

    // Converte o array para JSON e imprime na saída
    echo json_encode($itens);
}

// Função para excluir itens do carrinho
function excluirItens($conn) {
    // Obtém os dados JSON do corpo da requisição
    $data = json_decode(file_get_contents("php://input"));

    // Verifica se há itens a serem excluídos
    if (!empty($data->itens)) {
        // Converte os IDs dos itens em uma string separada por vírgulas
        $itens = implode(',', $data->itens);

        // Executa a query para excluir os itens da tabela carrinho_produto
        $conn->query("DELETE FROM carrinho_produto WHERE produto_id_produto IN ($itens)");

        // Envia uma resposta JSON indicando sucesso
        echo json_encode(array('mensagem' => 'Itens excluídos com sucesso.'));
    } else {
        // Se nenhum item foi selecionado, envia uma mensagem indicando isso
        echo json_encode(array('mensagem' => 'Nenhum item selecionado para exclusão.'));
    }
}

// Função para comprar itens
function comprarItens($conn) {
    // Obtém os dados JSON do corpo da requisição
    $data = json_decode(file_get_contents("php://input"));

    // Verifica se há itens a serem comprados
    if (!empty($data->itens)) {
        // Cria um novo carrinho e obtém o ID
        $carrinhoId = criarCarrinho($conn);

        // Adiciona os itens ao novo carrinho
        adicionarItensCarrinho($conn, $carrinhoId, $data->itens);

        // Atualiza o estoque dos produtos
        atualizarEstoque($conn, $data->itens);

        // Envia uma resposta JSON indicando sucesso
        echo json_encode(array('mensagem' => 'Itens comprados com sucesso.'));
    } else {
        // Se nenhum item foi selecionado, envia uma mensagem indicando isso
        echo json_encode(array('mensagem' => 'Nenhum item selecionado para compra.'));
    }
}

// Função para criar um novo carrinho
function criarCarrinho($conn) {
    // Executa a query para inserir um novo carrinho
    $conn->query("INSERT INTO carrinho (valorTotal, codigo) VALUES (0, 'CODIGO_GERADO_PELO_SISTEMA')");

    // Retorna o ID do carrinho recém-criado
    return $conn->insert_id;
}

// Função para adicionar itens a um carrinho
function adicionarItensCarrinho($conn, $carrinhoId, $itens) {
    // Itera sobre os IDs dos itens e executa a query para cada um
    foreach ($itens as $itemId) {
        $conn->query("INSERT INTO carrinho_produto (carrinho_id_carrinho, produto_id_produto) VALUES ($carrinhoId, $itemId)");
    }
}

// Função para atualizar o estoque de produtos
function atualizarEstoque($conn, $itens) {
    // Itera sobre os IDs dos itens e executa a query para atualizar o estoque
    foreach ($itens as $itemId) {
        $conn->query("UPDATE produto SET estoque = estoque - 1 WHERE id_produto = $itemId");
    }
}

// Função para limpar o carrinho
function limparCarrinho($conn) {
    // Obtém os dados JSON do corpo da requisição
    $data = json_decode(file_get_contents("php://input"));

    // Inicializa a resposta padrão como erro, caso algo dê errado
    $response = array('mensagem' => 'Erro ao limpar carrinho.');

    try {
        // Verifica se o carrinho está definido na sessão
        if (!isset($_SESSION['carrinho_id'])) {
            // Se o carrinho não estiver definido, envia uma resposta JSON indicando que o carrinho já está vazio
            $response = array('mensagem' => 'Carrinho já está vazio.');
        } else {
            // Inicia uma transação para garantir a consistência do banco de dados
            $conn->begin_transaction();

            // Lógica para limpar o carrinho
            $query = "DELETE FROM carrinho_produto WHERE carrinho_id_carrinho = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('i', $_SESSION['carrinho_id']);
            $stmt->execute();

            // Verifica se a exclusão foi bem-sucedida
            if ($stmt->affected_rows > 0) {
                // Se a exclusão foi bem-sucedida, commit da transação e atualiza a resposta JSON
                $conn->commit();
                $response = array('mensagem' => 'Itens excluídos com sucesso.');
            } else {
                // Se nenhum item foi excluído, rollback da transação e envia uma mensagem de erro
                $conn->rollback();
                $response = array('mensagem' => 'Erro ao excluir itens do carrinho.');
            }
        }
    } catch (Exception $e) {
        // Em caso de exceção, rollback da transação e envia uma mensagem de erro
        $conn->rollback();
        $response = array('mensagem' => 'Erro ao limpar carrinho: ' . $e->getMessage());
    }

    // Resposta JSON
    header('Content-Type: application/json');
    echo json_encode($response);
}

?>
