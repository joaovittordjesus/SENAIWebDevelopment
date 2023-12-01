document.addEventListener('DOMContentLoaded', function () {
    carregarItensCarrinho();
});

function carregarItensCarrinho() {
    fetch('backend.php?action=carregarItens', {
        method: 'GET'
    })
    .then(response => response.json())
    .then(data => {
        const listaProdutos = document.getElementById('lista-produtos');
        listaProdutos.innerHTML = '';

        data.forEach(item => {
            const li = document.createElement('li');
            li.innerHTML = `
                <input type="checkbox" id="item-${item.id}" value="${item.id}">
                <label for="item-${item.id}">${item.nome} - R$ ${item.preco}</label>
            `;
            listaProdutos.appendChild(li);
        });
    })
    .catch(error => console.error('Erro ao carregar itens:', error));
}

function excluirItens() {
    const itensSelecionados = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);

    if (itensSelecionados.length > 0) {
        fetch('backend.php?action=excluirItens', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ itens: itensSelecionados })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Itens excluídos com sucesso:', data);
            carregarItensCarrinho();
        })
        .catch(error => console.error('Erro ao excluir itens:', error));
    } else {
        console.log('Nenhum item selecionado para exclusão.');
    }
}

function comprarItens() {
    const itensSelecionados = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);

    if (itensSelecionados.length > 0) {
        fetch('backend.php?action=comprarItens', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ itens: itensSelecionados })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Itens comprados com sucesso:', data);
            carregarItensCarrinho();
        })
        .catch(error => console.error('Erro ao comprar itens:', error));
    } else {
        console.log('Nenhum item selecionado para compra.');
    }
}

function limparCarrinho() {
    // Implemente a lógica para limpar todos os itens do carrinho no banco de dados
    fetch('backend.php', {
        method: 'POST',
        body: JSON.stringify({
            action: 'limparCarrinho'
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao limpar carrinho');
        }
        return response.json();
    })
    .then(data => {
        alert('Carrinho limpo com sucesso: ' + data.mensagem);
        // Adicione aqui qualquer outra lógica que você queira executar após limpar o carrinho
    })
    .catch(error => {
        console.error('Erro ao limpar carrinho:', error);
    });
}

