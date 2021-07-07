import gql from 'graphql-tag'

export const productFragment = gql`
  fragment productInfo on Product {
    id
    imagen {
      url
    }
    nombre
    descripcion
    precio
    precioVenta
    productores {
      email
      id
      role {
        name
      }
    }
    slug
    cantidad
  }
`
