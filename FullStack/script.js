document.addEventListener('DOMContentLoaded', function () {
    carregarItensCarrinho();
    const btnExcluir = document.querySelector('button[data-action="excluirItens"]');
    const btnComprar = document.querySelector('button[data-action="comprarItens"]');
    const btnLimparCarrinho = document.querySelector('button[data-action="limparCarrinho"]');

    btnExcluir.addEventListener('click', excluirItens);
    btnComprar.addEventListener('click', comprarItens);
    btnLimparCarrinho.addEventListener('click', limparCarrinho);
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
    const itensSelecionados = obterItensSelecionados();

    if (itensSelecionados.length > 0) {
        const quantidadePorItem = obterQuantidadePorItem();
        const itensParaExcluir = [];

        itensSelecionados.forEach(itemId => {
            const quantidadeSelecionada = parseInt(quantidadePorItem[itemId], 10) || 0;
            if (quantidadeSelecionada > 0) {
                // Se houver mais de 1 item, reduza a quantidade sem excluir do carrinho
                for (let i = 1; i < quantidadeSelecionada; i++) {
                    itensParaExcluir.push(itemId);
                }
            } else {
                // Se a quantidade for 0, ou seja, o item foi totalmente removido, exclua do carrinho
                itensParaExcluir.push(itemId);
            }
        });

        if (itensParaExcluir.length > 0) {
            enviarAcao('excluirItens', { itens: itensParaExcluir }, 'Itens excluídos com sucesso.');
        } else {
            console.log('Nenhum item selecionado para exclusão.');
        }
    } else {
        console.log('Nenhum item selecionado para exclusão.');
    }
}

// Adicione esta função para obter a quantidade de cada item no carrinho
function obterQuantidadePorItem() {
    const quantidadePorItem = {};
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach(checkbox => {
        const itemId = checkbox.value;
        const quantidadeInput = document.querySelector(`#quantidade-${itemId}`);
        quantidadePorItem[itemId] = quantidadeInput ? quantidadeInput.value : 0;
    });

    return quantidadePorItem;
}


function enviarAcao(acao, data, sucessoMsg) {
    fetch(`backend.php?action=${acao}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (acao === 'excluirItens') {
            console.log(sucessoMsg, data);
            if (data.mensagem === 'Itens excluídos com sucesso.') {
                carregarItensCarrinho();
            }
        } else {
            console.log(sucessoMsg, data);
            carregarItensCarrinho();
        }
    })
    .catch(error => console.error(`Erro ao ${acao.toLowerCase()} itens:`, error));
}


function comprarItens() {
    const itensSelecionados = obterItensSelecionados();

    if (itensSelecionados.length > 0) {
        enviarAcao('comprarItens', { itens: itensSelecionados }, 'Itens comprados com sucesso.');
    } else {
        console.log('Nenhum item selecionado para compra.');
    }
}

function limparCarrinho() {
    enviarAcao('limparCarrinho', {}, 'Carrinho limpo com sucesso.');
}

function obterItensSelecionados() {
    return Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
        .map(checkbox => checkbox.value);
}

function enviarAcao(acao, data, sucessoMsg) {
    fetch(`backend.php?action=${acao}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        console.log(sucessoMsg, data);
        carregarItensCarrinho();
    })
    .catch(error => console.error(`Erro ao ${acao.toLowerCase()} itens:`, error));
}
