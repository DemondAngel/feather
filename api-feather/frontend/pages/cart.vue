<template>
  <div class="container mt-4">
    <div class="display-4">Carrito de compras <i class="fas fa-shopping-cart"></i></div>

    <template v-if="cart.length > 0">
      <table class="table mt-5">
        <thead class="">
          <th>#</th>
          <th>Nombre del producto</th>
          <th>Precio venta</th>
          <th>Cantidad</th>
          <th>Subtotal</th>
          <th></th>
        </thead>
        <tbody>
          <tr v-for="(product, idx) in cart">
            <td>{{ idx + 1 }}</td>
            <td class="text-truncate text-secondary pointer" @click="seeDetail(product.slug)">
              {{ product.nombre }}
            </td>
            <td>{{ formatCurrency(product.precioVenta) }}</td>
            <td>
              <input
                min="1"
                step="1"
                type="number"
                class="form-control"
                :value="product.quantity"
                @input="changeQuantity($event, product.id)"
              />
            </td>
            <td>{{ formatCurrency(product.precioVenta * product.quantity) }}</td>
            <td><a class="link-primary pointer" @click="removeCartItem(product.id)">Quitar</a></td>
          </tr>
        </tbody>
      </table>
      <div class="text-end mt-4">
        <div class="display-6">Total: {{ formatCurrency(getFinalPrice) }}</div>
        <button class="btn btn-outline-secondary mt-2">Ir a pagar</button>
      </div>
    </template>

    <div class="alert alert-warning mt-4" role="alert" v-else>
      <h4 class="alert-heading">Carrito de compra vacío</h4>
      <p>
        No hay productos en tu carrito de compra por el momento, ve a al apartado de
        <NuxtLink to="/products">Productos</NuxtLink> para empezar a comprar
      </p>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'
import { formatCurrency } from '../static/formatDate'

export default {
  methods: {
    ...mapMutations({
      changeCart: 'addItemToCart',
      editCartItem: 'editCartItem',
      removeCartItem: 'removeCartItem',
    }),
    changeQuantity(event, productId) {
      const quantity = +event.target.value
      this.editCartItem({ productId, quantity })
    },
    seeDetail(productSlug) {
      this.$router.push({ name: 'products-slug', params: { slug: productSlug } })
    },
    formatCurrency,
  },
  computed: {
    ...mapGetters({ cart: 'getCart' }),
    getFinalPrice() {
      return this.cart.reduce((prev, { precioVenta, quantity }) => {
        return prev + precioVenta * quantity
      }, 0)
    },
  },
}
</script>
