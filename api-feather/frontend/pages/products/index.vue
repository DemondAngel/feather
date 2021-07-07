<template>
  <div class="container mt-4">
    <div class="display-4">Productos</div>
    <ProductsView :products="products" class="my-4"></ProductsView>
  </div>
</template>

<script>
import { tc } from '../../static/try-catch-helper'
import { getProducts } from '../../API/products'

export default {
  async asyncData() {
    const [response, error] = await tc(getProducts())
    return { products: response }
  },
}
</script>
