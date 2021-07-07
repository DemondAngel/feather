<template>
  <div class="container mt-4">
    <div class="display-4">Busqueda por "{{ $route.params.search }}"</div>
    <ProductsView :products="products" class="my-4"></ProductsView>
  </div>
</template>

<script>
import { tc } from '../../static/try-catch-helper'
import { getProducts } from '../../API/products'

export default {
  async asyncData({ route }) {
    const { search } = route.params
    const where = { nombre_contains: search }
    const [response, error] = await tc(getProducts(where))
    return { products: response }
  },
}
</script>
