<template>
  <div
    class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-3"
    v-if="products.length > 0"
  >
    <div class="col" v-for="product in products" :key="product.id">
      <ProductsCard :product="product"></ProductsCard>
    </div>
  </div>
  <div class="alert alert-warning mt-4" role="alert" v-else>
    <h4 class="alert-heading">Sin productos</h4>
    <p class="mb-0">No hay productos que mostrar</p>
  </div>
</template>

<script>
export default {
  props: {
    products: {
      type: Array,
      required: true,
      default: [],
    },
  },
}
</script>
