import gql from 'graphql-tag'
import { productFragment } from './fragments'

export const GET_ALL_PRODUCTS = gql`
  query ($sort: String, $start: Int, $limit: Int, $where: JSON) {
    products(sort: $sort, start: $start, limit: $limit, where: $where) {
      ...productInfo
    }
  }
  ${productFragment}
`
