import gql from 'graphql-tag'

export const GET_ALL_ORDERS = gql`
  query ($sort: String, $start: Int, $limit: Int, $where: JSON) {
    pedidos(sort: $sort, start: $start, limit: $limit, where: $where) {
      id
      distribuidor {
        alias
      }
      producto_pedido {
        id
        precioVenta
        categorias {
          nombre
        }
        nombre
        cantidad
      }
    }
  }
`
