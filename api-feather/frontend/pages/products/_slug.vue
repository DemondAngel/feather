<template>
  <div class="container mt-4 mb-5">
    <div class="d-flex align-items-center justify-content-between flex-wrap">
      <i @click="$router.go(-1)" class="fas fa-chevron-left fs-3 pointer"></i>
      <div class="d-flex align-items-baseline">
        <div class="display-4">{{ product.nombre }}</div>
        <div class="display-6 ms-4">{{ formatCurrency(product.precioVenta) }}</div>
      </div>
      <button
        class="btn btn-comp2 text-white"
        @click="addToCart"
        content="Añadir al carrito de compras"
        v-tippy
      >
        <i class="fas fa-cart-plus"></i>
      </button>
    </div>
    <div class="mt-4">
      <div class="fw-bold fs-3">Descripción</div>
      <p style="line-height: 1.6">{{ product.descripcion }}</p>
    </div>
    <div class="mt-4">
      <div class="fw-bold fs-3">Imágenes</div>
      <template v-if="product.imagen">
        <img :src="`http://35.226.240.143${this.product.imagen.url}`" :alt="product.nombre" />
      </template>
      <div class="alert alert-secondary mt-2" role="alert" v-else>
        Este producto no tiene imagenes por el momento
      </div>
    </div>
  </div>
</template>

<script>
import { tc } from '../../static/try-catch-helper'
import { getProducts } from '../../API/products'
import { formatCurrency } from '../../static/formatDate'
import { mapMutations } from 'vuex'
import { SwalSuccess } from '../../static/sweetalert'

export default {
  async asyncData({ route }) {
    const { slug } = route.params
    const [[product], error] = await tc(getProducts({ slug }))
    return { product }
  },
  methods: {
    ...mapMutations({ addItemToCart: 'addItemToCart' }),
    addToCart() {
      this.addItemToCart(this.product)
      SwalSuccess(
        'Producto añadido',
        `El product <span class='fw-bold'>${this.product.nombre} ha sido añadido a tu carrito de compras</span>`
      )
    },
    formatCurrency,
  },
}
</script>
