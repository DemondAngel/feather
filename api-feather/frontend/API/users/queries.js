import gql from 'graphql-tag'
import { productFragment } from '../products/fragments'

export const GET_USER = gql`
  query ($id: ID!) {
    user(id: $id) {
      id
      email
      username
      favoriteProducts {
        ...productInfo
      }
    }
  }
  ${productFragment}
`
