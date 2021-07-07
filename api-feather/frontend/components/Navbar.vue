<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <NuxtLink to="/" class="navbar-brand d-flex align-items-center">
        <img
          src="../assets/img/obio-icon.png"
          alt="Obio Icon"
          width="50"
          class="d-inline-block align-text-top navbar-brand"
        />
        <span class="navbar-brand fw-bold">Obio</span>
      </NuxtLink>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <NuxtLink to="/products" class="nav-link">Productos</NuxtLink>
          </li>
          <li class="nav-item">
            <NuxtLink to="/cart" class="nav-link">
              <i class="fas fa-shopping-cart"></i> Carrito ({{ cart.length }})
            </NuxtLink>
          </li>
          <li class="nav-item" v-if="!isLogged">
            <NuxtLink to="/login" class="nav-link">Login</NuxtLink>
          </li>
          <li class="nav-item" v-else>
            <NuxtLink to="/admin" class="nav-link">
              <i class="fas fa-user"></i>
              Mi cuenta
            </NuxtLink>
          </li>
        </ul>
        <form class="d-flex align-items-center" @submit.prevent="searchProduct">
          <SpeechToText
            :text.sync="text"
            @cleanupText="cleanupText"
            @speechend="speechEnd"
            @changeInput="changeInput"
          ></SpeechToText>
          <button class="btn btn-outline-primary ms-3" type="submit">Buscar</button>
        </form>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'

export default {
  data: () => ({ text: '', sentences: null, inputBtn: '' }),
  methods: {
    ...mapMutations({ checkLog: 'checkStatusLog' }),
    speechEnd({ sentences, text }) {
      console.log('text', text)
      console.log('sentences', sentences)
      this.sentences = sentences
      this.searchProduct()
    },
    cleanupText() {
      this.text = ''
    },
    changeInput(event) {
      const { value } = event.target
      this.cleanupText()
      this.sentences = null
      this.inputBtn = value
    },
    searchProduct() {
      let search = (this.text || this.inputBtn).trim()
      if (!search) return
      if (search.endsWith('.')) search = search.split('.')[0]
      this.$router.push({ name: 'products-search', params: { search } })
    },
  },
  computed: {
    ...mapGetters({ isLogged: 'isLogged', cart: 'getCart' }),
  },
  mounted() {
    this.checkLog()
  },
}
</script>

<style lang="scss">
.nav-link.active {
  color: var(--comp5) !important;
}
</style>
