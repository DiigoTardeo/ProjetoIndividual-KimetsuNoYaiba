// sessão
function validarSessao() {
    // aguardar();

    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var usuario = document.getElementById("usuario");

    if (email != null && nome != null) {
        // window.alert(`Seja bem-vindo, ${nome}!`);
        usuario.innerHTML = nome;

        // finalizarAguardar();
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    // aguardar();
    sessionStorage.clear();
    // finalizarAguardar();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.innerHTML = texto;
    }
}


// modal
function mostrarModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "flex";
}

function fecharModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "none";
}


    /* ABRIR E FECHAR O HEADER*/
    function abrirAba(){
        btn_abreAba.style.display= "none";
        aba_left.style.width="300px";
        btn_fechaAba.style.display= "flex";
        navegar_header.style.margin= "0px 0px 0px 0px";
        container_dados.style.margin= "20px 20px 0px 325px";
        container_missoes.style.margin= "20px 20px 0px 325px";
        container_voto.style.margin= "20px 20px 0px 325px";
        btn_sair.style.display="flex";
    }

    function fecharAba(){
        btn_abreAba.style.display= "block";
        aba_left.style.width="95px";
        btn_fechaAba.style.display= "none";
        navegar_header.style.margin=" 0px 0px 0px -100vw";
        container_dados.style.margin= "20px 20px 0px 120px";
        container_missoes.style.margin= "20px 20px 0px 120px";
        container_voto.style.margin= "20px 20px 0px 120px";
    }

    
    function dadosA(){
        abreDados.style.display = "none";
        fechaDados.style.display = "block";
        fechaDados.style.margin = "-148px 0px 0px 0px";
        meusDados.style.margin = "40px 0px 0px 0px";
        minhasMissoes.style.margin = "3px 0px 0px 0px";  
        votoRank.style.margin = "103px 0px 0px 0px";
    }

    function dadosF(){
        abreDados.style.display = "block";
        fechaDados.style.display = "none";
        abreDados.style.margin = "-48px 0px 0px 0px";
        meusDados.style.margin = "0px 0px 0px 0px";
        minhasMissoes.style.margin = "-47px 0px 0px 0px";
        votoRank.style.margin = "3px 0px 0px 0px";
    }

    // /* BOTÕES DO HEADER  */ 
    function meus_dados(){
        container_dados.style.display = "flex";
        container_missoes.style.display = "none";
        container_voto.style.display = "none";
        // container_sugestao.style.display = "none";
    }

    function missoes(){
        container_dados.style.display = "none";
        container_missoes.style.display = "flex";
        container_voto.style.display = "none";
        // container_sugestao.style.display = "none";
    }

    function voto(){
        container_dados.style.display = "none";
        container_missoes.style.display = "none";
        container_voto.style.display = "flex";
        // container_sugestao.style.display = "none";
    }

    function sugestao(){
        container_dados.style.display = "none";
        container_missoes.style.display = "none";
        container_voto.style.display = "none";
        // container_sugestao.style.display = "flex";
    }