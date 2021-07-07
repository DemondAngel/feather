<template>
  <div class="card w-100">
    <img :src="getUrlImage" class="card-img-top pointer" :alt="product.nombre" @click="seeDetail" />
    <div class="card-body">
      <h5 class="card-title fw-bold">{{ product.nombre }}</h5>
      <p class="card-text text-truncate d-block">
        {{ product.descripcion }}
      </p>
      <button @click.prevent="seeDetail" class="btn btn-secondary text-white">Saber más</button>
      <button @click.prevent="addToCart" class="btn btn-outline-secondary mt-2">
        Añadir al carrito <i class="fas fa-cart-plus"></i>
      </button>
      <button @click="markAsFavorite" class="btn btn-outline-secondary mt-2" v-if="isLogged">
        Marcar como favorito <i class="fas fa-heart"></i>
      </button>
    </div>
  </div>
</template>

<script>
import { SwalLoading, SwalSuccess } from '../../static/sweetalert'
import { mapGetters, mapMutations } from 'vuex'

export default {
  props: {
    product: { type: Object, required: true },
  },
  methods: {
    ...mapMutations({ addItemToCart: 'addItemToCart', checkLog: 'checkStatusLog' }),
    seeDetail() {
      this.$router.push({
        name: 'products-slug',
        params: { slug: this.product.slug },
      })
    },
    addToCart() {
      this.addItemToCart(this.product)
      SwalSuccess(
        'Producto añadido',
        `El product <span class='fw-bold'>${this.product.nombre} ha sido añadido a tu carrito de compras</span>`
      )
    },
    markAsFavorite() {},
  },
  computed: {
    ...mapGetters({ isLogged: 'isLogged' }),
    getUrlImage() {
      return this.product.imagen?.url
        ? `localhost:8080${this.product.imagen.url}`
        : 'https://cdn.pixabay.com/photo/2016/04/12/22/35/watercolour-1325656__480.jpg'
    },
  },
  mounted() {
    this.checkLog()
  },
}
</script>

<style lang="scss" scoped>
.card {
  img {
    max-height: 200px;
    width: 100%;
    object-fit: cover;
  }
}
</style>
