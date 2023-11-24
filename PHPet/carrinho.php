<?php
// Incluir arquivo de conexão com o banco de dados
include 'conexao.php';

// Inicializar a sessão
session_start();

// Verificar ação
if (isset($_POST['acao'])) {
    switch ($_POST['acao']) {
        case 'adicionar':
            adicionarProdutoAoCarrinho($_POST['produtoId']);
            break;
        case 'remover':
            removerProdutoDoCarrinho($_POST['produtoId']);
            break;
        default:
            break;
    }
}

// Função para adicionar produto ao carrinho
function adicionarProdutoAoCarrinho($produtoId) {
    if (!isset($_SESSION['carrinho'])) {
        $_SESSION['carrinho'] = array();
    }

    // Adicione a lógica para verificar se o produto já está no carrinho

    $_SESSION['carrinho'][] = $produtoId;
}

// Função para remover produto do carrinho
function removerProdutoDoCarrinho($produtoId) {
    if (isset($_SESSION['carrinho'])) {
        $index = array_search($produtoId, $_SESSION['carrinho']);
        if ($index !== false) {
            unset($_SESSION['carrinho'][$index]);
        }
    }
}

// Função para exibir o carrinho
function exibirCarrinho() {
    global $conexao;

    if (isset($_SESSION['carrinho']) && count($_SESSION['carrinho']) > 0) {
        echo '<div class="produto-item"><h3>Produtos no Carrinho</h3>';

        foreach ($_SESSION['carrinho'] as $produtoId) {
            $query = "SELECT * FROM produto WHERE id_produto = $produtoId";
            $resultado = mysqli_query($conexao, $query);

            if ($resultado && mysqli_num_rows($resultado) > 0) {
                $produto = mysqli_fetch_assoc($resultado);
                echo '<div>' .
                     '<input type="checkbox">' . $produto['nome'] . ' - R$ ' . $produto['preco'] .
                     '<button onclick="removerProduto(' . $produto['id_produto'] . ')">Remover</button>' .
                     '</div>';
            }
        }

        echo '</div>';
    } else {
        echo '<p>Carrinho vazio</p>';
    }
}

// Exibir carrinho
exibirCarrinho();
?>
