import { apolloClient } from '@/src/vue-apollo'
import { GET_ALL_PRODUCTS } from '@/API/products/gql'

export const getProducts = async () => {
  const { data } = await apolloClient.query({ query: GET_ALL_PRODUCTS })
  return data['products']
}
