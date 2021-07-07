import { apolloClient } from '@/src/vue-apollo'
import { GET_ALL_PRODUCTS } from './queries'

export const getProducts = async where => {
  const { data } = await apolloClient.query({ query: GET_ALL_PRODUCTS, variables: { where } })
  return data['products']
}
