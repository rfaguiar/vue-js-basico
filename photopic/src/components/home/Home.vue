<template>
  <div>

    <h1 class="titulo">{{ titulo }}</h1>

    <input type="search" @:input="filtro = $event.target.value" class="filtro" placeholder="filtre pelo titulo da foto">
    {{ filtro }}

    <ul class="lista-fotos">
      <li class="lista-fotos-item" v-for="foto in fotosComFiltro" :key="foto.titulo">

        <meu-painel :titulo="foto.titulo">
          <imagem-responsiva :url="foto.url" :titulo="foto.titulo"/>
          <meu-botao 
            rotulo="remover" 
            tipo="button" 
            :confirmacao="true" 
            @botaoAtivado="remove(foto)"
            estilo="perigo"/>
        </meu-painel>
      </li>
    </ul>

  </div>
</template>

<script>

import Painel from '../shared/painel/Painel.vue'
import ImagemResponsiva from '../shared/imagem-responsiva/ImagemResponsiva.vue'
import Botao from '../shared/botao/Botao.vue'

export default {

  components: {
    'meu-painel': Painel,
    'imagem-responsiva': ImagemResponsiva,
    'meu-botao': Botao
  },

  methods: {

    remove(foto) {
      alert(foto.titulo);
    }
  },

  data () {
    
    return {
      titulo: 'Photopic',
      fotos: [],
      filtro: ''
    };
  },

  computed: {

    fotosComFiltro() {

      if (this.filtro) {
        let exp = new RegExp(this.filtro.trim(), 'i');
        return this.fotos.filter(foto => exp.test(foto.titulo));
      } else {
        return this.fotos;
      }

    }
  },

  created () {

	this.$resource('v1/fotos')
			.query()
            .then(res => res.json())
			.then(fotos => this.fotos = fotos, err => console.log('Não foi possível obter as fotos. Tenta mais tarde'));

    //this.$http.get('http://localhost:3000/v1/fotos')
    //  .then(res => res.json())
    //  .then(fotos => this.fotos = fotos, err => console.log(err));
  }
}
</script>

<style>
  .titulo {
    text-align: center;
  }

  .lista-fotos {
    list-style: none;
  }

  .lista-fotos .lista-fotos-item {
    display: inline-block;
  }

  .filtro {
    display: block;
    width: 100%;
  }
</style>
