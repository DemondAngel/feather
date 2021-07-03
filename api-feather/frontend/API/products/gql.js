import gql from 'graphql-tag'

export const GET_ALL_PRODUCTS = gql`
  query {
    products {
      id
      nombre
      descripcion
      imagen {
        url
      }
    }
  }
`
