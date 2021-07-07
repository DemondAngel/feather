<template>
  <div>
    <div class="display-6">Productos</div>
    <table class="table mt-5">
      <thead class="">
        <th>#</th>
        <th>Nombre del producto</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Precio venta</th>
        <th></th>
      </thead>
      <tbody>
        <tr v-for="(product, idx) in products">
          <td>{{ idx + 1 }}</td>
          <td class="text-truncate text-secondary pointer" @click="seeDetail(product.slug)">
            {{ product.nombre }}
          </td>
          <td>
            <div class="text-truncate" style="max-width: 10rem">
              {{ product.descripcion }}
            </div>
          </td>
          <td>{{ formatCurrency(product.precio) }}</td>
          <td>{{ formatCurrency(product.precioVenta) }}</td>
          <td>
            <div class="d-flex align-items-center justify-content-end">
              <button class="btn btn-warning" content="Editar producto" v-tippy>
                <i class="fas fa-edit"></i>
              </button>
              <button class="btn btn-danger ms-2" content="Eliminar del sistema" v-tippy>
                <i class="fas fa-trash"></i>
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { tc } from '../../static/try-catch-helper'
import { getProducts } from '../../API/products'
import { formatCurrency } from '../../static/formatDate'

export default {
  async asyncData() {
    const [response, error] = await tc(getProducts())
    return { products: response }
  },
  methods: {
    seeDetail(productSlug) {
      this.$router.push({ name: 'products-slug', params: { slug: productSlug } })
    },
    formatCurrency,
  },
}
</script>
