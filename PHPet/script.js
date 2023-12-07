// Atualizar carrinho ao carregar a página
$(document).ready(function () {
    atualizarCarrinho();
});

// Função para atualizar o carrinho
function atualizarCarrinho() {
    $.ajax({
        type: 'POST',
        url: 'carrinho.php',
        dataType: 'html',
        success: function (response) {
            $('#carrinho-conteudo').html(response);
        }
    });
}

// Adicionar produto ao carrinho
function adicionarProduto(idProduto) {
    $.ajax({
        type: 'POST',
        url: 'carrinho.php',
        data: {acao: 'adicionar', produtoId: idProduto},
        success: function () {
            atualizarCarrinho();
        }
    });
}

// Remover produto do carrinho
function removerProduto(idProduto) {
    $.ajax({
        type: 'POST',
        url: 'carrinho.php',
        data: {acao: 'remover', produtoId: idProduto},
        success: function () {
            atualizarCarrinho();
        }
    });
}

// Finalizar compra
function finalizarCompra() {
    alert('Compra finalizada! Implemente a lógica de pagamento aqui.');
}
