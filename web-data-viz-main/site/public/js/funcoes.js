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
        fundo_aba_left.style.width="300px";
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
        fundo_aba_left.style.width="95px"
        aba_left.style.width="95px";
        btn_fechaAba.style.display= "none";
        navegar_header.style.margin=" 0px 0px 0px -100vw";
        container_dados.style.margin= "20px 20px 0px 120px";
        container_missoes.style.margin= "20px 20px 0px 120px";
        container_voto.style.margin= "20px 20px 0px 120px";
    }

    
    function dadosA(){
        abreDados.style.display = "none";
        fechaDados.style.display = "flex";
        fechaDados.style.margin = "0px 0px 0px 0px"
        // fechaDados.style.margin = "-148px 0px 0px 0px";
        meusDados.style.display = "flex";
        minhasMissoes.style.display = "flex";  
        // votoRank.style.margin = "3px 0px 0px 0px";
    }

    function dadosF(){
        abreDados.style.display = "flex";
        abreDados.style.margin = "0px 0px 0px 0px"
        fechaDados.style.display = "none";
        // abreDados.style.margin = "-95px 0px 0px 0px";
        meusDados.style.display = "none";
        minhasMissoes.style.display = "none";
        sugestoes.style.display = "flex"
        // votoRank.style.margin = "3px 0px 0px 0px";
    }

    // /* BOTÕES DO HEADER  */ 
    function meus_dados(){
        container_dados.style.display = "flex";
        container_missoes.style.display = "none";
        container_voto.style.display = "none";
        container_cruzadinha.style.display = "none";
        // container_sugestao.style.display = "none";
    }

    function missoes(){
        container_dados.style.display = "none";
        container_missoes.style.display = "flex";
        container_voto.style.display = "none";
        container_cruzadinha.style.display = "none";
        // container_sugestao.style.display = "none";
    }

    function voto(){
        container_dados.style.display = "none";
        container_missoes.style.display = "none";
        container_voto.style.display = "flex";
        container_cruzadinha.style.display = "none";
        // container_sugestao.style.display = "none";
    }

    function jogo(){
        container_dados.style.display = "none";
        container_missoes.style.display = "none";
        container_voto.style.display = "none";
        container_cruzadinha.style.display = "block";
    }

    function sugestao(){
        container_dados.style.display = "none";
        container_missoes.style.display = "none";
        container_voto.style.display = "none";
        // container_sugestao.style.display = "flex";
    }

    function verificar() {
        lista_ipt = [];
        lista_result = [];

        lista_ipt.push(kagaya_k.value, kagaya_a.value, kagaya_g.value, kagaya_a2.value, kagaya_y.value, kagaya_a3.value, kagaya_u.value, kagaya_b.value, kagaya_u2.value, kagaya_y2.value, kagaya_a4.value, kagaya_s.value, kagaya_h.value, kagaya_i.value, kagaya_k2.value, kagaya_i2.value, muzan_m.value, muzan_u.value, muzan_z.value, muzan_a.value, muzan_n.value, muzan_k.value, muzan_i.value, muzan_b.value, muzan_u2.value, muzan_t.value, muzan_s.value, muzan_u3.value, muzan_j.value, muzan_i2.value, tanjiro_t.value, tanjiro_a.value, tanjiro_j.value, tanjiro_i.value, tanjiro_r.value, tanjiro_o.value, exter_e.value, exter_x.value, exter_t.value, exter_e2.value, exter_m.value, exter_i.value, exter_n.value, exter_a.value, exter_d.value, onis_o.value, exter_r.value, exter_e3.value, exter_s.value, onis_n.value, onis_i.value, onis_s.value, jutsu_j.value, jutsu_u.value, jutsu_t.value, jutsu_s.value, jutsu_u2.value, jutsu_d.value, espad_e.value, jutsu_a.value, jutsu_n.value, jutsu_g.value, jutsu_u3.value, jutsu_e.value, hashi_h.value, hashi_a.value, hashi_s.value, hashi_h2.value, hashi_i.value, hashi_r.value, hashi_a2.value, hashi_s2.value, espad_s.value, espad_p.value, espad_a.value, espad_d.value, espad_s2.value, lua_l.value, lua_u.value, lua_a.value, lua_n.value, lua_f.value, lua_e.value, lua_r.value, lua_i.value, lua_o.value, lua_r2.value, luaS_l.value, luaS_u.value, luaS_a.value, luaS_s.value, luaS_u2.value, luaS_p.value, luaS_e.value, luaS_i.value, luaS_o.value, resp_r.value, resp_e.value, resp_s.value, resp_p.value, resp_i.value, resp_r2.value, resp_a.value, resp_ç.value, resp_o.value);

        lista_result.push(kagaya_k, kagaya_a, kagaya_g, kagaya_a2, kagaya_y, kagaya_a3, kagaya_u, kagaya_b, kagaya_u2, kagaya_y2, kagaya_a4, kagaya_s, kagaya_h, kagaya_i, kagaya_k2, kagaya_i2, muzan_m, muzan_u, muzan_z, muzan_a, muzan_n, muzan_k, muzan_i, muzan_b, muzan_u2, muzan_t, muzan_s, muzan_u3, muzan_j, muzan_i2, tanjiro_t, tanjiro_a, tanjiro_j, tanjiro_i, tanjiro_r, tanjiro_o, exter_e, exter_x, exter_t, exter_e2, exter_m, exter_i, exter_n, exter_a, exter_d, onis_o, exter_r, exter_e3, exter_s, onis_n, onis_i, onis_s, jutsu_j, jutsu_u, jutsu_t, jutsu_s, jutsu_u2, jutsu_d, espad_e, jutsu_a, jutsu_n, jutsu_g, jutsu_u3, jutsu_e, hashi_h, hashi_a, hashi_s, hashi_h2, hashi_i, hashi_r, hashi_a2, hashi_s2, espad_s, espad_p, espad_a, espad_d, espad_s2, lua_l, lua_u, lua_a, lua_n, lua_f, lua_e, lua_r, lua_i, lua_o, lua_r2, luaS_l, luaS_u, luaS_a, luaS_s, luaS_u2, luaS_p, luaS_e, luaS_i, luaS_o, resp_r, resp_e, resp_s, resp_p, resp_i, resp_r2, resp_a, resp_ç, resp_o);


        for (var n = 0; n < lista_item.length; n++) {

            var result = lista_result[n];

            if (lista_ipt[n] == lista_item[n]) {
                result.classList.remove("error")
                result.classList.add("confirm")
            } else {
                result.classList.remove("confirm")
                result.classList.add("error")
            }
        }
    }