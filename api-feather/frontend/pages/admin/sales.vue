<template>
  <div>
    <div class="display-6">Ventas</div>
    <div class="mt-3 d-flex flex-wrap align-items-center justify-content-between">
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          v-model="dateType"
          name="inlineRadioOptions"
          id="inlineRadio1"
          value="year"
        />
        <label class="form-check-label" for="inlineRadio1">Año</label>
      </div>
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          v-model="dateType"
          name="inlineRadioOptions"
          id="inlineRadio2"
          value="month"
        />
        <label class="form-check-label" for="inlineRadio2">Mes</label>
      </div>
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          v-model="dateType"
          name="inlineRadioOptions"
          id="inlineRadio3"
          value="specific"
        />
        <label class="form-check-label" for="inlineRadio3">Fecha específica</label>
      </div>
      <div class="form-check">
        <select class="form-select" @change="doFilter">
          <option value="">--Distribuidor--</option>
          <option value="">Primer distribuidor</option>
          <option value="">Segundo distribuidor</option>
        </select>
      </div>
      <div class="form-check">
        <select class="form-select" @change="doFilter">
          <option value="">--Producto--</option>
          <option v-for="name in productsName" :value="name">{{ name }}</option>
        </select>
      </div>
    </div>
    <div class="mt-3">
      <input
        v-model="date"
        class="form-control"
        type="number"
        min="2020"
        step="1"
        @change="doFilter"
        v-if="dateType === 'year'"
      />
      <input
        @change="doFilter"
        v-model="date"
        class="form-control"
        type="month"
        v-if="dateType === 'month'"
      />
      <input
        @change="doFilter"
        v-model="date"
        class="form-control"
        type="date"
        v-if="dateType === 'specific'"
      />
    </div>

    <p class="fw-bold mt-4">Tipo de gráfico</p>
    <select class="form-select mb-3" v-model="graphic">
      <option value="line">Grafico de lineas</option>
      <option value="pie">Grafico de pastel</option>
    </select>
    <ejs-chart id="container" :primaryXAxis="primaryXAxis" v-if="graphic === 'line'">
      <e-series-collection>
        <e-series :dataSource="seriesData" type="Line" xName="month" yName="sales" name="Ventas">
        </e-series>
      </e-series-collection>
    </ejs-chart>

    <ejs-accumulationchart id="container" :primaryXAxis="primaryXAxis" v-if="graphic === 'pie'">
      <e-accumulation-series-collection>
        <e-accumulation-series :dataSource="seriesData" xName="month" yName="sales">
        </e-accumulation-series>
      </e-accumulation-series-collection>
    </ejs-accumulationchart>

    <div class="mt-3 mb-5 d-flex align-items-center justify-content-between">
      <div>
        <span class="fw-bold">Promedio de ventas: </span>
        <span> {{ getAverage }}</span>
      </div>
      <div>
        <span class="fw-bold">Venta máxima: </span>
        <span>{{ getMax }}</span>
      </div>
      <div>
        <span class="fw-bold">Venta mínima: </span>
        <span>{{ getMin }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { tc } from '../../static/try-catch-helper'
import { getOrders } from '../../API/orders'
import { getProducts } from '../../API/products'
import { ChartPlugin, LineSeries, Category, PieSeries } from '@syncfusion/ej2-vue-charts'

export default {
  async fetch() {
    const [orders] = await tc(getOrders(this.where))
    const [products] = await tc(getProducts())
    this.orders = orders
    this.productsName = products.map(product => product.nombre)
  },
  provide: {
    chart: [LineSeries, Category, PieSeries],
  },
  data: () => ({
    orders: [],
    productsName: [],
    where: {},
    date: 2020,
    dateType: 'year',
    title: 'Ventas',
    graphic: 'line',
    // prettier-ignore
    seriesData: [
      { month: 'Ene', sales: 35 }, { month: 'Feb', sales: 28 },
      { month: 'Mar', sales: 34 }, { month: 'Abr', sales: 32 },
      { month: 'May', sales: 40 }, { month: 'Jun', sales: 32 },
      { month: 'Jul', sales: 35 }, { month: 'Ago', sales: 55 },
      { month: 'Sep', sales: 38 }, { month: 'Oct', sales: 80 },
      { month: 'Nov', sales: 25 }, { month: 'Dic', sales: 32 }
    ],
    primaryXAxis: {
      valueType: 'Category',
    },
  }),
  methods: {
    doFilter() {
      const randomInt = (min = 30, max = 80) => Math.floor(Math.random() * (max - min) + 1) + min
      this.seriesData.forEach(data => (data.sales = randomInt()))
    },
  },
  computed: {
    getAverage() {
      const sum = this.seriesData.reduce((prev, data) => prev + data.sales, 0)
      return Math.round(sum / this.seriesData.length).toFixed(1)
    },
    getMax() {
      return Math.max(...this.seriesData.map(data => data.sales))
    },
    getMin() {
      return Math.min(...this.seriesData.map(data => data.sales))
    },
  },
  watch: {
    dateType() {
      this.doFilter()
    },
  },
}
</script>
